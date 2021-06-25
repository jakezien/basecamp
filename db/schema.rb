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

ActiveRecord::Schema.define(version: 2021_06_25_033908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "labels_topics", id: false, force: :cascade do |t|
    t.bigint "label_id", null: false
    t.bigint "topic_id", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "sender"
    t.string "subject"
    t.text "body"
    t.datetime "time_received"
    t.boolean "is_note_to_self"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_messages_on_topic_id"
  end

  create_table "stickies", force: :cascade do |t|
    t.text "body"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_stickies_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "message_id"
    t.bigint "sticky_id"
    t.index ["message_id"], name: "index_topics_on_message_id"
    t.index ["sticky_id"], name: "index_topics_on_sticky_id"
  end

  add_foreign_key "messages", "topics"
  add_foreign_key "stickies", "topics"
  add_foreign_key "topics", "messages"
  add_foreign_key "topics", "stickies"
end
