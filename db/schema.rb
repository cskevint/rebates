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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120627185618) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sub_category_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "product_types", ["sub_category_id"], :name => "index_product_types_on_sub_category_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "products", ["product_type_id"], :name => "index_products_on_product_type_id"

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "ptype"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rebates", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "replacement"
    t.text     "description"
    t.string   "units"
    t.integer  "amount"
    t.date     "available_date"
    t.date     "expiration_date"
    t.boolean  "exhausted_flag"
    t.text     "requirements"
    t.text     "exclusions"
    t.text     "additional_details"
    t.text     "rebate_url"
    t.integer  "rebateable_id"
    t.string   "rebateable_type"
    t.integer  "provider_id"
    t.integer  "zone_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "rebates", ["provider_id"], :name => "index_rebates_on_provider_id"
  add_index "rebates", ["zone_id"], :name => "index_rebates_on_zone_id"

  create_table "sub_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sub_categories", ["category_id"], :name => "index_sub_categories_on_category_id"

  create_table "zip_codes", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.integer  "zone_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "zip_codes", ["zone_id"], :name => "index_zip_codes_on_zone_id"

  create_table "zones", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
