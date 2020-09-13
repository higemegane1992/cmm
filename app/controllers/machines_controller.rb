# frozen_string_literal: true

# Machines controller
class MachinesController < ApplicationController
  def index
    @machines = Machine.all
  end

  def new
    @machine = Machine.new
  end

  def create
    Machine.create(machine_params)
    redirect_to machines_path, notice: '新しい生産ラインが登録されました'
  end

  def show
    @machine = Machine.find(params[:id])
  end

  private

  def machine_params
    params.require(:machine).permit(:name)
  end
end
