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
class CreateDatabase < ActiveRecord::Migration
  def self.up
ActiveRecord::Schema.define(version: 0) do

  create_table "admin_roles", primary_key: "ADMIN_ROLE_ID", force: :cascade do |t|
    t.integer "DID",         limit: 4,                       null: false
    t.string  "name",        limit: 30,                      null: false
    t.string  "description", limit: 255,                     null: false
    t.string  "list_type",   limit: 5,     default: "white", null: false
    t.text    "list_data",   limit: 65535,                   null: false
  end

  create_table "admins", primary_key: "ADMIN_ID", force: :cascade do |t|
    t.integer  "DID",        limit: 4,                     null: false
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

  create_table "articles", primary_key: "ARTICLE_ID", force: :cascade do |t|
    t.integer  "DID",       limit: 4,                       null: false
    t.integer  "CID",       limit: 4,                       null: false
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

  create_table "categories", primary_key: "CID", force: :cascade do |t|
    t.integer "DID",         limit: 4,     default: 0,  null: false
    t.string  "name",        limit: 150,                null: false
    t.string  "sname",       limit: 30,    default: "", null: false
    t.text    "description", limit: 65535,              null: false
    t.string  "counts",      limit: 256,                null: false
  end

  add_index "categories", ["DID"], name: "DID", using: :btree
  add_index "categories", ["sname"], name: "sname", using: :btree

  create_table "checklist_items", primary_key: "CHECKLIST_ITEM_ID", force: :cascade do |t|
    t.integer "DID",     limit: 4,  null: false
    t.integer "CITY_ID", limit: 4,  null: false
    t.string  "name",    limit: 60, null: false
  end

  create_table "cities", primary_key: "CITY_ID", force: :cascade do |t|
    t.integer  "COUNTY_ID",         limit: 4,                                                     null: false
    t.integer  "DID",               limit: 4,                                                     null: false
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

  create_table "cities_checklist_items", primary_key: "CITY_CHECKLIST_ITEM_ID", force: :cascade do |t|
    t.integer "DID",               limit: 4, null: false
    t.integer "CHECKLIST_ITEM_ID", limit: 4, null: false
    t.integer "CITY_ID",           limit: 4, null: false
  end

  create_table "cities_construction_types", primary_key: "CITY_CONSTRUCTION_TYPE_ID", force: :cascade do |t|
    t.integer "DID",                  limit: 4,                          null: false
    t.integer "CITY_ID",              limit: 4,                          null: false
    t.integer "CONSTRUCTION_TYPE_ID", limit: 4,                          null: false
    t.decimal "ctt_salvage",                    precision: 10, scale: 2, null: false
    t.decimal "ctt_dispose",                    precision: 10, scale: 2, null: false
    t.decimal "ctt_recycle",                    precision: 10, scale: 2, null: false
  end

  create_table "cities_contacts", primary_key: "CITY_CONTACT_ID", force: :cascade do |t|
    t.integer "DID",       limit: 4,  null: false
    t.integer "CITY_ID",   limit: 4,  null: false
    t.integer "COUNTY_ID", limit: 4,  null: false
    t.string  "name",      limit: 30, null: false
    t.string  "position",  limit: 40, null: false
    t.string  "email",     limit: 30, null: false
    t.string  "phone",     limit: 20, null: false
  end

  create_table "cities_facilities", primary_key: "CITY_FACILITY_ID", force: :cascade do |t|
    t.integer "DID",         limit: 4, null: false
    t.integer "CITY_ID",     limit: 4, null: false
    t.integer "FACILITY_ID", limit: 4, null: false
  end

  add_index "cities_facilities", ["CITY_ID"], name: "city_id_idx", using: :btree
  add_index "cities_facilities", ["FACILITY_ID"], name: "facility_id_idx", using: :btree

  create_table "cities_haulers", id: false, force: :cascade do |t|
    t.integer "CITY_HAULER_ID", limit: 4, null: false
    t.integer "DID",            limit: 4, null: false
    t.integer "CITY_ID",        limit: 4, null: false
    t.integer "HAULER_ID",      limit: 4, null: false
  end

  create_table "cities_materials", primary_key: "CITY_MATERIAL_ID", force: :cascade do |t|
    t.integer "DID",             limit: 4,                                            null: false
    t.integer "MATERIAL_ID",     limit: 4,                                            null: false
    t.integer "CITY_ID",         limit: 4,                                            null: false
    t.string  "enabled_salvage", limit: 5,                          default: "false", null: false
    t.string  "enabled_recycle", limit: 5,                          default: "false", null: false
    t.string  "enabled_dispose", limit: 5,                          default: "false", null: false
    t.decimal "total_recycled",            precision: 10, scale: 2,                   null: false
    t.decimal "total_disposed",            precision: 10, scale: 2,                   null: false
    t.decimal "total_salvaged",            precision: 10, scale: 2,                   null: false
  end

  create_table "cities_users", primary_key: "CITY_USER_ID", force: :cascade do |t|
    t.integer "CITY_ID",          limit: 4,                   null: false
    t.integer "DID",              limit: 4,                   null: false
    t.integer "UID",              limit: 4,                   null: false
    t.string  "notify_submitted", limit: 5, default: "false", null: false
    t.string  "notify_final",     limit: 5, default: "false", null: false
    t.string  "notify_message",   limit: 5, default: "false", null: false
  end

  create_table "construction_types", primary_key: "CONSTRUCTION_TYPE_ID", force: :cascade do |t|
    t.integer "DID",     limit: 4,                      null: false
    t.integer "CITY_ID", limit: 4,                      null: false
    t.string  "name",    limit: 60,                     null: false
    t.string  "ctype",   limit: 8,  default: "project", null: false
  end

  create_table "contractors", primary_key: "CONTRACTOR_ID", force: :cascade do |t|
    t.integer "DID",       limit: 4,                                                null: false
    t.integer "CITY_ID",   limit: 4,                                                null: false
    t.integer "COUNTY_ID", limit: 4,                                                null: false
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

  create_table "contractors_notify", primary_key: "NOTIFY_ID", force: :cascade do |t|
    t.integer  "DID",              limit: 4,                    null: false
    t.integer  "CONTRACTOR_ID",    limit: 4,                    null: false
    t.string   "email",            limit: 80,                   null: false
    t.string   "notify_approved",  limit: 5,  default: "false", null: false
    t.string   "notify_finalized", limit: 5,  default: "false", null: false
    t.string   "notify_message",   limit: 5,  default: "false", null: false
    t.datetime "thedate",                                       null: false
  end

  create_table "contractors_pms", primary_key: "CONTRACTOR_PM_ID", force: :cascade do |t|
    t.integer  "DID",           limit: 4,  null: false
    t.integer  "CONTRACTOR_ID", limit: 4,  null: false
    t.string   "name",          limit: 60, null: false
    t.string   "position",      limit: 30, null: false
    t.string   "email",         limit: 60, null: false
    t.string   "phone",         limit: 20, null: false
    t.string   "cell",          limit: 20, null: false
    t.datetime "thedate",                  null: false
    t.integer  "CITY_ID",       limit: 4
  end

  create_table "contractors_scs", primary_key: "CONTRACTOR_SC_ID", force: :cascade do |t|
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

  create_table "contractors_users", primary_key: "CONTRACTOR_USER_ID", force: :cascade do |t|
    t.integer "DID",           limit: 4, null: false
    t.integer "CONTRACTOR_ID", limit: 4, null: false
    t.integer "CITY_ID",       limit: 4, null: false
    t.integer "COUNTY_ID",     limit: 4, null: false
    t.integer "UID",           limit: 4, null: false
  end

  create_table "corporate", primary_key: "CORPORATE_ID", force: :cascade do |t|
    t.integer "DID",       limit: 4
    t.integer "CITY_ID",   limit: 4
    t.integer "COUNTY_ID", limit: 4
    t.integer "UID",       limit: 4
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

  create_table "corporate_users", primary_key: "CORPORATE_USER_ID", force: :cascade do |t|
    t.integer "DID",          limit: 4
    t.integer "CORPORATE_ID", limit: 4
    t.integer "UID",          limit: 4
    t.integer "CITY_ID",      limit: 4
    t.integer "COUNTY_ID",    limit: 4
  end

  create_table "counties", primary_key: "COUNTY_ID", force: :cascade do |t|
    t.integer  "DID",      limit: 4,  null: false
    t.string   "name",     limit: 60, null: false
    t.string   "state",    limit: 2,  null: false
    t.string   "verified", limit: 5,  null: false
    t.integer  "coupons",  limit: 4,  null: false
    t.datetime "thedate",             null: false
  end

  create_table "counties_users", primary_key: "COUNTY_USER_ID", force: :cascade do |t|
    t.integer "DID",       limit: 4, null: false
    t.integer "UID",       limit: 4, null: false
    t.integer "COUNTY_ID", limit: 4, null: false
  end

  create_table "coupons", primary_key: "COUPON_ID", force: :cascade do |t|
    t.integer  "DID",             limit: 4,                       null: false
    t.integer  "CITY_ID",         limit: 4,                       null: false
    t.integer  "CONTRACTOR_ID",   limit: 4,                       null: false
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

  create_table "domains", primary_key: "DID", force: :cascade do |t|
    t.integer  "PDID",            limit: 4,                       null: false
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

  create_table "esb_messages", primary_key: "ESB_MESSAGE_ID", force: :cascade do |t|
    t.integer  "DID",            limit: 4,                       null: false
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

  create_table "esb_scheduler", primary_key: "ESB_JOB_ID", force: :cascade do |t|
    t.integer  "DID",       limit: 4,     null: false
    t.string   "extension", limit: 30,    null: false
    t.string   "method",    limit: 30,    null: false
    t.text     "frequency", limit: 65535, null: false
    t.datetime "lastrun",                 null: false
    t.integer  "runs",      limit: 4,     null: false
    t.datetime "thedate",                 null: false
  end

  create_table "extensions", primary_key: "EXID", force: :cascade do |t|
    t.integer  "DID",     limit: 4,     null: false
    t.string   "name",    limit: 30,    null: false
    t.text     "data",    limit: 65535, null: false
    t.datetime "updated",               null: false
  end

  add_index "extensions", ["DID", "name"], name: "DID", unique: true, using: :btree

  create_table "extensions_data", primary_key: "EDID", force: :cascade do |t|
    t.integer  "DID",       limit: 4,     null: false
    t.integer  "ID",        limit: 4,     null: false
    t.string   "extension", limit: 30,    null: false
    t.text     "data",      limit: 65535, null: false
    t.datetime "thedate",                 null: false
  end

  add_index "extensions_data", ["DID", "ID", "extension"], name: "DID", using: :btree

  create_table "extensions_debug", primary_key: "DEBUG_ID", force: :cascade do |t|
    t.integer  "DID",       limit: 4,   null: false
    t.string   "extension", limit: 30,  null: false
    t.string   "message",   limit: 255, null: false
    t.string   "ipaddr",    limit: 15,  null: false
    t.datetime "thedate",               null: false
  end

  create_table "extensions_errors", primary_key: "ERROR_ID", force: :cascade do |t|
    t.integer  "DID",     limit: 4,     null: false
    t.text     "message", limit: 65535, null: false
    t.datetime "thedate",               null: false
  end

  create_table "facilities", primary_key: "FACILITY_ID", force: :cascade do |t|
    t.integer "DID",             limit: 4,                              null: false
    t.integer "CITY_ID",         limit: 4,                              null: false
    t.integer "COUNTY_ID",       limit: 4,                              null: false
    t.integer "CONTRACTOR_ID",   limit: 4,                              null: false
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

  create_table "facilities_materials", primary_key: "FACILITY_MATERIAL_ID", force: :cascade do |t|
    t.integer "DID",             limit: 4,                   null: false
    t.integer "FACILITY_ID",     limit: 4,                   null: false
    t.integer "MATERIAL_ID",     limit: 4,                   null: false
    t.integer "conversion_rate", limit: 4,                   null: false
    t.integer "order_num",       limit: 4,                   null: false
    t.string  "donation",        limit: 5, default: "false", null: false
    t.integer "conversion_leed", limit: 4,                   null: false
  end

  add_index "facilities_materials", ["MATERIAL_ID"], name: "material_id_idx", using: :btree

  create_table "faqs", primary_key: "FAQ_ID", force: :cascade do |t|
    t.integer  "DID",       limit: 4,                       null: false
    t.integer  "CID",       limit: 4,                       null: false
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

  create_table "formdata", primary_key: "FORMDATA_ID", force: :cascade do |t|
    t.integer  "DID",     limit: 4,     null: false
    t.integer  "UID",     limit: 4,     null: false
    t.string   "email",   limit: 60,    null: false
    t.string   "form",    limit: 30,    null: false
    t.text     "data",    limit: 65535, null: false
    t.string   "ipaddr",  limit: 15,    null: false
    t.datetime "thedate",               null: false
    t.integer  "flag",    limit: 1,     null: false
  end

  create_table "forms", primary_key: "FORM_ID", force: :cascade do |t|
    t.integer  "DID",     limit: 4,     null: false
    t.string   "name",    limit: 40,    null: false
    t.text     "xml",     limit: 65535, null: false
    t.datetime "thedate",               null: false
  end

  create_table "friendly_urls", primary_key: "FRIENDLY_ID", force: :cascade do |t|
    t.integer "DID",       limit: 4,   null: false
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

  create_table "haulers", primary_key: "HAULER_ID", force: :cascade do |t|
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

  create_table "mail", primary_key: "MAIL_ID", force: :cascade do |t|
    t.integer  "DID",        limit: 4,                       null: false
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

  create_table "mail_errors", primary_key: "MAIL_ERROR_ID", force: :cascade do |t|
    t.string   "email",     limit: 60,                    null: false
    t.string   "error",     limit: 256,                   null: false
    t.datetime "thedate",                                 null: false
    t.string   "processed", limit: 5,   default: "false", null: false
  end

  create_table "materials", primary_key: "MATERIAL_ID", force: :cascade do |t|
    t.integer "DID",              limit: 4,                                                null: false
    t.string  "name",             limit: 60,                                               null: false
    t.text    "description",      limit: 65535,                                            null: false
    t.decimal "density",                        precision: 10, scale: 5,                   null: false
    t.integer "order_num",        limit: 1,                                                null: false
    t.string  "enable_rd",        limit: 5,                              default: "false", null: false
    t.string  "enable_sr",        limit: 5,                              default: "false", null: false
    t.integer "default_div_rate", limit: 4
  end

  create_table "materials_salvage", primary_key: "MATERIAL_SALVAGE_ID", force: :cascade do |t|
    t.integer "DID",  limit: 4,  null: false
    t.string  "name", limit: 30, null: false
  end

  create_table "messages_incoming", primary_key: "MESSAGE_ID", force: :cascade do |t|
    t.integer  "MESSAGE_ID_START", limit: 4,                       null: false
    t.integer  "DID",              limit: 4,                       null: false
    t.integer  "UID",              limit: 4,     default: 0,       null: false
    t.integer  "UID_FROM",         limit: 4,     default: 0,       null: false
    t.integer  "PROJECT_ID",       limit: 4,                       null: false
    t.integer  "CONTRACTOR_ID",    limit: 4,                       null: false
    t.integer  "CITY_ID",          limit: 4,                       null: false
    t.integer  "COUNTY_ID",        limit: 4,                       null: false
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

  add_index "messages_incoming", ["UID"], name: "UID", using: :btree

  create_table "messages_outgoing", primary_key: "MESSAGE_ID", force: :cascade do |t|
    t.integer  "MESSAGE_ID_START", limit: 4,                       null: false
    t.integer  "DID",              limit: 4,                       null: false
    t.integer  "UID",              limit: 4,     default: 0,       null: false
    t.integer  "UID_TO",           limit: 4,     default: 0,       null: false
    t.string   "folder",           limit: 40,                      null: false
    t.string   "subject",          limit: 80,                      null: false
    t.text     "message",          limit: 65535,                   null: false
    t.datetime "thedate",                                          null: false
    t.string   "status",           limit: 7,     default: "new",   null: false
    t.string   "featured",         limit: 5,     default: "false", null: false
  end

  add_index "messages_outgoing", ["UID"], name: "UID", using: :btree

  create_table "messages_trash", primary_key: "MESSAGE_ID", force: :cascade do |t|
    t.integer  "MESSAGE_ID_START", limit: 4,                       null: false
    t.integer  "DID",              limit: 4,                       null: false
    t.integer  "UID",              limit: 4,     default: 0,       null: false
    t.integer  "UID_TO",           limit: 4,     default: 0,       null: false
    t.integer  "UID_FROM",         limit: 4,                       null: false
    t.string   "folder",           limit: 40,                      null: false
    t.string   "subject",          limit: 80,                      null: false
    t.text     "message",          limit: 65535,                   null: false
    t.datetime "thedate",                                          null: false
    t.string   "status",           limit: 7,     default: "new",   null: false
    t.string   "featured",         limit: 5,     default: "false", null: false
  end

  add_index "messages_trash", ["UID"], name: "UID", using: :btree

  create_table "newsletters", primary_key: "NEWSLETTER_ID", force: :cascade do |t|
    t.integer  "DID",       limit: 4,     null: false
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

  create_table "notifications", primary_key: "NOTIFICATION_ID", force: :cascade do |t|
    t.integer  "DID",       limit: 4,  null: false
    t.integer  "UID",       limit: 4,  null: false
    t.integer  "GROUP_ID",  limit: 4,  null: false
    t.string   "extension", limit: 30, null: false
    t.string   "method",    limit: 30, null: false
    t.string   "context",   limit: 50, null: false
    t.integer  "ID",        limit: 4,  null: false
    t.datetime "thedate",              null: false
    t.integer  "comments",  limit: 4,  null: false
  end

  create_table "notify", primary_key: "NOTIFY_ID", force: :cascade do |t|
    t.integer  "DID",              limit: 4,                    null: false
    t.integer  "CITY_ID",          limit: 4,                    null: false
    t.string   "email",            limit: 80,                   null: false
    t.string   "notify_submitted", limit: 5,  default: "false", null: false
    t.string   "notify_final",     limit: 5,  default: "false", null: false
    t.string   "notify_message",   limit: 5,  default: "false", null: false
    t.datetime "thedate",                                       null: false
  end

  create_table "objects", primary_key: "OID", force: :cascade do |t|
    t.integer "DID",               limit: 4,                                                null: false
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

  add_index "objects", ["DID"], name: "DID", using: :btree

  create_table "pages", primary_key: "PAGE_ID", force: :cascade do |t|
    t.integer  "DID",         limit: 4,        default: 0,       null: false
    t.integer  "TEMPLATE_ID", limit: 4,                          null: false
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

  add_index "pages", ["DID"], name: "DID", using: :btree

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

  create_table "projects", primary_key: "PROJECT_ID", force: :cascade do |t|
    t.integer  "CONSTRUCTION_TYPE_ID_PROJECT",  limit: 4,                                                        null: false
    t.integer  "CONSTRUCTION_TYPE_ID_BUILDING", limit: 4,                                                        null: false
    t.integer  "CONSTRUCTION_TYPE_ID_DECON",    limit: 4,                                                        null: false
    t.integer  "DID",                           limit: 4,                                                        null: false
    t.integer  "CONTRACTOR_ID",                 limit: 4,                                                        null: false
    t.integer  "COUPON_ID",                     limit: 4,                                                        null: false
    t.integer  "UID",                           limit: 4,                                                        null: false
    t.string   "tracking",                      limit: 30,                                                       null: false
    t.string   "name",                          limit: 256,                                                      null: false
    t.string   "permit",                        limit: 20,                                                       null: false
    t.integer  "project_value",                 limit: 4,                                                        null: false
    t.integer  "square_footage",                limit: 4,                                                        null: false
    t.string   "street",                        limit: 256,                                                      null: false
    t.string   "street2",                       limit: 80,                                                       null: false
    t.integer  "CITY_ID",                       limit: 4,                                                        null: false
    t.integer  "COUNTY_ID",                     limit: 4,                                                        null: false
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
    t.integer  "approve_UID",                   limit: 4,                                                        null: false
    t.datetime "final_thedate",                                                                                  null: false
    t.text     "final_comment",                 limit: 65535,                                                    null: false
    t.integer  "final_UID",                     limit: 4,                                                        null: false
    t.integer  "close_UID",                     limit: 4,                                                        null: false
    t.datetime "close_thedate",                                                                                  null: false
    t.string   "plan_option",                   limit: 10,                             default: "checkboxes",    null: false
    t.text     "checklist",                     limit: 65535,                                                    null: false
    t.string   "franchise_agree",               limit: 5,                              default: "false",         null: false
    t.integer  "submit_UID",                    limit: 4,                                                        null: false
    t.string   "project_state",                 limit: 20,                                                       null: false
    t.string   "unit",                          limit: 10,                             default: "yards"
    t.integer  "user_payment_profile_id",       limit: 4
    t.string   "tarif",                         limit: 20
    t.integer  "ticket_credit",                 limit: 4
    t.string   "receipts_sent",                 limit: 11
    t.string   "property_code",                 limit: 64
    t.integer  "property_id",                   limit: 4
    t.integer  "CORPORATE_ID",                  limit: 4
    t.datetime "last_modified",                                                                                  null: false
    t.text     "project_efields",               limit: 65535
    t.string   "project_label",                 limit: 128
    t.string   "custom_goal",                   limit: 10
    t.string   "estimated_duration",            limit: 10
  end

  create_table "projects_construction_types", primary_key: "PROJECT_CONSTRUCTION_TYPE_ID", force: :cascade do |t|
    t.integer "DID",                       limit: 4, null: false
    t.integer "CITY_CONSTRUCTION_TYPE_ID", limit: 4, null: false
    t.integer "PROJECT_ID",                limit: 4, null: false
  end

  create_table "projects_debrisbox", primary_key: "PROJECT_DEBRISBOX_ID", force: :cascade do |t|
    t.integer "DID",        limit: 4, null: false
    t.integer "PROJECT_ID", limit: 4, null: false
    t.integer "HAULER_ID",  limit: 4, null: false
  end

  create_table "projects_facilities", primary_key: "PROJECT_FACILITY_ID", force: :cascade do |t|
    t.integer "DID",                 limit: 4, null: false
    t.integer "PROJECT_ID",          limit: 4, null: false
    t.integer "PROJECT_MATERIAL_ID", limit: 4, null: false
    t.integer "FACILITY_ID",         limit: 4, null: false
  end

  create_table "projects_haulers", primary_key: "PROJECT_HAULER_ID", force: :cascade do |t|
    t.integer "DID",        limit: 4, null: false
    t.integer "PROJECT_ID", limit: 4, null: false
    t.integer "HAULER_ID",  limit: 4, null: false
  end

  create_table "projects_materials", primary_key: "PROJECT_MATERIAL_ID", force: :cascade do |t|
    t.integer "DID",                        limit: 4,                                            null: false
    t.integer "MATERIAL_ID",                limit: 4,                                            null: false
    t.integer "PROJECT_ID",                 limit: 4,                                            null: false
    t.string  "used_salvage",               limit: 5,                          default: "false", null: false
    t.string  "used_recycle",               limit: 5,                          default: "false", null: false
    t.string  "used_dispose",               limit: 5,                          default: "false", null: false
    t.decimal "amt_salvage",                          precision: 10, scale: 6,                   null: false
    t.decimal "amt_recycle",                          precision: 10, scale: 6,                   null: false
    t.decimal "amt_dispose",                          precision: 10, scale: 6,                   null: false
    t.decimal "amtcy_salvage",                        precision: 10, scale: 6,                   null: false
    t.decimal "amtcy_recycle",                        precision: 10, scale: 6,                   null: false
    t.decimal "amtcy_dispose",                        precision: 10, scale: 6,                   null: false
    t.integer "CONSTRUCTION_TYPE_ID_DECON", limit: 4,                                            null: false
  end

  create_table "projects_notes", primary_key: "PROJECT_NOTE_ID", force: :cascade do |t|
    t.integer  "DID",        limit: 4,     null: false
    t.integer  "PROJECT_ID", limit: 4,     null: false
    t.integer  "UID",        limit: 4,     null: false
    t.text     "note",       limit: 65535, null: false
    t.datetime "thedate",                  null: false
  end

  create_table "projects_pms", primary_key: "PROJECT_PM_ID", force: :cascade do |t|
    t.integer "DID",              limit: 4, null: false
    t.integer "CONTRACTOR_PM_ID", limit: 4, null: false
    t.integer "PROJECT_ID",       limit: 4, null: false
    t.integer "CONTRACTOR_ID",    limit: 4, null: false
  end

  create_table "projects_scs", primary_key: "PROJECT_SC_ID", force: :cascade do |t|
    t.integer "DID",              limit: 4, null: false
    t.integer "CONTRACTOR_SC_ID", limit: 4, null: false
    t.integer "PROJECT_ID",       limit: 4, null: false
    t.integer "CONTRACTOR_ID",    limit: 4, null: false
  end

  create_table "properties", primary_key: "PROPERTY_ID", force: :cascade do |t|
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
    t.integer  "UID",               limit: 4
    t.integer  "CORPORATE_ID",      limit: 4
    t.integer  "CORPORATE_USER_ID", limit: 4
    t.string   "property_code",     limit: 25
    t.integer  "DID",               limit: 4
    t.decimal  "r",                            precision: 10, scale: 2
    t.decimal  "d",                            precision: 10, scale: 2
    t.decimal  "sr",                           precision: 10, scale: 2
  end

  create_table "report", primary_key: "REPORT_ID", force: :cascade do |t|
    t.integer  "DID",      limit: 4,     null: false
    t.integer  "UID",      limit: 4,     null: false
    t.string   "referrer", limit: 256,   null: false
    t.string   "action",   limit: 128,   null: false
    t.text     "body",     limit: 65535, null: false
    t.datetime "thedate",                null: false
  end

  create_table "roles", primary_key: "ROLE_ID", force: :cascade do |t|
    t.integer "DID",         limit: 4,                       null: false
    t.string  "name",        limit: 30,                      null: false
    t.string  "description", limit: 255,                     null: false
    t.string  "list_type",   limit: 5,     default: "white", null: false
    t.text    "list_data",   limit: 65535,                   null: false
    t.string  "type",        limit: 5,     default: "web",   null: false
  end

  create_table "short_link", force: :cascade do |t|
    t.string   "code",     limit: 128
    t.string   "full_url", limit: 255
    t.datetime "thedate"
  end

  create_table "static_content", primary_key: "STATIC_ID", force: :cascade do |t|
    t.integer  "DID",     limit: 4,     null: false
    t.string   "key",     limit: 50,    null: false
    t.text     "body",    limit: 65535, null: false
    t.string   "locale",  limit: 5,     null: false
    t.datetime "thedate",               null: false
  end

  create_table "templates", primary_key: "TEMPLATE_ID", force: :cascade do |t|
    t.integer "DID",      limit: 4,     null: false
    t.string  "name",     limit: 30,    null: false
    t.string  "display",  limit: 30,    null: false
    t.text    "template", limit: 65535, null: false
    t.string  "tags",     limit: 60,    null: false
  end

  create_table "temporary_users", force: :cascade do |t|
    t.string   "email",        limit: 64
    t.string   "first_name",   limit: 64
    t.string   "last_name",    limit: 64
    t.string   "company_name", limit: 256
    t.binary   "address",      limit: 65535
    t.string   "city",         limit: 128
    t.string   "state",        limit: 128
    t.string   "zip",          limit: 64
    t.string   "phone",        limit: 64
    t.datetime "date"
    t.string   "password",     limit: 128
    t.string   "token",        limit: 128
    t.string   "status",       limit: 12
  end

  create_table "tickets_access_users", force: :cascade do |t|
    t.string   "name",       limit: 128
    t.string   "email",      limit: 128
    t.string   "type",       limit: 128
    t.integer  "PROJECT_ID", limit: 4
    t.integer  "REL_ID",     limit: 4
    t.integer  "UID",        limit: 4
    t.string   "password",   limit: 128
    t.datetime "thedate"
  end

  create_table "tickets_rd", primary_key: "TICKET_RD_ID", force: :cascade do |t|
    t.integer  "DID",          limit: 4,                            null: false
    t.integer  "PROJECT_ID",   limit: 4,                            null: false
    t.integer  "MATERIAL_ID",  limit: 4,                            null: false
    t.integer  "FACILITY_ID",  limit: 4,                            null: false
    t.string   "ticket",       limit: 20,                           null: false
    t.datetime "thedate",                                           null: false
    t.decimal  "weight",                   precision: 10, scale: 4, null: false
    t.decimal  "recycled",                 precision: 10, scale: 4, null: false
    t.integer  "percentage",   limit: 1,                            null: false
    t.integer  "rate_used",    limit: 1,                            null: false
    t.string   "submitted_by", limit: 128
    t.integer  "recipient_id", limit: 4
  end

  create_table "tickets_sr", primary_key: "TICKET_SR_ID", force: :cascade do |t|
    t.integer  "DID",                  limit: 4,                              null: false
    t.integer  "PROJECT_ID",           limit: 4,                              null: false
    t.integer  "MATERIAL_ID",          limit: 4,                              null: false
    t.integer  "CONSTRUCTION_TYPE_ID", limit: 4,                              null: false
    t.integer  "FACILITY_ID",          limit: 4,                              null: false
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

  create_table "tracking", primary_key: "TRACKING_ID", force: :cascade do |t|
    t.integer  "DID",       limit: 4,     null: false
    t.string   "ipaddr",    limit: 15,    null: false
    t.integer  "UID",       limit: 4,     null: false
    t.integer  "ADMIN_ID",  limit: 4,     null: false
    t.string   "extension", limit: 30,    null: false
    t.string   "method",    limit: 30,    null: false
    t.text     "params",    limit: 65535, null: false
    t.string   "request",   limit: 255,   null: false
    t.datetime "thedate",                 null: false
  end

  create_table "transactions", primary_key: "TRANSACTION_ID", force: :cascade do |t|
    t.integer  "DID",           limit: 4,                          null: false
    t.integer  "CONTRACTOR_ID", limit: 4,                          null: false
    t.decimal  "amount",                  precision: 10, scale: 2, null: false
    t.datetime "thedate",                                          null: false
    t.integer  "COUPON_ID",     limit: 4,                          null: false
    t.integer  "PROJECT_ID",    limit: 4,                          null: false
  end

  create_table "user_payment_profiles", force: :cascade do |t|
    t.integer "user_id",            limit: 4
    t.integer "profile_id",         limit: 4
    t.integer "payment_profile_id", limit: 4
    t.string  "card_num",           limit: 128
    t.string  "card_type",          limit: 128
  end

  create_table "userlevels", primary_key: "USERLEVEL_ID", force: :cascade do |t|
    t.integer  "DID",         limit: 4,                     null: false
    t.string   "display",     limit: 30,                    null: false
    t.string   "name",        limit: 20,                    null: false
    t.string   "description", limit: 255,                   null: false
    t.string   "expires",     limit: 5,                     null: false
    t.datetime "thedate",                                   null: false
    t.string   "roles",       limit: 255,                   null: false
    t.string   "allow",       limit: 5,   default: "false", null: false
  end

  create_table "users", primary_key: "UID", force: :cascade do |t|
    t.integer  "DID",            limit: 4,     default: 0,        null: false
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
    t.integer  "USERLEVEL_ID",   limit: 4,                        null: false
    t.integer  "userlevel",      limit: 1,                        null: false
    t.integer  "cim_profile_id", limit: 4
    t.string   "charge_method",  limit: 25
  end

  add_index "users", ["DID", "email"], name: "DID_email", using: :btree
  add_index "users", ["DID", "username"], name: "DID_username", using: :btree
  add_index "users", ["DID"], name: "DID", using: :btree
  add_index "users", ["enabled"], name: "enabled", using: :btree

  create_table "zipcodes", primary_key: "ZID", force: :cascade do |t|
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
end
end
