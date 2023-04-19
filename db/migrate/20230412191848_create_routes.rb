# frozen_string_literal: true

class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.integer :origin_port_id, null: false
      t.integer :destination_port_id, null: false

      t.timestamps
    end

    add_index :routes, %i[origin_port_id destination_port_id], unique: true

    add_foreign_key :routes, :ports, column: :origin_port_id
    add_foreign_key :routes, :ports, column: :destination_port_id
  end
end
