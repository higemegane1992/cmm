# frozen_string_literal: true

# Machines controller
class MachinesController < ApplicationController
  def index
    @machines = Machine.all
  end
end
