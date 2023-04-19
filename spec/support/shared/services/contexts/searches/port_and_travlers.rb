# frozen_string_literal: true

require 'rails_helper'

shared_context 'shared/services/contexts/port_and_travelers' do
  let(:rio_port_code) { 'rdj' }
  let(:morocco_port_code) { 'mrc' }
  let!(:origin_port) { create(:port, name: 'Rio de Janeiro', code: rio_port_code) }
  let!(:destination_port) { create(:port, name: 'Morocco', code: morocco_port_code) }
  let!(:adult_traveler) { create(:traveler, type: 'Traveler::Adult') }
  let!(:child_traveler) { create(:traveler, type: 'Traveler::Child') }
end
