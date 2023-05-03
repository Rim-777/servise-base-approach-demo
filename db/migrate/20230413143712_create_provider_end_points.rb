# frozen_string_literal: true

class CreateProviderEndPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :provider_end_points do |t|
      t.integer :provider_id, null: false, index: true
      t.string :name, null: false
      t.string :code, null: false
      t.string :url, null: false, index: { unique: true }
      t.text :description, null: false

      t.timestamps
    end

    add_foreign_key :provider_end_points, :providers
  end
end
