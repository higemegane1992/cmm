# frozen_string_literal: true

# Create conditions class
class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.references :machine, null: false, foreign_key: true
      t.references :mold, null: false, foreign_key: true
      t.numeric :lis, null: false
      t.numeric :lis_u, null: false
      t.numeric :lis_l, null: false
      t.numeric :his, null: false
      t.numeric :his_u, null: false
      t.numeric :his_l, null: false
      t.integer :sup, null: false
      t.integer :sup_u, null: false
      t.integer :sup_l, null: false
      t.integer :cp, null: false
      t.integer :cp_u, null: false
      t.integer :cp_l, null: false
      t.integer :bt, null: false
      t.integer :bt_u, null: false
      t.integer :bt_l, null: false
      t.integer :ssp, null: false
      t.integer :ssp_u, null: false
      t.integer :ssp_l, null: false
      t.integer :dev, null: false
      t.integer :dev_u, null: false
      t.integer :dev_l, null: false
      t.integer :fmf, null: false
      t.integer :fmf_u, null: false
      t.integer :fmf_l, null: false
      t.integer :mmf, null: false
      t.integer :mmf_u, null: false
      t.integer :mmf_l, null: false
      t.timestamps
    end
    add_index :conditions, %i[machine_id mold_id], unique: true
  end
end
