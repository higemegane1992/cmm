# frozen_string_literal: true

# Machines controller
class MachinesController < ApplicationController
  add_breadcrumb "生産ライン一覧", :machines_path

  def index
    @machines = Machine.all
  end

  def new
    @machine = Machine.new
    add_breadcrumb "新規登録"
  end

  def create
    Machine.create(machine_params)
    redirect_to machines_path, notice: "新しい生産ラインが登録されました"
  end

  def show
    @machine = Machine.find(params[:id])
    add_breadcrumb "#{@machine.name}号機"
  end

  def edit
    @machine = Machine.find(params[:id])
    add_breadcrumb "#{@machine.name}号機", :machine_path
    add_breadcrumb "編集"
  end

  def update
    machine = Machine.find(params[:id])
    machine.update(machine_params)
    redirect_to machine_path, notice: "登録内容が更新されました"
  end

  def destroy
    machine = Machine.find(params[:id])
    machine.destroy
    redirect_to machines_path, notice: "生産ラインが削除されました"
  end

  private

  def machine_params
    params.require(:machine).permit(:name)
  end
end
