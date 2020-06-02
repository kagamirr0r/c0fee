# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  ['佐藤', 'sato@sato.com', 'satosatosato', Time.now],
  ['鈴木', 'suzuki@suzuki.com', 'suzukisuzuki', Time.now],
  ['高橋', 'takahashi3@takahashi.com', 'takahashi', Time.now]
].each do |name, mail, pass, confirmed|
	I18n.locale = :ja
  User.create!(
    username: name, email: mail, password: pass, confirmed_at: confirmed
  )
end

[
  ['SMITH', 'smith@smith.com', 'smithsmith', Time.now],
  ['JOHNSON', 'johnson@johnson.com', 'johnson', Time.now],
  ['WILLIAMS', 'williams@williams.com', 'williams', Time.now]
].each do |name, mail, pass, confirmed|
	I18n.locale = :en
  User.create!(
    username: name, email: mail, password: pass, confirmed_at: confirmed
  )
end

[
  ['カルディ', '東京都葛飾区亀有3-49-3　アリオ亀有 1F', 'https://map.kaldi.co.jp/kaldi/detailMap?account=kaldi&accmd=0&arg=&adr=13&bid=083&pgret=2',35.7644551,139.8525919],
  ['COFFEE VALLEY', '東京都豊島区南池袋２丁目２６−３', 'https://coffeevalley.jp/',35.7277996,139.7132372],
  ['雨の日の珈琲', '千葉県柏市あけぼの4-4-2 ライネスハイム柏107', 'https://www.amenohi-coffee.jp/',35.8663161,139.9699134]
].each do |name, address, url, latitude, longitude|
	I18n.locale = :ja
  Shop.create!(
    name: name, address: address, url: url
  )
end

[
  ['Starbucks Coffee Pike Place', '1912 Pike Place Seattle, WA 98101', 'https://www.starbucks.com/store-locator/store/11676/pike-place-1912-pike-place-seattle-wa-981011013-us',47.609966,-122.342323],
  ['The Coffee Bean & Tea leaf Pico Blvd', '9541 W. Pico Blvd. Los Angeles CA 90035 USA', 'https://www.coffeebean.com/store/usa/los-angeles/pico-and-smithwood',34.055595, -118.396758],
  ['Honolulu Coffee Experience Center', '1800 Kalakaua Ave Honolulu, HI 96815', 'https://www.honolulucoffee.com/pages/honolulu-coffee-experience-center',21.290679, -157.835092]
].each do |name, address, url, latitude, longitude|
	I18n.locale = :en
  Shop.create!(
    name: name, address: address, url: url
  )
end

[
  [1, 1, 'タンザニア', 'キリマンジャロ', 'アラビカ', '', 6, 4, 340],
  [2, 2, 'エチオピア', 'イェルガチェフェ', '', '', 1, 3, 850],
  [3, 3, 'ブラジル', 'ミナスジェライス', 'ブルボン', 'トミオフクダ', 0, 5, 800]
].each do |user_id, shop_id, country, area, variety, farm, process, roast, price|
	I18n.locale = :ja
  Bean.create!(
    user_id: user_id, shop_id: shop_id, country: country, area: area,
    variety: variety, farm: farm, process: process, roast: roast,
    price: price
  )
end

[
  [4, 4, 'Tanzania', 'Kilimanjaro', 'Arabica', '', 6, 4, 340],
  [5, 5, 'Ethiopia', 'Yirgacheffe', '', '', 1, 3, 850],
  [6, 6, 'Brazil', 'Minas Gerais', 'Bourbon', 'TomioFukuda', 0, 5, 800]
].each do |user_id, shop_id, country, area, variety, farm, process, roast, price|
	I18n.locale = :en
  Bean.create!(
    user_id: user_id, shop_id: shop_id, country: country, area: area,
    variety: variety, farm: farm, process: process, roast: roast,
    price: price
  )
end


[
  [1, 3, 3, 5, '美味しい!'],
  [2, 5, 3, 3, '酸っぱくていいぞ!'],
  [3, 3, 5, 3, '初めての農園だけど美味しい！']
].each do |bean_id, i_sour, i_sweet, i_bitter, i_comment|
	I18n.locale = :ja
  Impression.create!(
    bean_id: bean_id, i_sour: i_sour, i_sweet: i_sweet, i_bitter: i_bitter, i_comment: i_comment
  )
end

[
  [4, 3, 3, 5, 'Delicious!'],
  [5, 5, 3, 3, 'Strong Sour and I hate Trump!'],
  [6, 3, 5, 3, 'This is firadt time I bought this. I apreciate all people for this beans!']
].each do |bean_id, i_sour, i_sweet, i_bitter, i_comment|
	I18n.locale = :en
  Impression.create!(
    bean_id: bean_id, i_sour: i_sour, i_sweet: i_sweet, i_bitter: i_bitter, i_comment: i_comment
  )
end

[
  [1, 1, 0, 0, 90, 15, 3],
  [2, 2, 0, 1, 95, 10, 0],
  [3, 3, 1, 2, 85, 20, 10]
].each do |user_id, bean_id, hot_ice, grind, temperature, amount, extraction|
	I18n.locale = :ja
  Recipe.create!(
    user_id: user_id, bean_id: bean_id, hot_ice: hot_ice, grind: grind, temperature: temperature,
    amount: amount, extraction: extraction
  )
end

[
  [4, 4, 0, 0, 90, 15, 3],
  [5, 5, 0, 1, 95, 10, 0],
  [6, 6, 1, 2, 85, 20, 10]
].each do |user_id, bean_id, hot_ice, grind, temperature, amount, extraction|
	I18n.locale = :en
  Recipe.create!(
    user_id: user_id, bean_id: bean_id, hot_ice: hot_ice, grind: grind, temperature: temperature,
    amount: amount, extraction: extraction
  )
end

[
  [1, 2, 3, 5, 4, 5, 'ブラジルのコーヒーは間違いない'],
  [2, 5, 2, 5, 4, 3, '高い温度で入れたほうがおいしいかも'],
  [3, 3, 5, 3, 4, 4, '最高！']
].each do |recipe_id, t_sour, t_sweet, t_bitter, t_aroma, t_fullbody, t_comment|
	I18n.locale = :ja
  Taste.create!(
    recipe_id: recipe_id, t_sour: t_sour, t_sweet: t_sweet, t_bitter: t_bitter,
    t_aroma: t_aroma, t_fullbody: t_fullbody, t_comment: t_comment
  )
end

[
  [4, 2, 3, 5, 4, 5, 'Brazil beans are truelly awesome!'],
  [5, 5, 2, 5, 4, 3, 'I recommend make coffee with high tempreture hot water'],
  [6, 3, 5, 3, 4, 4, 'GOOOD！']
].each do |recipe_id, t_sour, t_sweet, t_bitter, t_aroma, t_fullbody, t_comment|
	I18n.locale = :en
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
	I18n.locale = :ja
  BeanLike.create!(
    user_id: user_id, bean_id: bean_id
  )
end

[
  [4, 5],
  [5, 6],
  [6, 4]
].each do |user_id, bean_id|
	I18n.locale = :en
  BeanLike.create!(
    user_id: user_id, bean_id: bean_id
  )
end

[
  [1, 2],
  [2, 3],
  [3, 1]
].each do |user_id, recipe_id|
	I18n.locale = :ja
  RecipeLike.create!(
    user_id: user_id, recipe_id: recipe_id
  )
end

[
  [4, 5],
  [5, 6],
  [6, 4]
].each do |user_id, recipe_id|
	I18n.locale = :en
  RecipeLike.create!(
    user_id: user_id, recipe_id: recipe_id
  )
end



[
  [1, 2],
  [2, 3],
  [3, 1]
].each do |user_id, shop_id|
	I18n.locale = :ja
  ShopLike.create!(
    user_id: user_id, shop_id: shop_id
  )
end

[
  [4, 5],
  [5, 6],
  [6, 4]
].each do |user_id, shop_id|
	I18n.locale = :en
  ShopLike.create!(
    user_id: user_id, shop_id: shop_id
  )
end
