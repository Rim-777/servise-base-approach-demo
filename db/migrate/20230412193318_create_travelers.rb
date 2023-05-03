# frozen_string_literal: true

class CreateTravelers < ActiveRecord::Migration[7.0]
  def change
    create_table :travelers do |t|
      t.string :type, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
