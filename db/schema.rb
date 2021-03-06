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

ActiveRecord::Schema.define(version: 20151027204136) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "reviewed"
  end

  create_table "line_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "campaign_id"
    t.decimal  "booked_amount",   precision: 16, scale: 10
    t.decimal  "actual_amount",   precision: 16, scale: 10
    t.decimal  "adjustments",     precision: 16, scale: 10
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.decimal  "billable_amount", precision: 16, scale: 10
    t.boolean  "reviewed"
  end

  add_index "line_items", ["campaign_id"], name: "index_line_items_on_campaign_id"

end
