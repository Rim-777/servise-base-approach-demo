# frozen_string_literal: true

class Provider < ApplicationRecord
  has_many :provider_end_points,
           class_name: Provider::EndPoint.name,
           inverse_of: :provider,
           dependent: :destroy
end
