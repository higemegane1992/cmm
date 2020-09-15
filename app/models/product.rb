# frozen_string_literal: true

# Product class
class Product < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_many :molds
end
