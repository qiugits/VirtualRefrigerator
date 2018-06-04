User.create!(name: "Ikuko")
user = User.first


require 'csv'
CSV.foreach(Rails.root + 'db/nutr_data_utf8.csv') do |row|
	FoodKind.create!(
    :kindname => row[0], 
    :protein => row[1],
    :lipd => row[2], 
    :carbon => row[3],
    :vitamin => row[4],
    :minerals => row[5]
  )
end

50.times do
  kind = FoodKind.offset(rand(FoodKind.count)).first
  amount = rand(5)
  user.foods.create!(
    foodname: kind.kindname,
    kind_id: kind.id,
    amount: amount,
    protein: kind.protein * amount,
    lipd: kind.lipd * amount,
    carbon: kind.carbon * amount,
    vitamin: kind.vitamin * amount,
    minerals: kind.minerals * amount,
  )
end
