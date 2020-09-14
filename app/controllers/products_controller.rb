# frozen_string_literal: true

# Products controller class
class ProductsController < ApplicationController
  add_breadcrumb '品種一覧', :products_path

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    add_breadcrumb '新規登録'
  end

  def create
    Product.create(product_params)
    redirect_to products_path, notice: '新しい品種が登録されました'
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb @product.name
  end

  def edit
    @product = Product.find(params[:id])
    add_breadcrumb @product.name, :product_path
    add_breadcrumb '編集'
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to product_path, notice: '登録内容が更新されました'
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path, notice: '生産ラインが削除されました'
  end

  private

  def product_params
    params.require(:product).permit(:number, :name)
  end
end
