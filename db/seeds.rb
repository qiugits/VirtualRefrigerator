User.create!(name: "Ikuko")

user = User.first
# https://github.com/stympy/faker/blob/master/doc/food.md
50.times do
  food = Faker::Food.ingredient
  kind = FoodKind.create(
    kindname: food,
    nutrition_a: 20
  )
  user.foods.create!(
    foodname: food,
    amount: 1,
    kind_id: kind.id
  )
end


require 'csv'
CSV.foreach(Rails.root + 'db/nutr_data_utf8.csv') do |row|
	FoodKind.create!(:kindname => row[0], :protein => row[1], :lipd => row[2], :carbon => row[3],:vitamin => row[4], :minerals => row[5])
end

