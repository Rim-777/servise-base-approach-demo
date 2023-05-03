# frozen_string_literal: true

require 'rails_helper'

shared_examples 'shared/services/examples/success' do
  it 'looks like success' do
    expect(subject).to be_success
  end

  it 'does not contain errors' do
    expect(subject.errors).to be_empty
  end
end
