# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SearchesController, type: :request do
  include_context 'shared/contexts/searches/process_search'

  let(:headers) do
    { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
  end

  let(:response_body) { JSON.parse(response.body, symbolize_names: true) }

  let(:params) do
    {
      data: {
        route_attributes: {
          origin_port_code: rio_port_code,
          destination_port_code: morocco_port_code
        },
        departure_date: '2023-11-11',
        travelers_attributes: [
          {
            quantity: 1,
            type: 'Traveler::Adult'
          },
          {
            quantity: 1,
            type: 'Traveler::Child'
          }
        ]
      }
    }
  end

  def request
    post '/api/searches/process_search',
         params: params.to_json,
         headers:, xhr: true
  end

  context 'success' do
    before { request }

    it 'responds with http status 201' do
      expect(response.status).to eq(201)
    end

    it 'contains expected structure' do
      expect(response_body).to match(a_hash_including(:data))
    end
  end

  context 'failure' do
    before do
      params[:data][:departure_date] = '200-11-11'
      request
    end

    let(:expected_response) do
      { errors: [{ detail: { data: { departure_date: ['has invalid format'] } } }] }
    end

    it 'responds with http status 400' do
      expect(response.status).to eq(400)
    end

    it 'contains expected structure' do
      expect(response_body).to match(expected_response)
    end
  end
end
