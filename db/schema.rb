# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_26_060711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "measures", force: :cascade do |t|
    t.float "data"
    t.string "unit"
    t.bigint "node_id"
    t.bigint "sensor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_measures_on_node_id"
    t.index ["sensor_id"], name: "index_measures_on_sensor_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "modelName"
    t.string "manufacterName"
    t.string "description"
    t.boolean "status", default: false
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "app_id"
    t.string "modulation"
    t.float "frequency"
    t.string "data_rate"
    t.string "gateway_id"
  end

  create_table "nodes_sensors", id: false, force: :cascade do |t|
    t.bigint "node_id"
    t.bigint "sensor_id"
    t.index ["node_id"], name: "index_nodes_sensors_on_node_id"
    t.index ["sensor_id"], name: "index_nodes_sensors_on_sensor_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
