# frozen_string_literal: true

# Create machines class
class CreateMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :machines do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
