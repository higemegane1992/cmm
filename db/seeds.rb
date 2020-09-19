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

30.times do |i|
  3.times do |j|
    Condition.create(
      machine_id: i + 1,
      mold_id: i * 3 + j + 1,
      lis: 0.25,
      lis_u: 0.3,
      lis_l: 0.2,
      his: 3,
      his_u: 3.3,
      his_l: 2.7,
      sup: 380,
      sup_u: 385,
      sup_l: 375,
      cp: 40,
      cp_u: 45,
      cp_l: 35,
      bt: 500,
      bt_u: 1000,
      bt_l: 0,
      ssp: 150,
      ssp_u: 155,
      ssp_l: 145,
      dev: 100,
      dev_u: 120,
      dev_l: 80,
      fmf: 50,
      fmf_u: 60,
      fmf_l: 40,
      mmf: 50,
      mmf_u: 60,
      mmf_l: 40
    )
  end
end
