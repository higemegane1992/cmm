# frozen_string_literal: true

# Create molds class
class CreateMolds < ActiveRecord::Migration[6.0]
  def change
    create_table :molds do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :number, null: false
      t.timestamps
    end
    add_index :molds, %i[product_id number], unique: true
  end
end
