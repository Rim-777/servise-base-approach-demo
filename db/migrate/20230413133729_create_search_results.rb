# frozen_string_literal: true

class CreateSearchResults < ActiveRecord::Migration[7.0]
  def change
    create_table :search_results do |t|
      t.integer :search_id, index: true
      t.string :origin_port, null: false
      t.string :destination_port, null: false
      t.string :departure_date, null: false
      t.string :traveler_class, null: false
      t.decimal :price, precision: 8, scale: 2, null: false

      t.timestamps
    end

    add_foreign_key :search_results, :searches
  end
end
