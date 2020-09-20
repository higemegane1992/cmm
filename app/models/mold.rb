# frozen_string_literal: true

# Mold class
class Mold < ApplicationRecord
  validates :product_id, presence: true, uniqueness: { scope: :number }
  validates :number, presence: true

  belongs_to :product
  has_many :conditions
  has_many :logs
end
