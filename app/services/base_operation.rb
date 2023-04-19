# frozen_string_literal: true

module BaseOperation
  module ClassMethods
    def call(*args, **kwargs)
      new(*args, **kwargs).call
    end
  end

  def self.prepended(base)
    # See https://dry-rb.org/gems/dry-initializer/3.0/skip-undefined/
    base.extend Dry::Initializer[undefined: false]
    base.extend ClassMethods
  end

  # rubocop:disable Lint::InheritException
  %i[
    Interruption
  ].each { |exception| const_set(exception, Class.new(Exception)) }
  # rubocop:enable Lint::InheritException

  attr_reader :errors

  def initialize(*args, **kwargs)
    super(*args, **kwargs)
    @errors = []
  end

  def call
    super
    self
  rescue Interruption
    self
  end

  def success?
    !failure?
  end

  def failure?
    @errors.any?
  end

  private

  def fail!(messages, interrupt: false)
    @errors += Array(messages)
    interrupt! if interrupt
    self
  end

  def interrupt!
    raise Interruption
  end

  def interrupt_with_errors!(messages)
    fail!(messages, interrupt: true)
  end
end