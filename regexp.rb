# 実行方法
# $ docker-compose run web rails runner regexp.rb
# または
# $ rails runner regexp.rb

# 要件定義
# 文字列を受け取って文字列を返す
# foodの名前を受け取って、正規表現でいい感じの短い文字列にする
def shorten(foodname)
  return foodname
end

FoodKind.all.each do |food|
  puts shorten(food.kindname)
end
