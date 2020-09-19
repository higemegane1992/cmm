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

  def new
    @condition = Condition.new
    @product_mold_lists = {}
    Mold.all.each do |mold|
      @product_mold_lists.store("#{Product.find(mold.product_id).name} #{mold.number}次型", mold.id)
    end
    add_breadcrumb '新規登録'
  end

  def create
    Condition.create(condition_params)
    redirect_to conditions_path, notice: '新しい条件表が登録されました'
  end

  def show
    @condition = Condition.find(params[:id])
    add_breadcrumb "#{@condition.machine.name}号機 #{@condition.mold.product.name} #{@condition.mold.number}次型"
  end

  def edit
    @condition = Condition.find(params[:id])
    @product_mold_lists = {}
    Mold.all.each do |mold|
      @product_mold_lists.store("#{Product.find(mold.product_id).name} #{mold.number}次型", mold.id)
    end
    add_breadcrumb "#{@condition.machine.name}号機 #{@condition.mold.product.name} #{@condition.mold.number}次型", :condition_path
    add_breadcrumb '編集'
  end

  def update
    condition = Condition.find(params[:id])
    condition.update(condition_params)
    redirect_to condition_path, notice: '登録内容が更新されました'
  end

  def destroy
    condition = Condition.find(params[:id])
    condition.destroy
    redirect_to conditions_path, notice: '条件表が削除されました'
  end

  private

  def condition_params
    params.require(:condition).permit(:machine_id, :mold_id, :lis, :lis_u, :lis_l, :his, :his_u, :his_l, :sup, :sup_u, :sup_l, :cp, :cp_u, :cp_l, :bt, :bt_u, :bt_l, :ssp, :ssp_u, :ssp_l, :dev, :dev_u, :dev_l, :fmf, :fmf_u, :fmf_l, :mmf, :mmf_u, :mmf_l)
  end
end
