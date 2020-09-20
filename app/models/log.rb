# frozen_string_literal: true

# Log class
class Log < ApplicationRecord
  validates :machine_id, presence: true
  validates :mold_id, presence: true
  validates :lis, presence: true
  validates :his, presence: true
  validates :sup, presence: true
  validates :cp, presence: true
  validates :bt, presence: true
  validates :ssp, presence: true
  validates :dev, presence: true
  validates :fmf, presence: true
  validates :mmf, presence: true

  belongs_to :machine
  belongs_to :mold
end
