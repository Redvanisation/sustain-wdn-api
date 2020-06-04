# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_04_013727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "facilitators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "type"
    t.string "related_field"
    t.integer "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.text "description"
    t.string "industry"
    t.boolean "interships", default: false
    t.boolean "jobs", default: false
    t.boolean "other_opportunities", default: false
    t.text "related_subjects"
    t.text "related_activities"
    t.text "related_soft_skills"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations_users", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "user_id"
    t.index ["organization_id", "user_id"], name: "index_organizations_users_on_organization_id_and_user_id", unique: true
  end

  create_table "pathways", force: :cascade do |t|
    t.string "title"
    t.text "subtitle"
    t.text "description"
    t.text "education_levels"
    t.text "subjects"
    t.text "activities"
    t.text "soft_skills"
    t.text "support_types"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pathways_users", force: :cascade do |t|
    t.integer "pathway_id"
    t.integer "user_id"
    t.index ["pathway_id", "user_id"], name: "index_pathways_users_on_pathway_id_and_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "educartion_level"
    t.string "fav_subjects"
    t.string "fav_activities"
    t.string "soft_skills"
    t.string "support_types"
    t.integer "eager_scale"
    t.integer "facilitator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
