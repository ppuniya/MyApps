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

ActiveRecord::Schema.define(version: 20141113195006) do

  create_table "admins", force: true do |t|
    t.integer  "board_id"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["board_id"], name: "index_admins_on_board_id"
  add_index "admins", ["list_id"], name: "index_admins_on_list_id"

  create_table "boardlists", force: true do |t|
    t.string   "perms"
    t.integer  "listposition"
    t.integer  "board_id"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boards", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "boardtype"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.integer  "friendshipstatus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", force: true do |t|
    t.string   "title"
    t.string   "listtype"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.integer  "board_id"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["board_id"], name: "index_members_on_board_id"
  add_index "members", ["list_id"], name: "index_members_on_list_id"

  create_table "shoppingitems", force: true do |t|
    t.string   "name"
    t.string   "details"
    t.float    "unitcost"
    t.float    "quantity"
    t.string   "unittype"
    t.string   "beststore"
    t.float    "minunitprice"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppingitems", ["list_id"], name: "index_shoppingitems_on_list_id"

  create_table "taskitems", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "duedate"
    t.integer  "volunteer_id"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taskitems", ["list_id"], name: "index_taskitems_on_list_id"

  create_table "users", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
