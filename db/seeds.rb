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
