ActiveRecord::Schema.define(version: 2021_02_09_202631) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "date"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
