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

ActiveRecord::Schema.define(version: 20180203171913) do

  create_table "base_songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.string "song_code", default: "", null: false
    t.boolean "has_effect", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "effect_songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "base_song_id"
    t.integer "level"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_song_id"], name: "index_effect_songs_on_base_song_id"
  end

  create_table "room_states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "is_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "device_code", default: "", null: false
    t.bigint "toilets_id"
    t.bigint "room_state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_state_id"], name: "index_rooms_on_room_state_id"
    t.index ["toilets_id"], name: "index_rooms_on_toilets_id"
  end

  create_table "toilets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "longitude", default: "", null: false
    t.string "latitude", default: "", null: false
    t.integer "floor_no", default: 1, null: false
    t.integer "current_base_song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toilets_base_songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "toilets_id"
    t.bigint "base_song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_song_id"], name: "index_toilets_base_songs_on_base_song_id"
    t.index ["toilets_id"], name: "index_toilets_base_songs_on_toilets_id"
  end

  add_foreign_key "effect_songs", "base_songs"
  add_foreign_key "rooms", "room_states"
  add_foreign_key "rooms", "toilets", column: "toilets_id"
  add_foreign_key "toilets_base_songs", "base_songs"
  add_foreign_key "toilets_base_songs", "toilets", column: "toilets_id"
end
