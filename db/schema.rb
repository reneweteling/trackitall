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

ActiveRecord::Schema.define(version: 20150312102818) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "name",                  limit: 256
    t.string   "address1",              limit: 256
    t.string   "address2",              limit: 256
    t.string   "address3",              limit: 256
    t.string   "country",               limit: 256
    t.string   "state_province_region", limit: 256
    t.string   "city_town",             limit: 256
    t.string   "zip_postal",            limit: 256
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "address_id", limit: 4
    t.string   "name",       limit: 256
    t.string   "telephone",  limit: 256
    t.string   "website",    limit: 256
    t.string   "email",      limit: 256
    t.string   "commerceno", limit: 256
    t.string   "taxno",      limit: 256
    t.string   "iban",       limit: 256
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["address_id"], name: "index_companies_on_address_id", using: :btree

  create_table "components", force: :cascade do |t|
    t.integer  "invoice_id",           limit: 4
    t.integer  "price_id",             limit: 4
    t.string   "name",                 limit: 256
    t.string   "description",          limit: 256
    t.float    "amount",               limit: 24
    t.decimal  "custom_price",                     precision: 16
    t.decimal  "custom_taxpercentage",             precision: 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["invoice_id"], name: "index_components_on_invoice_id", using: :btree
  add_index "components", ["price_id"], name: "index_components_on_price_id", using: :btree

  create_table "hours", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "project_id",  limit: 4
    t.integer  "hourtype_id", limit: 4
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hours", ["hourtype_id"], name: "index_hours_on_hourtype_id", using: :btree
  add_index "hours", ["project_id"], name: "index_hours_on_project_id", using: :btree
  add_index "hours", ["user_id"], name: "index_hours_on_user_id", using: :btree

  create_table "hourtypes", force: :cascade do |t|
    t.string   "name",       limit: 256
    t.integer  "company_id", limit: 4
    t.boolean  "billable",   limit: 1,   default: true
    t.integer  "price_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hourtypes", ["company_id"], name: "index_hourtypes_on_company_id", using: :btree
  add_index "hourtypes", ["price_id"], name: "index_hourtypes_on_price_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "project_id",    limit: 4
    t.integer  "template_id",   limit: 4
    t.datetime "invoicedate"
    t.integer  "invoicenumber", limit: 4
    t.boolean  "credit",        limit: 1,                    default: false, null: false
    t.boolean  "locked",        limit: 1,                    default: false, null: false
    t.string   "concerns",      limit: 256
    t.decimal  "tax",                         precision: 16
    t.decimal  "total",                       precision: 16
    t.text     "raw_data",      limit: 65535
    t.text     "raw_html",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["project_id"], name: "index_invoices_on_project_id", using: :btree
  add_index "invoices", ["template_id"], name: "index_invoices_on_template_id", using: :btree
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.integer  "company_id",    limit: 4
    t.string   "name",          limit: 256
    t.decimal  "price",                     precision: 16
    t.decimal  "taxpercentage",             precision: 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["company_id"], name: "index_prices_on_company_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "company_id",   limit: 4
    t.string   "name",         limit: 256
    t.string   "descrtiption", limit: 256
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["company_id"], name: "index_projects_on_company_id", using: :btree

  create_table "templates", force: :cascade do |t|
    t.string   "name",         limit: 256
    t.string   "descrtiption", limit: 256
    t.integer  "user_id",      limit: 4
    t.text     "template",     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "templates", ["user_id"], name: "index_templates_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "address_id",         limit: 4
    t.integer  "invoice_address_id", limit: 4
    t.integer  "company_id",         limit: 4
    t.string   "name",               limit: 256
    t.string   "firstname",          limit: 256
    t.string   "lastname",           limit: 256
    t.string   "email",              limit: 255, default: "",    null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
    t.boolean  "admin",              limit: 1,   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id", using: :btree
  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["invoice_address_id"], name: "index_users_on_invoice_address_id", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "components", "invoices"
  add_foreign_key "components", "prices"
  add_foreign_key "hours", "hourtypes"
  add_foreign_key "hours", "projects"
  add_foreign_key "hours", "users"
  add_foreign_key "hourtypes", "companies"
  add_foreign_key "hourtypes", "prices"
  add_foreign_key "invoices", "projects"
  add_foreign_key "invoices", "templates"
  add_foreign_key "invoices", "users"
  add_foreign_key "prices", "companies"
  add_foreign_key "projects", "companies"
  add_foreign_key "templates", "users"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "companies"
end
