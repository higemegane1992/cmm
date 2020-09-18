# frozen_string_literal: true

# Condiitons controller class
class ConditionsController < ApplicationController
  add_breadcrumb '条件表一覧', :conditions_path

  def index
  end

  def search
    machine_ids = Machine.where('name LIKE(?)', "%#{params[:machine]}%").ids
    product_ids = Product.where('name LIKE(?)', "%#{params[:product]}%").ids
    mold_ids = Mold.where('product_id': product_ids).ids
    @conditions = Condition.where('machine_id': machine_ids, 'mold_id': mold_ids)
    respond_to do |format|
      format.json
    end
  end
end
