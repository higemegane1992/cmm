# frozen_string_literal: true

# Machine class
class Machine < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
