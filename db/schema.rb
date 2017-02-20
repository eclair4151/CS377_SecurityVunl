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

ActiveRecord::Schema.define(version: 20170216164459) do

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "bank_name"
    t.text     "account_number"
    t.text     "routing_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_id2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id"
    t.index ["user_id2"], name: "index_friends_on_user_id2"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "requester_id"
    t.float    "amount"
    t.boolean  "fulfilled"
    t.text     "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["requester_id"], name: "index_transactions_on_requester_id"
    t.index ["sender_id"], name: "index_transactions_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.text     "session_id"
    t.text     "email"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "password"
    t.float    "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_users_on_session_id"
  end

end
