# frozen_string_literal: true

class CreatePorts < ActiveRecord::Migration[7.0]
  def change
    create_table :ports do |t|
      t.string :name
      t.string :code, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
