Rails.application.routes.draw do
  api vendor_string: 'journey-api', default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :searches, only: %i[process_search] do
          post :process_search, on: :collection
        end
      end
    end
  end
end
