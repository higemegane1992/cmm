# frozen_string_literal: true

json.conditions(@conditions) do |condition|
  json.machine condition.machine.name
  json.product condition.mold.product.name
  json.mold condition.mold.number
  json.show condition_path(condition)
  json.edit edit_condition_path(condition)
end 
