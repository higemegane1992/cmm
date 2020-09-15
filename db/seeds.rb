# frozen_string_literal: true

10.times do |i|
  3.times do |j|
    Machine.create(name: "#{i + 1}-#{j + 1}")
  end
end

15.times do |num|
  Product.create(
    number: "000000-000#{format('%<foo>02d', foo: num + 1)}",
    name: "000#{format('%<foo>02d', foo: num + 1)}"
  )
end

15.times do |i|
  6.times do |j|
    Mold.create(product_id: i + 1, number: j + 1)
  end
end
