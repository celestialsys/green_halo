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

ActiveRecord::Schema.define(version: 20150828070147) do

  create_table "admin_roles", force: :cascade do |t|
    t.integer "domain_id",   limit: 4,                       null: false
    t.string  "name",        limit: 30,                      null: false
    t.string  "description", limit: 255,                     null: false
    t.string  "list_type",   limit: 5,     default: "white", null: false
    t.text    "list_data",   limit: 65535,                   null: false
  end

  create_table "admins", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4,                     null: false
    t.string   "username",   limit: 30,                    null: false
    t.string   "password",   limit: 30,                    null: false
    t.integer  "logins",     limit: 4,                     null: false
    t.string   "ipaddr",     limit: 15,                    null: false
    t.datetime "thedate",                                  null: false
    t.datetime "last_login",                               null: false
    t.string   "allow",      limit: 5,   default: "false", null: false
    t.string   "roles",      limit: 255,                   null: false
    t.string   "enabled",    limit: 5,                     null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,                       null: false
    t.integer  "city_id",   limit: 4,                       null: false
    t.string   "title",     limit: 80,                      null: false
    t.text     "summary",   limit: 65535,                   null: false
    t.text     "body",      limit: 65535,                   null: false
    t.text     "efields",   limit: 65535,                   null: false
    t.datetime "thedate",                                   null: false
    t.datetime "published",                                 null: false
    t.datetime "updated",                                   null: false
    t.integer  "hits",      limit: 4,     default: 0,       null: false
    t.integer  "comments",  limit: 4,     default: 0,       null: false
    t.integer  "points",    limit: 4,                       null: false
    t.integer  "votes",     limit: 4,                       null: false
    t.string   "keywords",  limit: 160,                     null: false
    t.string   "featured",  limit: 5,     default: "false", null: false
    t.string   "enabled",   limit: 5,     default: "false", null: false
    t.integer  "views",     limit: 4,     default: 0,       null: false
  end

  create_table "banners", primary_key: "banner_id", force: :cascade do |t|
    t.integer "slot",  limit: 4,   default: 0
    t.string  "image", limit: 128
    t.string  "url",   limit: 255
    t.string  "name",  limit: 255
  end

  create_table "categories", force: :cascade do |t|
    t.integer "domain_id",   limit: 4,     default: 0,  null: false
    t.string  "name",        limit: 150,                null: false
    t.string  "sname",       limit: 30,    default: "", null: false
    t.text    "description", limit: 65535,              null: false
    t.string  "counts",      limit: 256,                null: false
  end

  add_index "categories", ["domain_id"], name: "domain_id", using: :btree
  add_index "categories", ["sname"], name: "sname", using: :btree

  create_table "checklist_items", force: :cascade do |t|
    t.integer "domain_id", limit: 4,  null: false
    t.integer "city_id",   limit: 4,  null: false
    t.string  "name",      limit: 60, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.integer  "county_id",         limit: 4,                                                     null: false
    t.integer  "domain_id",         limit: 4,                                                     null: false
    t.string   "name",              limit: 60,                                                    null: false
    t.integer  "contacts_count",    limit: 4,                                                     null: false
    t.integer  "coupons_count",     limit: 4,                                                     null: false
    t.string   "verified",          limit: 5,                                                     null: false
    t.string   "visible",           limit: 5,                              default: "false",      null: false
    t.datetime "thedate",                                                                         null: false
    t.string   "coupons_available", limit: 11,                             default: "0"
    t.integer  "coupons_used",      limit: 4,                                                     null: false
    t.integer  "coupons_created",   limit: 4,                                                     null: false
    t.decimal  "diversion_rate",                  precision: 10, scale: 2, default: 50.0,         null: false
    t.decimal  "diversion_ss_rate",               precision: 10, scale: 2,                        null: false
    t.string   "plan_option",       limit: 10,                             default: "checkboxes", null: false
    t.text     "terms",             limit: 65535,                                                 null: false
    t.text     "efields",           limit: 65535,                                                 null: false
    t.decimal  "r",                               precision: 10, scale: 2,                        null: false
    t.decimal  "d",                               precision: 10, scale: 2,                        null: false
    t.decimal  "sr",                              precision: 10, scale: 2,                        null: false
  end

  create_table "cities_checklist_items", force: :cascade do |t|
    t.integer "domain_id",         limit: 4, null: false
    t.integer "checklist_item_id", limit: 4, null: false
    t.integer "city_id",           limit: 4, null: false
  end

  create_table "cities_construction_types", force: :cascade do |t|
    t.integer "domain_id",            limit: 4,                          null: false
    t.integer "city_id",              limit: 4,                          null: false
    t.integer "construction_type_id", limit: 4,                          null: false
    t.decimal "ctt_salvage",                    precision: 10, scale: 2, null: false
    t.decimal "ctt_dispose",                    precision: 10, scale: 2, null: false
    t.decimal "ctt_recycle",                    precision: 10, scale: 2, null: false
  end

  create_table "cities_contacts", force: :cascade do |t|
    t.integer "domain_id", limit: 4,  null: false
    t.integer "city_id",   limit: 4,  null: false
    t.integer "county_id", limit: 4,  null: false
    t.string  "name",      limit: 30, null: false
    t.string  "position",  limit: 40, null: false
    t.string  "email",     limit: 30, null: false
    t.string  "phone",     limit: 20, null: false
  end

  create_table "cities_facilities", force: :cascade do |t|
    t.integer "domain_id",   limit: 4, null: false
    t.integer "city_id",     limit: 4, null: false
    t.integer "facility_id", limit: 4, null: false
  end

  add_index "cities_facilities", ["city_id"], name: "city_id_idx", using: :btree
  add_index "cities_facilities", ["facility_id"], name: "facility_id_idx", using: :btree

  create_table "cities_haulers", id: false, force: :cascade do |t|
    t.integer "domain_id", limit: 4, null: false
    t.integer "city_id",   limit: 4, null: false
    t.integer "hauler_id", limit: 4, null: false
  end

  create_table "cities_materials", force: :cascade do |t|
    t.integer "domain_id",       limit: 4,                                            null: false
    t.integer "material_id",     limit: 4,                                            null: false
    t.integer "city_id",         limit: 4,                                            null: false
    t.string  "enabled_salvage", limit: 5,                          default: "false", null: false
    t.string  "enabled_recycle", limit: 5,                          default: "false", null: false
    t.string  "enabled_dispose", limit: 5,                          default: "false", null: false
    t.decimal "total_recycled",            precision: 10, scale: 2,                   null: false
    t.decimal "total_disposed",            precision: 10, scale: 2,                   null: false
    t.decimal "total_salvaged",            precision: 10, scale: 2,                   null: false
  end

  create_table "cities_users", force: :cascade do |t|
    t.integer "city_id",          limit: 4,                   null: false
    t.integer "domain_id",        limit: 4,                   null: false
    t.integer "user_id",          limit: 4,                   null: false
    t.string  "notify_submitted", limit: 5, default: "false", null: false
    t.string  "notify_final",     limit: 5, default: "false", null: false
    t.string  "notify_message",   limit: 5, default: "false", null: false
  end

  create_table "construction_types", force: :cascade do |t|
    t.integer "domain_id", limit: 4,                      null: false
    t.integer "city_id",   limit: 4,                      null: false
    t.string  "name",      limit: 60,                     null: false
    t.string  "ctype",     limit: 8,  default: "project", null: false
  end

  create_table "contractors", force: :cascade do |t|
    t.integer "domain_id", limit: 4,                                                null: false
    t.integer "city_id",   limit: 4,                                                null: false
    t.integer "county_id", limit: 4,                                                null: false
    t.string  "name",      limit: 60,                                               null: false
    t.string  "street",    limit: 80,                                               null: false
    t.string  "state",     limit: 2,                                                null: false
    t.string  "city",      limit: 30,                                               null: false
    t.string  "zipcode",   limit: 10,                                               null: false
    t.string  "county",    limit: 30,                                               null: false
    t.string  "phone",     limit: 20,                                               null: false
    t.string  "fax",       limit: 20,                                               null: false
    t.string  "url",       limit: 80,                                               null: false
    t.integer "credits",   limit: 4,                                                null: false
    t.text    "efields",   limit: 65535,                                            null: false
    t.integer "thedate",   limit: 4,                                                null: false
    t.string  "verified",  limit: 5,                              default: "false", null: false
    t.decimal "c_r",                     precision: 10, scale: 2,                   null: false
    t.decimal "c_d",                     precision: 10, scale: 2,                   null: false
    t.decimal "c_sr",                    precision: 10, scale: 2,                   null: false
  end

  create_table "contractors_notify", force: :cascade do |t|
    t.integer  "domain_id",        limit: 4,                    null: false
    t.integer  "contractor_id",    limit: 4,                    null: false
    t.string   "email",            limit: 80,                   null: false
    t.string   "notify_approved",  limit: 5,  default: "false", null: false
    t.string   "notify_finalized", limit: 5,  default: "false", null: false
    t.string   "notify_message",   limit: 5,  default: "false", null: false
    t.datetime "thedate",                                       null: false
  end

  create_table "contractors_pms", primary_key: "contractor_pm_id", force: :cascade do |t|
    t.integer  "domain_id",     limit: 4,  null: false
    t.integer  "contractor_id", limit: 4,  null: false
    t.string   "name",          limit: 60, null: false
    t.string   "position",      limit: 30, null: false
    t.string   "email",         limit: 60, null: false
    t.string   "phone",         limit: 20, null: false
    t.string   "cell",          limit: 20, null: false
    t.datetime "thedate",                  null: false
    t.integer  "city_id",       limit: 4
  end

  create_table "contractors_pms_backup", primary_key: "CONTRACTOR_PM_ID", force: :cascade do |t|
    t.integer  "DID",           limit: 4,     null: false
    t.integer  "CONTRACTOR_ID", limit: 4,     null: false
    t.string   "name",          limit: 60,    null: false
    t.string   "position",      limit: 30,    null: false
    t.string   "email",         limit: 60,    null: false
    t.string   "phone",         limit: 20,    null: false
    t.string   "cell",          limit: 20,    null: false
    t.datetime "thedate",                     null: false
    t.integer  "CITY_ID",       limit: 4
    t.text     "efields",       limit: 65535
  end

  create_table "contractors_scs", primary_key: "contractor_sc_id", force: :cascade do |t|
    t.integer  "domain_id",     limit: 4,  null: false
    t.integer  "contractor_id", limit: 4,  null: false
    t.string   "company",       limit: 80, null: false
    t.string   "name",          limit: 60, null: false
    t.string   "position",      limit: 30, null: false
    t.string   "email",         limit: 60, null: false
    t.string   "phone",         limit: 20, null: false
    t.datetime "thedate",                  null: false
    t.string   "street",        limit: 80, null: false
    t.string   "city",          limit: 40, null: false
    t.string   "state",         limit: 2,  null: false
    t.string   "zipcode",       limit: 10, null: false
    t.integer  "city_id",       limit: 4
  end

  create_table "contractors_scs_backup", primary_key: "CONTRACTOR_SC_ID", force: :cascade do |t|
    t.integer  "DID",           limit: 4,  null: false
    t.integer  "CONTRACTOR_ID", limit: 4,  null: false
    t.string   "company",       limit: 80, null: false
    t.string   "name",          limit: 60, null: false
    t.string   "position",      limit: 30, null: false
    t.string   "email",         limit: 60, null: false
    t.string   "phone",         limit: 20, null: false
    t.datetime "thedate",                  null: false
    t.string   "street",        limit: 80, null: false
    t.string   "city",          limit: 40, null: false
    t.string   "state",         limit: 2,  null: false
    t.string   "zipcode",       limit: 10, null: false
    t.integer  "CITY_ID",       limit: 4
  end

  create_table "contractors_users", force: :cascade do |t|
    t.integer "domain_id",     limit: 4, null: false
    t.integer "contractor_id", limit: 4, null: false
    t.integer "city_id",       limit: 4, null: false
    t.integer "county_id",     limit: 4, null: false
    t.integer "user_id",       limit: 4, null: false
  end

  create_table "converted_ticket_pdf_log", force: :cascade do |t|
    t.integer  "TICKET_RD_ID", limit: 4,   null: false
    t.string   "full_path",    limit: 255, null: false
    t.datetime "date"
  end

  create_table "corporate", primary_key: "corporate_id", force: :cascade do |t|
    t.integer "domain_id", limit: 4
    t.integer "city_id",   limit: 4
    t.integer "county_id", limit: 4
    t.integer "user_id",   limit: 4
    t.string  "name",      limit: 60
    t.string  "street",    limit: 80
    t.string  "state",     limit: 2
    t.string  "city",      limit: 30
    t.string  "zipcode",   limit: 10
    t.string  "county",    limit: 30
    t.string  "phone",     limit: 20
    t.string  "fax",       limit: 20
    t.string  "url",       limit: 80
    t.text    "efields",   limit: 65535
  end

  create_table "corporate_users", force: :cascade do |t|
    t.integer "domain_id",    limit: 4
    t.integer "corporate_id", limit: 4
    t.integer "user_id",      limit: 4
    t.integer "city_id",      limit: 4
    t.integer "county_id",    limit: 4
  end

  create_table "counties", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,  null: false
    t.string   "name",      limit: 60, null: false
    t.string   "state",     limit: 2,  null: false
    t.string   "verified",  limit: 5,  null: false
    t.integer  "coupons",   limit: 4,  null: false
    t.datetime "thedate",              null: false
  end

  create_table "counties_users", force: :cascade do |t|
    t.integer "domain_id", limit: 4, null: false
    t.integer "user_id",   limit: 4, null: false
    t.integer "county_id", limit: 4, null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.integer  "domain_id",       limit: 4,                       null: false
    t.integer  "city_id",         limit: 4,                       null: false
    t.integer  "contractor_id",   limit: 4,                       null: false
    t.string   "code",            limit: 15,                      null: false
    t.string   "email",           limit: 80,                      null: false
    t.string   "name",            limit: 60,                      null: false
    t.string   "company",         limit: 60,                      null: false
    t.string   "permit",          limit: 20,                      null: false
    t.datetime "thedate",                                         null: false
    t.string   "redeemed",        limit: 5,     default: "false", null: false
    t.datetime "redeemed_date"
    t.datetime "expiration_date"
    t.string   "address",         limit: 256
    t.string   "unlimited",       limit: 12,    default: "false"
    t.integer  "redeemed_count",  limit: 4,     default: 0
    t.text     "coupons_efield",  limit: 65535
  end

  create_table "demo_request", force: :cascade do |t|
    t.string   "name",         limit: 255,   null: false
    t.string   "company",      limit: 255
    t.string   "website",      limit: 255
    t.string   "email",        limit: 255
    t.string   "phone",        limit: 64
    t.datetime "created_at"
    t.datetime "request_date"
    t.string   "time_to_call", limit: 64
    t.text     "comment",      limit: 65535
  end

  create_table "domains", force: :cascade do |t|
    t.integer  "Pdomain_id",      limit: 4,                       null: false
    t.integer  "children",        limit: 4,                       null: false
    t.string   "username",        limit: 30,    default: "",      null: false
    t.string   "password",        limit: 30,    default: "",      null: false
    t.datetime "license_expires",                                 null: false
    t.string   "license_string",  limit: 255,                     null: false
    t.string   "email_address",   limit: 80,                      null: false
    t.string   "email_from",      limit: 200,                     null: false
    t.string   "domain_name",     limit: 80,                      null: false
    t.string   "domain_aliases",  limit: 255,                     null: false
    t.string   "site_name",       limit: 80,                      null: false
    t.datetime "thedate",                                         null: false
    t.datetime "last_login",                                      null: false
    t.integer  "hits",            limit: 8,     default: 0,       null: false
    t.string   "enabled",         limit: 5,     default: "false", null: false
    t.text     "template",        limit: 65535,                   null: false
  end

  add_index "domains", ["username"], name: "username", unique: true, using: :btree

  create_table "esb_messages", force: :cascade do |t|
    t.integer  "domain_id",      limit: 4,                       null: false
    t.string   "src_extension",  limit: 30
    t.string   "src_method",     limit: 30
    t.string   "dest_extension", limit: 30,                      null: false
    t.string   "dest_method",    limit: 30,                      null: false
    t.text     "dest_params",    limit: 65535,                   null: false
    t.string   "ret_extension",  limit: 30
    t.string   "ret_method",     limit: 30
    t.datetime "thedate",                                        null: false
    t.string   "pending",        limit: 5,     default: "false", null: false
  end

  create_table "esb_scheduler", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.string   "extension", limit: 30,    null: false
    t.string   "method",    limit: 30,    null: false
    t.text     "frequency", limit: 65535, null: false
    t.datetime "lastrun",                 null: false
    t.integer  "runs",      limit: 4,     null: false
    t.datetime "thedate",                 null: false
  end

  create_table "extensions", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.string   "name",      limit: 30,    null: false
    t.text     "data",      limit: 65535, null: false
    t.datetime "updated",                 null: false
  end

  add_index "extensions", ["domain_id", "name"], name: "domain_id", unique: true, using: :btree

  create_table "extensions_data", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.string   "extension", limit: 30,    null: false
    t.text     "data",      limit: 65535, null: false
    t.datetime "thedate",                 null: false
  end

  add_index "extensions_data", ["domain_id", "id", "extension"], name: "domain_id", using: :btree

  create_table "extensions_debug", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,   null: false
    t.string   "extension", limit: 30,  null: false
    t.string   "message",   limit: 255, null: false
    t.string   "ipaddr",    limit: 15,  null: false
    t.datetime "thedate",               null: false
  end

  create_table "extensions_errors", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.text     "message",   limit: 65535, null: false
    t.datetime "thedate",                 null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.integer "domain_id",       limit: 4,                              null: false
    t.integer "city_id",         limit: 4,                              null: false
    t.integer "county_id",       limit: 4,                              null: false
    t.integer "contractor_id",   limit: 4,                              null: false
    t.string  "name",            limit: 80,                             null: false
    t.string  "url",             limit: 128,                            null: false
    t.string  "street",          limit: 80,                             null: false
    t.string  "zipcode",         limit: 10,                             null: false
    t.string  "phone",           limit: 30,                             null: false
    t.string  "fax",             limit: 30,                             null: false
    t.string  "hours",           limit: 40,                             null: false
    t.string  "email",           limit: 50,                             null: false
    t.text    "notes",           limit: 65535,                          null: false
    t.decimal "div_without_adc",               precision: 10, scale: 2, null: false
    t.decimal "div_with_adc",                  precision: 10, scale: 2, null: false
    t.decimal "div_leed_gpr",                  precision: 10, scale: 2, null: false
    t.integer "materials_count", limit: 4,                              null: false
    t.string  "enabled",         limit: 5,                              null: false
    t.string  "addkey",          limit: 32,                             null: false
    t.string  "info_project_id", limit: 11
  end

  create_table "facilities_materials", force: :cascade do |t|
    t.integer "domain_id",       limit: 4,                   null: false
    t.integer "facility_id",     limit: 4,                   null: false
    t.integer "material_id",     limit: 4,                   null: false
    t.integer "conversion_rate", limit: 4,                   null: false
    t.integer "order_num",       limit: 4,                   null: false
    t.string  "donation",        limit: 5, default: "false", null: false
    t.integer "conversion_leed", limit: 4,                   null: false
  end

  add_index "facilities_materials", ["material_id"], name: "material_id_idx", using: :btree

  create_table "faqs", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,                       null: false
    t.integer  "city_id",   limit: 4,                       null: false
    t.string   "question",  limit: 80,                      null: false
    t.text     "answer",    limit: 65535,                   null: false
    t.datetime "thedate",                                   null: false
    t.datetime "published",                                 null: false
    t.datetime "updated",                                   null: false
    t.integer  "hits",      limit: 4,     default: 0,       null: false
    t.integer  "comments",  limit: 4,     default: 0,       null: false
    t.integer  "points",    limit: 4,                       null: false
    t.integer  "votes",     limit: 4,                       null: false
    t.string   "keywords",  limit: 160,                     null: false
    t.string   "featured",  limit: 5,     default: "false", null: false
    t.string   "enabled",   limit: 5,     default: "false", null: false
    t.integer  "views",     limit: 4,     default: 0,       null: false
    t.integer  "order_num", limit: 4,                       null: false
    t.string   "image",     limit: 40,                      null: false
  end

  create_table "formdata", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.integer  "user_id",   limit: 4,     null: false
    t.string   "email",     limit: 60,    null: false
    t.string   "form",      limit: 30,    null: false
    t.text     "data",      limit: 65535, null: false
    t.string   "ipaddr",    limit: 15,    null: false
    t.datetime "thedate",                 null: false
    t.integer  "flag",      limit: 1,     null: false
  end

  create_table "forms", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.string   "name",      limit: 40,    null: false
    t.text     "xml",       limit: 65535, null: false
    t.datetime "thedate",                 null: false
  end

  create_table "friendly_urls", force: :cascade do |t|
    t.integer "domain_id", limit: 4,   null: false
    t.string  "name",      limit: 30,  null: false
    t.string  "pattern",   limit: 255, null: false
    t.string  "request",   limit: 255, null: false
    t.integer "order_num", limit: 1,   null: false
    t.string  "extension", limit: 30,  null: false
    t.string  "method",    limit: 30,  null: false
    t.integer "variable",  limit: 1,   null: false
    t.string  "remap",     limit: 40,  null: false
  end

  create_table "geoip", id: false, force: :cascade do |t|
    t.string  "begin_ip",     limit: 15, null: false
    t.string  "end_ip",       limit: 15, null: false
    t.integer "begin_num",    limit: 8,  null: false
    t.integer "end_num",      limit: 8,  null: false
    t.string  "country_code", limit: 2,  null: false
    t.string  "country_name", limit: 30, null: false
  end

  add_index "geoip", ["begin_num"], name: "begin_num", using: :btree
  add_index "geoip", ["end_num"], name: "end_num", using: :btree

  create_table "haulers", primary_key: "hauler_id", force: :cascade do |t|
    t.integer "domain_id",     limit: 4,   null: false
    t.integer "county_id",     limit: 4,   null: false
    t.integer "city_id",       limit: 4,   null: false
    t.integer "contractor_id", limit: 4,   null: false
    t.string  "name",          limit: 80,  null: false
    t.string  "contact",       limit: 80,  null: false
    t.string  "url",           limit: 128, null: false
    t.string  "street",        limit: 80,  null: false
    t.string  "city",          limit: 30,  null: false
    t.string  "state",         limit: 2,   null: false
    t.string  "zipcode",       limit: 10,  null: false
    t.string  "phone",         limit: 30,  null: false
    t.string  "email",         limit: 30,  null: false
    t.string  "enabled",       limit: 5,   null: false
    t.string  "hauling",       limit: 5,   null: false
    t.string  "debrisbox",     limit: 5,   null: false
  end

  create_table "haulers_backup", primary_key: "HAULER_ID", force: :cascade do |t|
    t.integer "DID",           limit: 4,   null: false
    t.integer "COUNTY_ID",     limit: 4,   null: false
    t.integer "CITY_ID",       limit: 4,   null: false
    t.integer "CONTRACTOR_ID", limit: 4,   null: false
    t.string  "name",          limit: 80,  null: false
    t.string  "contact",       limit: 80,  null: false
    t.string  "url",           limit: 128, null: false
    t.string  "street",        limit: 80,  null: false
    t.string  "city",          limit: 30,  null: false
    t.string  "state",         limit: 2,   null: false
    t.string  "zipcode",       limit: 10,  null: false
    t.string  "phone",         limit: 30,  null: false
    t.string  "email",         limit: 30,  null: false
    t.string  "enabled",       limit: 5,   null: false
    t.string  "hauling",       limit: 5,   null: false
    t.string  "debrisbox",     limit: 5,   null: false
  end

  create_table "mail", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4,                       null: false
    t.string   "from_email", limit: 40,                      null: false
    t.string   "to_email",   limit: 40,                      null: false
    t.string   "from_name",  limit: 40,                      null: false
    t.string   "to_name",    limit: 40,                      null: false
    t.string   "subject",    limit: 120,                     null: false
    t.text     "body",       limit: 65535,                   null: false
    t.text     "html",       limit: 65535,                   null: false
    t.datetime "thedate",                                    null: false
    t.datetime "sentdate",                                   null: false
    t.string   "sent",       limit: 5,     default: "false", null: false
  end

  add_index "mail", ["sent"], name: "sent", using: :btree

  create_table "mail_errors", force: :cascade do |t|
    t.string   "email",     limit: 60,                    null: false
    t.string   "error",     limit: 256,                   null: false
    t.datetime "thedate",                                 null: false
    t.string   "processed", limit: 5,   default: "false", null: false
  end

  create_table "material_image", force: :cascade do |t|
    t.integer "id_material", limit: 4,     null: false
    t.text    "file",        limit: 65535, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.integer "domain_id",        limit: 4,                                                null: false
    t.string  "name",             limit: 60,                                               null: false
    t.text    "description",      limit: 65535,                                            null: false
    t.decimal "density",                        precision: 10, scale: 5,                   null: false
    t.integer "order_num",        limit: 1,                                                null: false
    t.string  "enable_rd",        limit: 5,                              default: "false", null: false
    t.string  "enable_sr",        limit: 5,                              default: "false", null: false
    t.integer "default_div_rate", limit: 4
  end

  create_table "materials_salvage", force: :cascade do |t|
    t.integer "domain_id", limit: 4,  null: false
    t.string  "name",      limit: 30, null: false
  end

  create_table "messages_incoming", force: :cascade do |t|
    t.integer  "message_id_start", limit: 4,                       null: false
    t.integer  "domain_id",        limit: 4,                       null: false
    t.integer  "user_id",          limit: 4,     default: 0,       null: false
    t.integer  "user_id_FROM",     limit: 4,     default: 0,       null: false
    t.integer  "project_id",       limit: 4,                       null: false
    t.integer  "contractor_id",    limit: 4,                       null: false
    t.integer  "city_id",          limit: 4,                       null: false
    t.integer  "county_id",        limit: 4,                       null: false
    t.string   "folder",           limit: 40,                      null: false
    t.string   "subject",          limit: 80,                      null: false
    t.text     "message",          limit: 65535,                   null: false
    t.datetime "thedate",                                          null: false
    t.string   "status",           limit: 7,     default: "new",   null: false
    t.string   "featured",         limit: 5,     default: "false", null: false
    t.string   "to",               limit: 10,                      null: false
    t.string   "from",             limit: 10,                      null: false
    t.string   "seen_contractor",  limit: 5,     default: "false", null: false
    t.string   "seen_city",        limit: 5,     default: "false", null: false
    t.string   "seen_county",      limit: 5,     default: "false", null: false
    t.string   "multiple",         limit: 5,     default: "false", null: false
    t.string   "type",             limit: 128
  end

  add_index "messages_incoming", ["user_id"], name: "user_id", using: :btree

  create_table "messages_outgoing", force: :cascade do |t|
    t.integer  "message_id_start", limit: 4,                       null: false
    t.integer  "domain_id",        limit: 4,                       null: false
    t.integer  "user_id",          limit: 4,     default: 0,       null: false
    t.integer  "user_id_TO",       limit: 4,     default: 0,       null: false
    t.string   "folder",           limit: 40,                      null: false
    t.string   "subject",          limit: 80,                      null: false
    t.text     "message",          limit: 65535,                   null: false
    t.datetime "thedate",                                          null: false
    t.string   "status",           limit: 7,     default: "new",   null: false
    t.string   "featured",         limit: 5,     default: "false", null: false
  end

  add_index "messages_outgoing", ["user_id"], name: "user_id", using: :btree

  create_table "messages_trash", force: :cascade do |t|
    t.integer  "message_id_start", limit: 4,                       null: false
    t.integer  "domain_id",        limit: 4,                       null: false
    t.integer  "user_id",          limit: 4,     default: 0,       null: false
    t.integer  "user_id_TO",       limit: 4,     default: 0,       null: false
    t.integer  "user_id_FROM",     limit: 4,                       null: false
    t.string   "folder",           limit: 40,                      null: false
    t.string   "subject",          limit: 80,                      null: false
    t.text     "message",          limit: 65535,                   null: false
    t.datetime "thedate",                                          null: false
    t.string   "status",           limit: 7,     default: "new",   null: false
    t.string   "featured",         limit: 5,     default: "false", null: false
  end

  add_index "messages_trash", ["user_id"], name: "user_id", using: :btree

  create_table "multiple_contractors_users", primary_key: "MULTIPLE_CONTRACTOR_USER_ID", force: :cascade do |t|
    t.integer "CONTRACTOR_ID", limit: 4,             null: false
    t.integer "UID",           limit: 4, default: 0, null: false
    t.integer "role",          limit: 4, default: 0, null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.string   "filter",    limit: 255,   null: false
    t.string   "to",        limit: 255,   null: false
    t.string   "from",      limit: 255,   null: false
    t.string   "subject",   limit: 255,   null: false
    t.text     "body",      limit: 65535, null: false
    t.text     "html",      limit: 65535, null: false
    t.integer  "matching",  limit: 4,     null: false
    t.datetime "date_sent",               null: false
    t.datetime "thedate",                 null: false
    t.string   "sent",      limit: 5,     null: false
    t.string   "featured",  limit: 5,     null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,  null: false
    t.integer  "user_id",   limit: 4,  null: false
    t.integer  "group_id",  limit: 4,  null: false
    t.string   "extension", limit: 30, null: false
    t.string   "method",    limit: 30, null: false
    t.string   "context",   limit: 50, null: false
    t.datetime "thedate",              null: false
    t.integer  "comments",  limit: 4,  null: false
  end

  create_table "notify", force: :cascade do |t|
    t.integer  "domain_id",        limit: 4,                    null: false
    t.integer  "city_id",          limit: 4,                    null: false
    t.string   "email",            limit: 80,                   null: false
    t.string   "notify_submitted", limit: 5,  default: "false", null: false
    t.string   "notify_final",     limit: 5,  default: "false", null: false
    t.string   "notify_message",   limit: 5,  default: "false", null: false
    t.datetime "thedate",                                       null: false
  end

  create_table "objects", force: :cascade do |t|
    t.integer "domain_id",         limit: 4,                                                null: false
    t.text    "vars",              limit: 65535,                                            null: false
    t.string  "name",              limit: 30,                                               null: false
    t.string  "tags",              limit: 60,                                               null: false
    t.string  "extension",         limit: 30,                                               null: false
    t.text    "start",             limit: 65535,                                            null: false
    t.text    "stop",              limit: 65535,                                            null: false
    t.text    "cell",              limit: 65535,                                            null: false
    t.text    "cell_empty",        limit: 65535,                                            null: false
    t.text    "cell_error",        limit: 65535,                                            null: false
    t.integer "rows",              limit: 1,                                                null: false
    t.integer "cols",              limit: 1,                                                null: false
    t.integer "randset",           limit: 1,                                                null: false
    t.string  "row",               limit: 128,                                              null: false
    t.string  "unrow",             limit: 128,                                              null: false
    t.integer "maxdepth",          limit: 1,                                                null: false
    t.string  "allow_maxdepth",    limit: 5,                              default: "false"
    t.string  "allow_render",      limit: 5,                              default: "false", null: false
    t.string  "allow_nesting",     limit: 5,                              default: "false"
    t.string  "allow_passdata",    limit: 5,                              default: "false"
    t.string  "allow_inheritdata", limit: 5,                              default: "false"
    t.string  "allow_passvars",    limit: 5,                              default: "false"
    t.string  "allow_cache",       limit: 5,                              default: "false"
    t.integer "every",             limit: 4,                              default: 86400,   null: false
    t.string  "allow_multiple",    limit: 5,                              default: "false", null: false
    t.string  "allow_passdatasup", limit: 128,                                              null: false
    t.string  "allow_passvarssup", limit: 128,                                              null: false
    t.string  "allow_splittersup", limit: 128,                                              null: false
    t.string  "allow_debug",       limit: 5,                              default: "false", null: false
    t.string  "allow_dynamic",     limit: 5,                              default: "false", null: false
    t.string  "allow_catching",    limit: 5,                              default: "false", null: false
    t.string  "allow_empty",       limit: 5,                              default: "false", null: false
    t.string  "allow_benchmark",   limit: 5,                              default: "false", null: false
    t.text    "params",            limit: 65535,                                            null: false
    t.integer "render_count",      limit: 4,                                                null: false
    t.decimal "render_time",                     precision: 10, scale: 4,                   null: false
    t.integer "updated",           limit: 4,                                                null: false
  end

  add_index "objects", ["domain_id"], name: "domain_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.integer  "domain_id",   limit: 4,        default: 0,       null: false
    t.integer  "template_id", limit: 4,                          null: false
    t.string   "tags",        limit: 60,                         null: false
    t.string   "ctype",       limit: 5,        default: "html",  null: false
    t.string   "url",         limit: 128,                        null: false
    t.text     "title",       limit: 65535,                      null: false
    t.text     "body",        limit: 16777215,                   null: false
    t.string   "access",      limit: 6,        default: "any",   null: false
    t.string   "marked",      limit: 5,        default: "false", null: false
    t.string   "enabled",     limit: 5,        default: "false", null: false
    t.string   "no_header",   limit: 5,        default: "false", null: false
    t.datetime "thedate",                                        null: false
  end

  add_index "pages", ["domain_id"], name: "domain_id", using: :btree

  create_table "payment_list", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "profile_id",         limit: 4
    t.integer  "payment_profile_id", limit: 4
    t.integer  "project_id",         limit: 4
    t.string   "amount",             limit: 128
    t.string   "approval_code",      limit: 128
    t.string   "status",             limit: 128
    t.datetime "date"
    t.string   "card_type",          limit: 128
    t.string   "card_num",           limit: 128
    t.integer  "property_id",        limit: 4
    t.string   "transaction_id",     limit: 128
    t.integer  "approach",           limit: 4,   default: 0
  end

  create_table "portfolio_categories", primary_key: "PORTFOLIO_CATEGORY_ID", force: :cascade do |t|
    t.integer "PORTFOLIO_ID", limit: 4,   null: false
    t.string  "name",         limit: 255, null: false
  end

  create_table "portfolios", primary_key: "PORTFOLIO_ID", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.integer  "CORPORATE_ID", limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "UID",          limit: 4,   null: false
  end

  create_table "private_notes", primary_key: "PRIVATE_NOTE_ID", force: :cascade do |t|
    t.integer  "CONTRACTOR_ID", limit: 4
    t.integer  "CITY_ID",       limit: 4
    t.text     "note",          limit: 65535
    t.datetime "created_at"
    t.integer  "UID",           limit: 4
    t.integer  "PROJECT_ID",    limit: 4
  end

  create_table "project_actions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,     null: false
    t.string   "session",    limit: 100,   null: false
    t.datetime "thedate",                  null: false
    t.text     "user_name",  limit: 65535, null: false
    t.integer  "project_id", limit: 4,     null: false
    t.string   "email",      limit: 100,   null: false
  end

  create_table "project_history", id: false, force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.integer  "session_id", limit: 4,   null: false
    t.string   "method",     limit: 100, null: false
    t.datetime "created",                null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "construction_type_id_PROJECT",  limit: 4,                                                        null: false
    t.integer  "construction_type_id_BUILDING", limit: 4,                                                        null: false
    t.integer  "construction_type_id_DECON",    limit: 4,                                                        null: false
    t.integer  "domain_id",                     limit: 4,                                                        null: false
    t.integer  "contractor_id",                 limit: 4,                                                        null: false
    t.integer  "coupon_id",                     limit: 4,                                                        null: false
    t.integer  "user_id",                       limit: 4,                                                        null: false
    t.string   "tracking",                      limit: 30,                                                       null: false
    t.string   "name",                          limit: 256,                                                      null: false
    t.string   "permit",                        limit: 20,                                                       null: false
    t.integer  "project_value",                 limit: 4,                                                        null: false
    t.integer  "square_footage",                limit: 4,                                                        null: false
    t.string   "street",                        limit: 256,                                                      null: false
    t.string   "street2",                       limit: 80,                                                       null: false
    t.integer  "city_id",                       limit: 4,                                                        null: false
    t.integer  "county_id",                     limit: 4,                                                        null: false
    t.string   "state",                         limit: 2,                                                        null: false
    t.string   "zipcode",                       limit: 10
    t.text     "description",                   limit: 65535,                                                    null: false
    t.datetime "thedate",                                                                                        null: false
    t.datetime "thedate_start",                                                                                  null: false
    t.integer  "tickets_rd",                    limit: 4,                                                        null: false
    t.integer  "tickets_sr",                    limit: 4,                                                        null: false
    t.string   "status",                        limit: 19,                             default: "not_submitted", null: false
    t.decimal  "r",                                           precision: 10, scale: 4,                           null: false
    t.decimal  "d",                                           precision: 10, scale: 4,                           null: false
    t.decimal  "sr",                                          precision: 10, scale: 4,                           null: false
    t.decimal  "rs",                                          precision: 10, scale: 4,                           null: false
    t.decimal  "goal",                                        precision: 10, scale: 2,                           null: false
    t.decimal  "percentage",                                  precision: 10, scale: 2,                           null: false
    t.string   "haul_self",                     limit: 5,                              default: "false",         null: false
    t.string   "haul_service",                  limit: 5,                              default: "false",         null: false
    t.string   "haul_debrisbox",                limit: 5,                              default: "false",         null: false
    t.text     "haul_information",              limit: 65535,                                                    null: false
    t.string   "submit_name",                   limit: 50,                                                       null: false
    t.string   "submit_title",                  limit: 20,                                                       null: false
    t.datetime "submit_thedate",                                                                                 null: false
    t.string   "submit_to_name",                limit: 40,                                                       null: false
    t.datetime "approve_thedate",                                                                                null: false
    t.string   "approve_permit",                limit: 30,                                                       null: false
    t.string   "approve_status",                limit: 8,                              default: "decline"
    t.string   "approve_name",                  limit: 40,                                                       null: false
    t.string   "approve_title",                 limit: 40,                                                       null: false
    t.integer  "approve_user_id",               limit: 4,                                                        null: false
    t.datetime "final_thedate",                                                                                  null: false
    t.text     "final_comment",                 limit: 65535,                                                    null: false
    t.integer  "final_user_id",                 limit: 4,                                                        null: false
    t.integer  "close_user_id",                 limit: 4,                                                        null: false
    t.datetime "close_thedate",                                                                                  null: false
    t.string   "plan_option",                   limit: 10,                             default: "checkboxes",    null: false
    t.text     "checklist",                     limit: 65535,                                                    null: false
    t.string   "franchise_agree",               limit: 5,                              default: "false",         null: false
    t.integer  "submit_user_id",                limit: 4,                                                        null: false
    t.string   "project_state",                 limit: 20,                                                       null: false
    t.string   "unit",                          limit: 10,                             default: "yards"
    t.integer  "user_payment_profile_id",       limit: 4
    t.string   "tarif",                         limit: 20
    t.integer  "ticket_credit",                 limit: 4
    t.string   "receipts_sent",                 limit: 11
    t.string   "property_code",                 limit: 64
    t.integer  "property_id",                   limit: 4
    t.integer  "corporate_id",                  limit: 4
    t.datetime "last_modified",                                                                                  null: false
    t.text     "project_efields",               limit: 65535
    t.string   "project_label",                 limit: 128
    t.string   "custom_goal",                   limit: 10
    t.string   "estimated_duration",            limit: 10
  end

  create_table "projects_additional_scs", force: :cascade do |t|
    t.integer "additional_sc_id", limit: 4, null: false
    t.integer "project_id",       limit: 4, null: false
    t.integer "CONTRACTOR_SC_ID", limit: 4, null: false
  end

  create_table "projects_construction_types", force: :cascade do |t|
    t.integer "domain_id",                 limit: 4, null: false
    t.integer "city_construction_type_id", limit: 4, null: false
    t.integer "project_id",                limit: 4, null: false
  end

  create_table "projects_debrisbox", force: :cascade do |t|
    t.integer "domain_id",  limit: 4, null: false
    t.integer "project_id", limit: 4, null: false
    t.integer "hauler_id",  limit: 4, null: false
  end

  create_table "projects_facilities", force: :cascade do |t|
    t.integer "domain_id",           limit: 4, null: false
    t.integer "project_id",          limit: 4, null: false
    t.integer "project_material_id", limit: 4, null: false
    t.integer "facility_id",         limit: 4, null: false
  end

  create_table "projects_haulers", force: :cascade do |t|
    t.integer "domain_id",  limit: 4, null: false
    t.integer "project_id", limit: 4, null: false
    t.integer "hauler_id",  limit: 4, null: false
  end

  create_table "projects_materials", force: :cascade do |t|
    t.integer "domain_id",                  limit: 4,                                            null: false
    t.integer "material_id",                limit: 4,                                            null: false
    t.integer "project_id",                 limit: 4,                                            null: false
    t.string  "used_salvage",               limit: 5,                          default: "false", null: false
    t.string  "used_recycle",               limit: 5,                          default: "false", null: false
    t.string  "used_dispose",               limit: 5,                          default: "false", null: false
    t.decimal "amt_salvage",                          precision: 10, scale: 6,                   null: false
    t.decimal "amt_recycle",                          precision: 10, scale: 6,                   null: false
    t.decimal "amt_dispose",                          precision: 10, scale: 6,                   null: false
    t.decimal "amtcy_salvage",                        precision: 10, scale: 6,                   null: false
    t.decimal "amtcy_recycle",                        precision: 10, scale: 6,                   null: false
    t.decimal "amtcy_dispose",                        precision: 10, scale: 6,                   null: false
    t.integer "construction_type_id_DECON", limit: 4,                                            null: false
  end

  create_table "projects_notes", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4,     null: false
    t.integer  "project_id", limit: 4,     null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.text     "note",       limit: 65535, null: false
    t.datetime "thedate",                  null: false
  end

  create_table "projects_pms", force: :cascade do |t|
    t.integer "domain_id",        limit: 4, null: false
    t.integer "contractor_pm_id", limit: 4, null: false
    t.integer "project_id",       limit: 4, null: false
    t.integer "contractor_id",    limit: 4, null: false
  end

  create_table "projects_requirement_files", id: false, force: :cascade do |t|
    t.integer  "requirement_id", limit: 4,     null: false
    t.integer  "PROJECT_ID",     limit: 4,     null: false
    t.integer  "UID",            limit: 4,     null: false
    t.string   "user_filename",  limit: 128,   null: false
    t.string   "type",           limit: 5,     null: false
    t.datetime "date_created",                 null: false
    t.integer  "CONTRACTOR_ID",  limit: 4,     null: false
    t.text     "comment",        limit: 65535
    t.string   "status",         limit: 128
    t.text     "reject_reason",  limit: 65535
  end

  create_table "projects_scs", force: :cascade do |t|
    t.integer "domain_id",        limit: 4, null: false
    t.integer "contractor_sc_id", limit: 4, null: false
    t.integer "project_id",       limit: 4, null: false
    t.integer "contractor_id",    limit: 4, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name",              limit: 80
    t.string   "address",           limit: 80
    t.string   "unit",              limit: 80
    t.string   "city",              limit: 80
    t.string   "state",             limit: 2
    t.string   "zipcode",           limit: 10
    t.string   "phone",             limit: 25
    t.string   "url",               limit: 80
    t.string   "contact",           limit: 80
    t.string   "position",          limit: 80
    t.string   "office_phone",      limit: 25
    t.string   "cell_phone",        limit: 25
    t.string   "email",             limit: 80
    t.string   "status",            limit: 80
    t.datetime "thedate"
    t.integer  "user_id",           limit: 4
    t.integer  "corporate_id",      limit: 4
    t.integer  "corporate_user_id", limit: 4
    t.string   "property_code",     limit: 25
    t.integer  "domain_id",         limit: 4
    t.decimal  "r",                            precision: 10, scale: 2
    t.decimal  "d",                            precision: 10, scale: 2
    t.decimal  "sr",                           precision: 10, scale: 2
  end

  create_table "properties_category", primary_key: "PROPERTY_CATEGORY_ID", force: :cascade do |t|
    t.integer "PORTFOLIO_CATEGORY_ID", limit: 4, null: false
    t.integer "PROPERTY_ID",           limit: 4, null: false
  end

  create_table "report", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.integer  "user_id",   limit: 4,     null: false
    t.string   "referrer",  limit: 256,   null: false
    t.string   "action",    limit: 128,   null: false
    t.text     "body",      limit: 65535, null: false
    t.datetime "thedate",                 null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer "domain_id",   limit: 4,                       null: false
    t.string  "name",        limit: 30,                      null: false
    t.string  "description", limit: 255,                     null: false
    t.string  "list_type",   limit: 5,     default: "white", null: false
    t.text    "list_data",   limit: 65535,                   null: false
    t.string  "type",        limit: 5,     default: "web",   null: false
  end

  create_table "scs_additional_info", force: :cascade do |t|
    t.integer "CONTRACTOR_SC_ID", limit: 4,                null: false
    t.string  "name",             limit: 255,              null: false
    t.string  "email",            limit: 128,              null: false
    t.string  "cell",             limit: 64
    t.string  "phone",            limit: 64
    t.string  "password",         limit: 100, default: "", null: false
  end

  create_table "short_link", force: :cascade do |t|
    t.string   "code",     limit: 128
    t.string   "full_url", limit: 255
    t.datetime "thedate"
  end

  create_table "static_content", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.string   "key",       limit: 50,    null: false
    t.text     "body",      limit: 65535, null: false
    t.string   "locale",    limit: 5,     null: false
    t.datetime "thedate",                 null: false
  end

  create_table "templates", force: :cascade do |t|
    t.integer "domain_id", limit: 4,     null: false
    t.string  "name",      limit: 30,    null: false
    t.string  "display",   limit: 30,    null: false
    t.text    "template",  limit: 65535, null: false
    t.string  "tags",      limit: 60,    null: false
  end

  create_table "temporary_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "confirm_email",          limit: 255, default: "", null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "position",               limit: 255
    t.string   "company_name",           limit: 255
    t.string   "website",                limit: 255
    t.string   "address1",               limit: 255
    t.string   "address2",               limit: 255
    t.integer  "zipcode",                limit: 8
    t.string   "phone",                  limit: 255
    t.string   "to_know",                limit: 255
    t.string   "type_of_plan",           limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",        limit: 255
    t.string   "image_content_type",     limit: 255
    t.integer  "image_file_size",        limit: 4
    t.datetime "image_updated_at"
  end

  add_index "temporary_users", ["email"], name: "index_temporary_users_on_email", unique: true, using: :btree
  add_index "temporary_users", ["reset_password_token"], name: "index_temporary_users_on_reset_password_token", unique: true, using: :btree

  create_table "tickets_access_users", force: :cascade do |t|
    t.string   "name",       limit: 128
    t.string   "email",      limit: 128
    t.string   "type",       limit: 128
    t.integer  "project_id", limit: 4
    t.integer  "rel_id",     limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "password",   limit: 128
    t.datetime "thedate"
  end

  create_table "tickets_custom", force: :cascade do |t|
    t.integer "MATERIAL_ID", limit: 4
    t.integer "FACILITY_ID", limit: 4
    t.decimal "weight",                  precision: 10, scale: 2
    t.string  "type",        limit: 128
    t.integer "PROJECT_ID",  limit: 4
    t.string  "d_type",      limit: 128
    t.string  "div_rate",    limit: 128
    t.string  "doc",         limit: 128
  end

  create_table "tickets_prd", primary_key: "TICKET_RD_ID", force: :cascade do |t|
    t.integer  "DID",                limit: 4,                                                   null: false
    t.integer  "PROPERTY_ID",        limit: 4,                                                   null: false
    t.integer  "MATERIAL_ID",        limit: 4,                                                   null: false
    t.integer  "FACILITY_ID",        limit: 4,                                                   null: false
    t.string   "ticket",             limit: 20,                                                  null: false
    t.datetime "thedate",                                                                        null: false
    t.decimal  "weight",                           precision: 14, scale: 4,                      null: false
    t.decimal  "recycled",                         precision: 14, scale: 4,                      null: false
    t.integer  "percentage",         limit: 1,                                                   null: false
    t.integer  "rate_used",          limit: 1,                                                   null: false
    t.string   "submitted_by",       limit: 128
    t.integer  "recipient_id",       limit: 4
    t.text     "ticket_efields",     limit: 65535
    t.string   "ticket_status",      limit: 128,                            default: "approved", null: false
    t.text     "data_before_reject", limit: 65535
    t.datetime "date_created"
    t.string   "type",               limit: 6,                              default: "rd",       null: false
    t.decimal  "bin_size",                         precision: 10, scale: 2, default: 0.0,        null: false
    t.decimal  "dump_fee",                         precision: 10, scale: 2, default: 0.0,        null: false
    t.string   "bin_size_measure",   limit: 6,                              default: "cy",       null: false
  end

  add_index "tickets_prd", ["PROPERTY_ID", "FACILITY_ID"], name: "PROPERTY_ID_FACILITY_ID_idx", using: :btree
  add_index "tickets_prd", ["PROPERTY_ID", "MATERIAL_ID"], name: "PROPERTY_ID_MATERIAL_ID_idx", using: :btree
  add_index "tickets_prd", ["PROPERTY_ID"], name: "PROPERTY_ID", using: :btree
  add_index "tickets_prd", ["date_created"], name: "date_created_idx", using: :btree
  add_index "tickets_prd", ["thedate"], name: "thedate_idx", using: :btree

  create_table "tickets_psr", primary_key: "TICKET_SR_ID", force: :cascade do |t|
    t.integer  "DID",                  limit: 4,                                                   null: false
    t.integer  "PROPERTY_ID",          limit: 4,                                                   null: false
    t.integer  "MATERIAL_ID",          limit: 4,                                                   null: false
    t.integer  "CONSTRUCTION_TYPE_ID", limit: 4,                                                   null: false
    t.integer  "FACILITY_ID",          limit: 4,                                                   null: false
    t.string   "ticket",               limit: 20,                                                  null: false
    t.decimal  "weight",                             precision: 12, scale: 2,                      null: false
    t.decimal  "cubic_yards",                        precision: 12, scale: 2,                      null: false
    t.text     "description",          limit: 65535,                                               null: false
    t.text     "inventory",            limit: 65535,                                               null: false
    t.datetime "thedate",                                                                          null: false
    t.datetime "thedate_ticket",                                                                   null: false
    t.string   "submitted_by",         limit: 128
    t.integer  "recipient_id",         limit: 4
    t.integer  "percentage",           limit: 4
    t.string   "ticket_status",        limit: 128,                            default: "approved", null: false
    t.text     "data_before_reject",   limit: 65535
    t.decimal  "bin_size",                           precision: 10, scale: 2, default: 0.0,        null: false
    t.decimal  "dump_fee",                           precision: 10, scale: 2, default: 0.0,        null: false
    t.string   "bin_size_measure",     limit: 6,                              default: "cy",       null: false
  end

  add_index "tickets_psr", ["PROPERTY_ID"], name: "PROPERTY_ID_idx", using: :btree
  add_index "tickets_psr", ["thedate"], name: "thedate_idx", using: :btree
  add_index "tickets_psr", ["thedate_ticket"], name: "thedate_ticket_idx", using: :btree

  create_table "tickets_pt_access_users", force: :cascade do |t|
    t.string   "name",        limit: 128
    t.string   "email",       limit: 128
    t.string   "type",        limit: 128
    t.integer  "PROPERTY_ID", limit: 4
    t.integer  "REL_ID",      limit: 4
    t.integer  "UID",         limit: 4
    t.string   "password",    limit: 128
    t.datetime "thedate"
  end

  create_table "tickets_rd", force: :cascade do |t|
    t.integer  "domain_id",    limit: 4,                            null: false
    t.integer  "project_id",   limit: 4,                            null: false
    t.integer  "material_id",  limit: 4,                            null: false
    t.integer  "facility_id",  limit: 4,                            null: false
    t.string   "ticket",       limit: 20,                           null: false
    t.datetime "thedate",                                           null: false
    t.decimal  "weight",                   precision: 10, scale: 4, null: false
    t.decimal  "recycled",                 precision: 10, scale: 4, null: false
    t.integer  "percentage",   limit: 1,                            null: false
    t.integer  "rate_used",    limit: 1,                            null: false
    t.string   "submitted_by", limit: 128
    t.integer  "recipient_id", limit: 4
  end

  create_table "tickets_sr", force: :cascade do |t|
    t.integer  "domain_id",            limit: 4,                              null: false
    t.integer  "project_id",           limit: 4,                              null: false
    t.integer  "material_id",          limit: 4,                              null: false
    t.integer  "construction_type_id", limit: 4,                              null: false
    t.integer  "facility_id",          limit: 4,                              null: false
    t.string   "ticket",               limit: 20,                             null: false
    t.decimal  "weight",                             precision: 10, scale: 4, null: false
    t.decimal  "cubic_yards",                        precision: 10, scale: 4, null: false
    t.text     "description",          limit: 65535,                          null: false
    t.text     "inventory",            limit: 65535,                          null: false
    t.datetime "thedate",                                                     null: false
    t.datetime "thedate_ticket",                                              null: false
    t.string   "submitted_by",         limit: 128
    t.integer  "recipient_id",         limit: 4
  end

  create_table "tracking", force: :cascade do |t|
    t.integer  "domain_id", limit: 4,     null: false
    t.string   "ipaddr",    limit: 15,    null: false
    t.integer  "user_id",   limit: 4,     null: false
    t.integer  "admin_id",  limit: 4,     null: false
    t.string   "extension", limit: 30,    null: false
    t.string   "method",    limit: 30,    null: false
    t.text     "params",    limit: 65535, null: false
    t.string   "request",   limit: 255,   null: false
    t.datetime "thedate",                 null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "domain_id",     limit: 4,                          null: false
    t.integer  "contractor_id", limit: 4,                          null: false
    t.decimal  "amount",                  precision: 10, scale: 2, null: false
    t.datetime "thedate",                                          null: false
    t.integer  "coupon_id",     limit: 4,                          null: false
    t.integer  "project_id",    limit: 4,                          null: false
  end

  create_table "turner_api_log", force: :cascade do |t|
    t.string   "status",               limit: 8,     null: false
    t.text     "error_text",           limit: 65535
    t.integer  "return_code",          limit: 4
    t.string   "turner_number",        limit: 64
    t.string   "profit_center",        limit: 64
    t.integer  "project_id",           limit: 4
    t.string   "name",                 limit: 128
    t.string   "city",                 limit: 128
    t.string   "state",                limit: 128
    t.string   "street",               limit: 128
    t.string   "zipcode",              limit: 64
    t.string   "start_date",           limit: 64
    t.string   "end_date",             limit: 64
    t.string   "building_category",    limit: 64
    t.string   "building_subcategory", limit: 64
    t.datetime "date_created"
    t.integer  "site_id",              limit: 4
    t.string   "action",               limit: 64
  end

  create_table "turner_bu_hauler", force: :cascade do |t|
    t.integer "HAULER_ID",     limit: 4, null: false
    t.integer "CONTRACTOR_ID", limit: 4, null: false
  end

  create_table "turner_bu_sc", force: :cascade do |t|
    t.integer "CONTRACTOR_SC_ID", limit: 4, null: false
    t.integer "CONTRACTOR_ID",    limit: 4, null: false
  end

  create_table "turner_construction_types", force: :cascade do |t|
    t.string  "name",           limit: 100,             null: false
    t.string  "ctype",          limit: 100,             null: false
    t.string  "category_id",    limit: 11
    t.string  "subcategory_id", limit: 11
    t.integer "site_id",        limit: 4,   default: 0, null: false
  end

  create_table "turner_construction_types_projects", id: false, force: :cascade do |t|
    t.integer "PROJECT_ID",                    limit: 4, null: false
    t.integer "CONSTRUCTION_TYPE_ID_PROJECT",  limit: 4, null: false
    t.integer "CONSTRUCTION_TYPE_ID_BUILDING", limit: 4, null: false
  end

  create_table "turner_evp", force: :cascade do |t|
    t.string   "name",          limit: 255,             null: false
    t.datetime "created_at",                            null: false
    t.integer  "display_order", limit: 4,   default: 1, null: false
    t.integer  "site_id",       limit: 4,   default: 0, null: false
  end

  create_table "turner_evp_users", force: :cascade do |t|
    t.integer "evp_id",  limit: 4, null: false
    t.integer "user_id", limit: 4, null: false
    t.integer "role",    limit: 4, null: false
  end

  create_table "turner_last_url", primary_key: "UID", force: :cascade do |t|
    t.text "url", limit: 65535, null: false
  end

  create_table "turner_pms_users", force: :cascade do |t|
    t.integer "pm_id",   limit: 4,             null: false
    t.integer "user_id", limit: 4,             null: false
    t.integer "role",    limit: 4, default: 0, null: false
  end

  create_table "turner_profit_centers", force: :cascade do |t|
    t.integer "profit_center_id", limit: 8,               null: false
    t.string  "name",             limit: 150,             null: false
    t.integer "CONTRACTOR_ID",    limit: 4,               null: false
    t.integer "site_id",          limit: 4,   default: 0, null: false
  end

  add_index "turner_profit_centers", ["CONTRACTOR_ID"], name: "CONTRACTOR_ID", using: :btree

  create_table "turner_projects_log", force: :cascade do |t|
    t.integer  "PROJECT_ID", limit: 4,     null: false
    t.integer  "action_id",  limit: 4,     null: false
    t.text     "outcome",    limit: 65535, null: false
    t.datetime "date",                     null: false
    t.integer  "UID",        limit: 4,     null: false
  end

  create_table "turner_svp", force: :cascade do |t|
    t.integer  "evp_id",     limit: 4,               null: false
    t.string   "name",       limit: 255,             null: false
    t.datetime "created_at",                         null: false
    t.integer  "site_id",    limit: 4,   default: 0, null: false
  end

  create_table "turner_svp_users", force: :cascade do |t|
    t.integer "svp_id",  limit: 4, null: false
    t.integer "user_id", limit: 4, null: false
    t.integer "role",    limit: 4, null: false
  end

  create_table "turner_ticket_log", force: :cascade do |t|
    t.integer  "ticket_rd_id", limit: 4,     null: false
    t.text     "text",         limit: 65535, null: false
    t.string   "status",       limit: 10,    null: false
    t.datetime "date_created",               null: false
  end

  create_table "turner_tickets_materials", force: :cascade do |t|
    t.integer "MATERIAL_ID",          limit: 4,                                               null: false
    t.integer "TICKET_RD_ID",         limit: 4,                                               null: false
    t.decimal "applied",                        precision: 10, scale: 2, default: 0.0,        null: false
    t.decimal "weight",                         precision: 14, scale: 4, default: 0.0,        null: false
    t.string  "disposition",          limit: 8,                          default: "recycled", null: false
    t.decimal "not_converted_weight",           precision: 14, scale: 4, default: 0.0,        null: false
  end

  add_index "turner_tickets_materials", ["MATERIAL_ID", "TICKET_RD_ID"], name: "MATERIAL_ID_TICKET_RD_ID", using: :btree
  add_index "turner_tickets_materials", ["MATERIAL_ID"], name: "MATERIAL_ID", using: :btree
  add_index "turner_tickets_materials", ["TICKET_RD_ID"], name: "TICKET_RD_ID", using: :btree

  create_table "turner_users", force: :cascade do |t|
    t.integer "user_id", limit: 4,             null: false
    t.integer "role",    limit: 4, default: 0, null: false
    t.integer "site_id", limit: 4, default: 0, null: false
  end

  create_table "turner_vendor_project_stats", id: false, force: :cascade do |t|
    t.integer "PROJECT_ID",            limit: 4,                null: false
    t.integer "CONTRACTOR_SC_ID",      limit: 4,                null: false
    t.float   "actual_inert_rate",     limit: 24, default: 0.0, null: false
    t.float   "actual_non_inert_rate", limit: 24, default: 0.0, null: false
    t.float   "actual_leed_points",    limit: 24, default: 0.0, null: false
    t.float   "sr",                    limit: 24, default: 0.0, null: false
    t.float   "r",                     limit: 24, default: 0.0, null: false
    t.float   "d",                     limit: 24, default: 0.0, null: false
    t.float   "rs",                    limit: 24, default: 0.0, null: false
    t.integer "count_materials",       limit: 4,  default: 0,   null: false
  end

  create_table "user_payment_profiles", force: :cascade do |t|
    t.integer "user_id",            limit: 4
    t.integer "profile_id",         limit: 4
    t.integer "payment_profile_id", limit: 4
    t.string  "card_num",           limit: 128
    t.string  "card_type",          limit: 128
  end

  create_table "userlevels", force: :cascade do |t|
    t.integer  "domain_id",   limit: 4,                     null: false
    t.string   "display",     limit: 30,                    null: false
    t.string   "name",        limit: 20,                    null: false
    t.string   "description", limit: 255,                   null: false
    t.string   "expires",     limit: 5,                     null: false
    t.datetime "thedate",                                   null: false
    t.string   "roles",       limit: 255,                   null: false
    t.string   "allow",       limit: 5,   default: "false", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "domain_id",      limit: 4,     default: 0,        null: false
    t.string   "moder",          limit: 5,     default: "false",  null: false
    t.string   "username",       limit: 128,   default: "",       null: false
    t.string   "password",       limit: 40,                       null: false
    t.string   "email",          limit: 128,   default: "",       null: false
    t.string   "identifier",     limit: 128,                      null: false
    t.datetime "thedate",                                         null: false
    t.datetime "expires",                                         null: false
    t.string   "expiration",     limit: 5,     default: "true",   null: false
    t.string   "subscriber",     limit: 5,     default: "false",  null: false
    t.string   "roles",          limit: 255,                      null: false
    t.string   "timezone",       limit: 30,                       null: false
    t.string   "enabled",        limit: 5,     default: "false",  null: false
    t.datetime "lastlogin",                                       null: false
    t.integer  "logins",         limit: 4,     default: 0,        null: false
    t.text     "efields",        limit: 65535,                    null: false
    t.string   "session_id",     limit: 32,                       null: false
    t.string   "ipaddr",         limit: 15,                       null: false
    t.string   "user_agent",     limit: 120,                      null: false
    t.integer  "comments",       limit: 4,                        null: false
    t.string   "online",         limit: 5,     default: "false",  null: false
    t.string   "status",         limit: 140,                      null: false
    t.datetime "status_update",                                   null: false
    t.string   "featured",       limit: 5,     default: "false",  null: false
    t.string   "salt",           limit: 50,    default: "",       null: false
    t.string   "encryption",     limit: 6,     default: "md5sum", null: false
    t.integer  "page_view_num",  limit: 4,                        null: false
    t.integer  "points",         limit: 4,                        null: false
    t.integer  "votes",          limit: 4,                        null: false
    t.integer  "userlevel_id",   limit: 4,                        null: false
    t.integer  "userlevel",      limit: 1,                        null: false
    t.integer  "cim_profile_id", limit: 4
    t.string   "charge_method",  limit: 25
  end

  add_index "users", ["domain_id", "email"], name: "domain_id_email", using: :btree
  add_index "users", ["domain_id", "username"], name: "domain_id_username", using: :btree
  add_index "users", ["domain_id"], name: "domain_id", using: :btree
  add_index "users", ["enabled"], name: "enabled", using: :btree

  create_table "zipcodes", force: :cascade do |t|
    t.string  "zipcode",        limit: 10,                                        null: false
    t.string  "pr_city",        limit: 80,                          default: "",  null: false
    t.string  "city",           limit: 80,                          default: "",  null: false
    t.string  "county",         limit: 80,                          default: "",  null: false
    t.string  "state",          limit: 2,                           default: "",  null: false
    t.decimal "LAT",                       precision: 10, scale: 4, default: 0.0, null: false
    t.string  "ziptype",        limit: 80,                          default: "",  null: false
    t.string  "CNT",            limit: 80,                          default: "",  null: false
    t.string  "PCNT",           limit: 80,                          default: "",  null: false
    t.string  "AT",             limit: 20,                          default: "",  null: false
    t.string  "CRST",           limit: 80,                          default: "",  null: false
    t.string  "CRDT",           limit: 80,                          default: "",  null: false
    t.string  "CFIPS",          limit: 3,                           default: "",  null: false
    t.decimal "LON",                       precision: 10, scale: 4, default: 0.0, null: false
    t.string  "shared_zipcode", limit: 10
  end

  add_index "zipcodes", ["state", "county"], name: "state_2", using: :btree
  add_index "zipcodes", ["state"], name: "state", using: :btree
  add_index "zipcodes", ["zipcode"], name: "zipcode", using: :btree

end
