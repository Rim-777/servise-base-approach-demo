# frozen_string_literal: true

class CreateSearchesTravelers < ActiveRecord::Migration[7.0]
  def change
    create_table :searches_travelers do |t|
      t.integer :search_id, null: false
      t.integer :traveler_id, null: false

      t.timestamps
    end

    add_index :searches_travelers, %i[search_id traveler_id]

    add_foreign_key :searches_travelers, :searches
    add_foreign_key :searches_travelers, :travelers
  end
end
