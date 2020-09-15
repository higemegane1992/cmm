# Molds controller class
class MoldsController < ApplicationController
  add_breadcrumb '品種一覧', :products_path

  def new
    @product = Product.find(params[:product_id])
    @mold = Mold.new
    add_breadcrumb @product.name
    add_breadcrumb '金型の新規登録'
  end

  def create
    product = Product.find(params[:product_id])
    Mold.create(mold_params)
    redirect_to product_path(product), notice: '新しい金型が登録されました'
  end

  def show
    @product = Product.find(params[:product_id])
    @mold = Mold.find(params[:id])
    add_breadcrumb @product.name
    add_breadcrumb "#{@mold.number}次型"
  end

  def destroy
    product = Product.find(params[:product_id])
    mold = Mold.find(params[:id])
    mold.destroy
    redirect_to product_path(product), notice: '金型が削除されました'
  end

  private

  def mold_params
    params.require(:mold).permit(:number).merge(product_id: params[:product_id])
  end
end
