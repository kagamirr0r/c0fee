# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  ['example1', 'example1@example.com', 'example', Time.now],
  ['example2', 'example2@example.com', 'example2', Time.now],
  ['example3', 'example3@example.com', 'example3', Time.now]
].each do |name, mail, pass, confirmed|
  User.create!(
    username: name, email: mail, password: pass, confirmed_at: confirmed
  )
end

[
  ['KALDI', 'Tokyo Itabashi-ku Narimasu 2-17-15 HatsuneBldg.1F', 'https://map.kaldi.co.jp/kaldi/detailMap?account=kaldi&accmd=0&adr=13104&bpref=13119&bid=185&pgret=2'],
  ['COFFEE VALLEY', 'Tokyo Toshima-ku 2-26-3', 'https://coffeevalley.jp/'],
  ['Amenohino-Coffee', 'Chiba Kashiwa-City Akebono 4-4-2', 'https://www.amenohi-coffee.jp/']
].each do |name, address, url|
  Shop.create!(
    name: name, address: address, url: url
  )
end

[
  [1,1,'Tanazania', 'Kilimanjaro', 'arabica', '', '', 'city', 340],
  [2,2,'Ethiopia', 'Yirgacheffe', '', '', 'natural', 'high', 850],
  [3,3,'Brazil', 'Minasgerais', 'bourbon', 'tomiofukuda', 'washed', 'fullcity', 800]
].each do |user_id, shop_id, country, area, variety, farm, process, roast, price|
  Bean.create!(
    user_id: user_id, shop_id: shop_id, country: country, area: area,
    variety: variety, farm: farm, process: process, roast: roast,
    price: price
  )
end

[
  [1, 3, 3, 5, 'Delicious!'],
  [2, 5, 3, 3, 'Sour and Delicious!'],
  [3, 3, 5, 3, 'All beans sold in this shop are great!!']
].each do |bean_id, i_sour, i_sweet, i_bitter, i_comment|
  Impression.create!(
    bean_id: bean_id, i_sour: i_sour, i_sweet: i_sweet, i_bitter: i_bitter, i_comment: i_comment
  )
end

[
  [1,1, 'Brasil Hot Coffee', 'Coarse', 90, 15, 'nel'],
  [2,2, 'Ethiopia Hot Coffee', 'Medium', 95, 10, 'paper'],
  [3,3, 'Guatemala Iced Coffee', 'Fine', 85, 20, 'franchpress']
].each do |user_id, bean_id, name, grind, temperature, amount, extraction|
  Recipe.create!(
    user_id: user_id, bean_id: bean_id, name: name, grind: grind, temperature: temperature,
    amount: amount, extraction: extraction
  )
end

[
  [1, 2, 3, 5, 4, 5, 'Brazilian coffee is definitely delicious'],
  [2, 5, 2, 5, 4, 3, 'It is better to brew in high tempreture'],
  [3, 3, 5, 3, 4, 4, 'Awesome!!']
].each do |recipe_id, t_sour, t_sweet, t_bitter, t_aroma, t_fullbody, t_comment|
  Taste.create!(
    recipe_id: recipe_id, t_sour: t_sour, t_sweet: t_sweet, t_bitter: t_bitter,
    t_aroma: t_aroma, t_fullbody: t_fullbody, t_comment: t_comment
  )
end

[
  [1, 2],
  [2, 3],
  [3, 1]
].each do |user_id, bean_id|
  BeanLike.create!(
    user_id: user_id, bean_id: bean_id
  )
end

[
  [1, 2],
  [2, 3],
  [3, 1]
].each do |user_id, recipe_id|
  RecipeLike.create!(
    user_id: user_id, recipe_id: recipe_id
  )
end
