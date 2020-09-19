# frozen_string_literal: true

# Create logs class
class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :machine, null: false, foreign_key: true
      t.references :mold, null: false, foreign_key: true
      t.numeric :lis, null: false
      t.numeric :his, null: false
      t.integer :sup, null: false
      t.integer :cp, null: false
      t.integer :bt, null: false
      t.integer :ssp, null: false
      t.integer :dev, null: false
      t.integer :fmf, null: false
      t.integer :mmf, null: false
      t.timestamps
    end
  end
end
