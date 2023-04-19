# frozen_string_literal: true

require 'rails_helper'

shared_examples 'shared/services/examples/failure' do
  it 'looks like failure' do
    expect(subject).to be_failure
  end

  it 'contains expected errors' do
    expect(subject.errors).to eq(expected_error_messages)
  end
end
