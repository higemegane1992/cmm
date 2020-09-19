# frozen_string_literal: true

# Condition class
class Condition < ApplicationRecord
  validates :machine_id, presence: true, uniqueness: { scope: :mold_id }
  validates :mold_id, presence: true
  validates :lis, presence: true
  validates :lis_u, presence: true
  validates :lis_l, presence: true
  validates :his, presence: true
  validates :his_u, presence: true
  validates :his_l, presence: true
  validates :sup, presence: true
  validates :sup_u, presence: true
  validates :sup_l, presence: true
  validates :cp, presence: true
  validates :cp_u, presence: true
  validates :cp_l, presence: true
  validates :bt, presence: true
  validates :bt_u, presence: true
  validates :bt_l, presence: true
  validates :ssp, presence: true
  validates :ssp_u, presence: true
  validates :ssp_l, presence: true
  validates :dev, presence: true
  validates :dev_u, presence: true
  validates :dev_l, presence: true
  validates :fmf, presence: true
  validates :fmf_u, presence: true
  validates :fmf_l, presence: true
  validates :mmf, presence: true
  validates :mmf_u, presence: true
  validates :mmf_l, presence: true

  belongs_to :machine
  belongs_to :mold
end
