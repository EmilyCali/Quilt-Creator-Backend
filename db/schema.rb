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

ActiveRecord::Schema.define(version: 20170531182407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.string   "title"
    t.string   "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string   "color"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "block_id"
    t.integer  "piece_id"
    t.integer  "grid_position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["block_id"], name: "index_positions_on_block_id", using: :btree
    t.index ["piece_id"], name: "index_positions_on_piece_id", using: :btree
  end

  create_table "quilt_blocks", force: :cascade do |t|
    t.string   "img"
    t.integer  "num_pieces"
    t.integer  "piece_size"
    t.string   "difficulty"
    t.string   "title"
    t.string   "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "triangles"
    t.integer  "squares"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "years_quilting"
    t.string   "favorite_block"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "positions", "blocks"
  add_foreign_key "positions", "pieces"
end
