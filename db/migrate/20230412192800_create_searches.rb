# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :departure_date, null: false
      t.integer :route_id, null: false, index: true

      t.timestamps
    end

    add_foreign_key :searches, :routes
  end
end
