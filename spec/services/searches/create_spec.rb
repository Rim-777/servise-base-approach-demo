# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Searches::Create do
  describe '#call' do
    include_context 'shared/services/contexts/port_and_travelers'

    let!(:route) do
      create(:route, origin_port:, destination_port:)
    end

    let(:departure_date) { Date.today }

    let(:attributes) { { route:, departure_date: } }

    subject { described_class.call(**attributes) }

    it 'invokes the create method for the Search class' do
      expect(Search).to receive(:create!).with(**attributes)
      subject
    end

    context 'success' do
      include_examples 'shared/services/examples/success'

      it 'creates a new search' do
        expect { subject }.to change(Search, :count).from(0).to(1)
      end

      it 'returns search' do
        expect(subject.search).to be_a(Search)
      end

      it 'returns newly created search' do
        expect(subject.search).to have_attributes(route:, departure_date: departure_date.to_s)
      end
    end

    context 'failure' do
      before do
        attributes[:route] = nil
      end

      let(:expected_error_messages) do
        ['Validation failed: Route must exist']
      end

      include_examples 'shared/services/examples/failure'
    end
  end
end
