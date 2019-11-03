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
  ['カルディ', '東京都葛飾区亀有3-49-3　アリオ亀有 1F', 'https://map.kaldi.co.jp/kaldi/detailMap?account=kaldi&accmd=0&arg=&adr=13&bid=083&pgret=2'],
  ['COFFEE VALLEY', '東京都豊島区南池袋２丁目２６−３', 'https://coffeevalley.jp/'],
  ['雨の日の珈琲', '千葉県柏市あけぼの4-4-2 ライネスハイム柏107', 'https://www.amenohi-coffee.jp/']
].each do |name, address, url|
  Shop.create!(
    name: name, address: address, url: url
  )
end

[
  [1, 1, 'タンザニア', 'キリマンジャロ', 'アラビカ', '', '', 'シティ', 340],
  [2, 2, 'エチオピア', 'イェルガチェフェ', '', '', 'ナチュラル', 'ハイ', 850],
  [3, 3, 'ブラジル', 'ミナスジェライス', 'ブルボン', 'トミオフクダ', 'ウォッシュド', 'フルシティ', 800]
].each do |user_id, shop_id, country, area, variety, farm, process, roast, price|
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
  Impression.create!(
    bean_id: bean_id, i_sour: i_sour, i_sweet: i_sweet, i_bitter: i_bitter, i_comment: i_comment
  )
end

[
  [1, 1, 'ブラジリアンコーヒー', '粗挽き', 90, 15, 'フレンチプレス'],
  [2, 2, 'エチオピア珈琲', '中挽き', 95, 10, 'ペーパーフィルター'],
  [3, 3, 'グアテマラの香り', '中細挽き', 85, 20, 'ネル']
].each do |user_id, bean_id, name, grind, temperature, amount, extraction|
  Recipe.create!(
    user_id: user_id, bean_id: bean_id, name: name, grind: grind, temperature: temperature,
    amount: amount, extraction: extraction
  )
end

[
  [1, 2, 3, 5, 4, 5, 'ブラジルのコーヒーは間違いない'],
  [2, 5, 2, 5, 4, 3, '高い温度で入れたほうがおいしいかも'],
  [3, 3, 5, 3, 4, 4, '最高！']
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
