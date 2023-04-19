# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_13_143712) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ports", force: :cascade do |t|
    t.string "name"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_ports_on_code", unique: true
  end

  create_table "provider_end_points", force: :cascade do |t|
    t.integer "provider_id", null: false
    t.string "name", null: false
    t.string "code", null: false
    t.string "url", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_provider_end_points_on_provider_id"
    t.index ["url"], name: "index_provider_end_points_on_url", unique: true
  end

  create_table "providers", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_providers_on_code", unique: true
  end

  create_table "routes", force: :cascade do |t|
    t.integer "origin_port_id", null: false
    t.integer "destination_port_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["origin_port_id", "destination_port_id"], name: "index_routes_on_origin_port_id_and_destination_port_id", unique: true
  end

  create_table "search_results", force: :cascade do |t|
    t.integer "search_id"
    t.string "origin_port", null: false
    t.string "destination_port", null: false
    t.string "departure_date", null: false
    t.string "traveler_class", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["search_id"], name: "index_search_results_on_search_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "departure_date", null: false
    t.integer "route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_searches_on_route_id"
  end

  create_table "searches_travelers", force: :cascade do |t|
    t.integer "search_id", null: false
    t.integer "traveler_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["search_id", "traveler_id"], name: "index_searches_travelers_on_search_id_and_traveler_id", unique: true
  end

  create_table "travelers", force: :cascade do |t|
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_travelers_on_type", unique: true
  end

  add_foreign_key "provider_end_points", "providers"
  add_foreign_key "routes", "ports", column: "destination_port_id"
  add_foreign_key "routes", "ports", column: "origin_port_id"
  add_foreign_key "search_results", "searches"
  add_foreign_key "searches", "routes"
  add_foreign_key "searches_travelers", "searches"
  add_foreign_key "searches_travelers", "travelers"
end
