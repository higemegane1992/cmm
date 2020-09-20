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

7.times do |i|
  30.times do |j|
    48.times do |k|
      Log.create(
        machine_id: j + 1,
        mold_id: i % 3 + j * 3 + 1,
        lis: Faker::Number.between(from: 0.2, to: 0.3),
        his: Faker::Number.between(from: 2.7, to: 3.3),
        sup: Faker::Number.between(from: 375, to: 385),
        cp: Faker::Number.between(from: 35, to: 45),
        bt: Faker::Number.between(from: 0, to: 1000),
        ssp: Faker::Number.between(from: 145, to: 155),
        dev: Faker::Number.between(from: 80, to: 120),
        fmf: Faker::Number.between(from: 60, to: 40),
        mmf: Faker::Number.between(from: 60, to: 40),
        created_at: Time.parse('2020/09/15 00:00:00') + i * 60 * 60 * 24 + k * 60 * 30,
        updated_at: Time.parse('2020/09/15 00:00:00') + i * 60 * 60 * 24 + k * 60 * 30
      )
    end
  end
end
