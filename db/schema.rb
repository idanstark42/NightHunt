# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160807161534) do

  create_table "achievement_successes", force: :cascade do |t|
    t.integer  "achievement_id"
    t.integer  "team_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "achievement_successes", ["achievement_id"], name: "index_achievement_successes_on_achievement_id"
  add_index "achievement_successes", ["team_id"], name: "index_achievement_successes_on_team_id"

  create_table "achievements", force: :cascade do |t|
    t.string   "description"
    t.integer  "points"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "areas", force: :cascade do |t|
    t.integer  "x_coord"
    t.integer  "y_coord"
    t.text     "riddle_text"
    t.string   "riddle_answer"
    t.integer  "points"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "controls", force: :cascade do |t|
    t.integer  "area_id"
    t.integer  "team_id"
    t.boolean  "isOver"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "controls", ["area_id"], name: "index_controls_on_area_id"
  add_index "controls", ["team_id"], name: "index_controls_on_team_id"

  create_table "flags", force: :cascade do |t|
    t.string   "code"
    t.integer  "area_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "flags", ["area_id"], name: "index_flags_on_area_id"
  add_index "flags", ["team_id"], name: "index_flags_on_team_id"

  create_table "puzzle_piece_reveals", force: :cascade do |t|
    t.integer  "puzzle_piece_id"
    t.integer  "team_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "puzzle_piece_reveals", ["puzzle_piece_id"], name: "index_puzzle_piece_reveals_on_puzzle_piece_id"
  add_index "puzzle_piece_reveals", ["team_id"], name: "index_puzzle_piece_reveals_on_team_id"

  create_table "puzzle_pieces", force: :cascade do |t|
    t.integer  "x_coord"
    t.integer  "y_coord"
    t.string   "image_uri"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "points"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "area_id"
  end

end
