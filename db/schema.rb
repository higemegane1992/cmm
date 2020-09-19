# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_916_115_557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'conditions', force: :cascade do |t|
    t.bigint 'machine_id', null: false
    t.bigint 'mold_id', null: false
    t.decimal 'lis', null: false
    t.decimal 'lis_u', null: false
    t.decimal 'lis_l', null: false
    t.decimal 'his', null: false
    t.decimal 'his_u', null: false
    t.decimal 'his_l', null: false
    t.integer 'sup', null: false
    t.integer 'sup_u', null: false
    t.integer 'sup_l', null: false
    t.integer 'cp', null: false
    t.integer 'cp_u', null: false
    t.integer 'cp_l', null: false
    t.integer 'bt', null: false
    t.integer 'bt_u', null: false
    t.integer 'bt_l', null: false
    t.integer 'ssp', null: false
    t.integer 'ssp_u', null: false
    t.integer 'ssp_l', null: false
    t.integer 'dev', null: false
    t.integer 'dev_u', null: false
    t.integer 'dev_l', null: false
    t.integer 'fmf', null: false
    t.integer 'fmf_u', null: false
    t.integer 'fmf_l', null: false
    t.integer 'mmf', null: false
    t.integer 'mmf_u', null: false
    t.integer 'mmf_l', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[machine_id mold_id], name: 'index_conditions_on_machine_id_and_mold_id', unique: true
    t.index ['machine_id'], name: 'index_conditions_on_machine_id'
    t.index ['mold_id'], name: 'index_conditions_on_mold_id'
  end

  create_table 'machines', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'molds', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.integer 'number', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[product_id number], name: 'index_molds_on_product_id_and_number', unique: true
    t.index ['product_id'], name: 'index_molds_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'number', null: false
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'conditions', 'machines'
  add_foreign_key 'conditions', 'molds'
  add_foreign_key 'molds', 'products'
end
