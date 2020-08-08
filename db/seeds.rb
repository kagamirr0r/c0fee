# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#I18n.locale = :ja
[
	['ゲストマン', 'guestja@guest.com', 'guestmanja', Time.now]
].each do |name, mail, pass, confirmed_at|
	#I18n.locale = :ja
  User.create!(
    username: name, email: mail, password: pass, avatar: open("db/fixtures/avatar1.jpg"), confirmed_at: confirmed_at
  )
end

2.upto(12) do |n|
	#I18n.locale = :ja
	username = Faker::Internet.username
	email = Faker::Internet.free_email
	password = Faker::Internet.password
	confirmed_at = Time.now
	User.create!(
		username: username, email: email, password: password, avatar: open("db/fixtures/avatar#{n}.jpg"), confirmed_at: confirmed_at
	)
end

[
	['スターバックスコーヒー 銀座松屋通り店', '東京都中央区銀座３丁目７−１４ ESKビル 1F', 'https://store.starbucks.co.jp/detail-1/',File.open('db/fixtures/shop1.jpg'),35.671700, 139.766601],
	['カルディコーヒーファーム 下高井戸店', '東京都世田谷区松原3-29-20 稲川ビル1F', 'https://map.kaldi.co.jp/kaldi/detailMap?account=kaldi&accmd=0&adr=13&bpref=13112&bid=004&pgret=2',File.open('db/fixtures/shop2.jpg'),35.666357, 139.641513],
	['やなか珈琲店 谷中店', '東京都台東区谷中3-8-6', 'https://www.yanaka-coffeeten.com/', File.open('db/fixtures/shop3.jpg'),35.726894, 139.764729],
	['サザコーヒー本店', '茨城県ひたちなか市共栄町', 'https://www.saza.co.jp/', File.open('db/fixtures/shop4.jpg'),36.398315, 140.527000],
	['雨の日の珈琲', '千葉県柏市あけぼの4-4-2 ライネスハイム柏107', 'https://www.amenohi-coffee.jp/', File.open('db/fixtures/shop5.jpg'),35.8663161,139.9699134],
	['COFFEE VALLEY', '東京都豊島区南池袋２丁目２６−３', 'https://coffeevalley.jp/', File.open('db/fixtures/shop6.jpg'),35.7277996,139.7132372],
	['LIGHT UP COFFEE', '東京都武蔵野市吉祥寺本町4-13-15', 'https://lightupcoffee.com/', File.open('db/fixtures/shop7.jpg'),35.705462, 139.572519],
	['LiLo Coffee Roasters', '大阪府大阪市中央区西心斎橋１丁目１−10-28 心斎橋Mビル', 'https://coffee.liloinveve.com/',  File.open('db/fixtures/shop8.jpg'),34.674107, 135.498055],
	['SWITCH COFFEE TOKYO', '東京都目黒区目黒１丁目１７−２３', 'http://www.switchcoffeetokyo.com/', File.open('db/fixtures/shop9.jpg'),35.636246, 139.709597],
	['マメココロ', '東京都足立区千住1-27-1', 'https://ja-jp.facebook.com/mamecocoro/', File.open('db/fixtures/shop10.jpg'),35.747845, 139.801818],
	['WEEKENDERS COFFEE 富小路', '京都市中京区富小路通六角下ル西側骨屋之町560離れ', 'https://weekenderscoffee.com/', File.open('db/fixtures/shop11.jpg'),35.006792, 135.764502],
	['SOLITO MAGO COFEE LAB 柏の葉　珈琲研究所', '千葉県柏市若柴226番地42 中央144街区2 C棟', 'https://m.facebook.com/Solito-MAGO-Coffee-LABO-113815916659981/', File.open('db/fixtures/shop23.jpg'),35.896506, 139.953813]
].each do |name, address, url, shop_image, latitude, longitude|
	I18n.locale = :ja
  Shop.create!(
    name: name, address: address, url: url, shop_image: shop_image, latitude: latitude, longitude: longitude
  )
end

[
	[1, 1, 7, 'ニューオリエンテ', '', '', 0, 5, 1040, File.open('db/fixtures/bean1.jpg')],
	[2, 2, 0, 'モカマタリ','', '','' , 5, 800, File.open('db/fixtures/bean2.jpg')],
	[3, 3, 2, 'トラジャ', 0, 'スロトコ', 0, 5, 800,File.open('db/fixtures/bean3.jpg')],
	[4, 4, 25, 'クスコ', 1, '', 1, 4, 600,File.open('db/fixtures/bean4.jpg')],
	[5, 5, 27, 'ラ・フロリダ', 0, 'ラ　フロレンシア', 0, 4, 750,File.open('db/fixtures/bean5.jpg')],
	[6, 6, 22, 'カルモデミナス', 1, 'モンテアレグレ', 1, 5, 600,File.open('db/fixtures/bean6.jpg')],
	[7, 7, 4, 'グジ シャキソ', 10, 'シャキソ',0,2,870,File.open('db/fixtures/bean7.jpg')],
	[8, 8, 29, 'ソコヌスコ', 14, 'Finca Guadelupe Zaju',0,4,950,File.open('db/fixtures/bean8.jpg')],
	[9, 9, 5, 'アパネカ', 1, '',2,3,900,File.open('db/fixtures/bean9.jpg')],
	[10, 10, 23, 'ムインガ', 1, '', 0,4,410 ,File.open('db/fixtures/bean10.jpg')],
	[11, 11, 30, 'ドゥクンデカワ ミビリマ', 1, '', 0,2,750,''],
	[12, 12, 4, 'グジ', 9, '', '', 3, 880, File.open('db/fixtures/bean12.jpg')],
].each do |user_id, shop_id, country, area, variety, farm, process, roast, price, bean_image|
	I18n.locale = :ja
  Bean.create!(
    user_id: user_id, shop_id: shop_id, country: country, area: area,
    variety: variety, farm: farm, process: process, roast: roast, roast_date: Time.now, price: price, bean_image: bean_image
  )
end

[
  [1, 3, 3, 5, '美味しい!でも高い！'],
  [2, 2, 5, 4, 'ワインのような香り。やわらかい甘味とコクがある'],
	[3, 3, 5, 3, '初めての農園だけど美味しい！'],
	[4, 1, 4, 4, 'すっきりとしてる。後に甘さが残る'],
	[5, 2, 5, 4, '完熟感があり、甘味もたっぷりあります'],
	[6, 3, 3, 4, 'アーモンドっぽいさせるビター感'],
	[7, 5, 2, 3, 'さくらんぼやセイロンティーを思わせるような風味'],
	[8, 5, 3, 3, '独特の酸味！さっぱりとしたお菓子に合う！'],
	[9, 5, 2, 2, '酸味が強くて美味しい。アイスにしてもうまい'],
	[10, 2, 4, 4, 'バランスが良くてうまい。'],
	[11, 3, 4, 4, 'すっきりした苦味。夏の定番になるかも'],
	[12, 5, 3, 3, 'ゲイシャがこの価格！めちゃ安い']
].each do |bean_id, i_sour, i_sweet, i_bitter, i_comment|
	I18n.locale = :ja
  Impression.create!(
    bean_id: bean_id, i_sour: i_sour, i_sweet: i_sweet, i_bitter: i_bitter, i_comment: i_comment
  )
end

[
  [1, 1, 0, 3, 90, 15, 150, 2, File.open('db/fixtures/recipe1.jpg')],
  [2, 2, 0, 3, 92, 15, 200, 0, File.open('db/fixtures/recipe2.jpg')],
	[3, 3, 0, 1, 88, 20, 200, 3, File.open('db/fixtures/recipe3.jpg')],
	[4, 4, 0, 4, 90, 20, 150, 0, File.open('db/fixtures/recipe4.jpg')],
	[5, 5, 1, 4, 93, 25, 200, 10, File.open('db/fixtures/recipe5.jpg')],
	[6, 6, 0, 3, 88, 25, 250, 6, File.open('db/fixtures/recipe6.jpg')],
	[7, 7, 0, 4, 95, 20, 200, 2, File.open('db/fixtures/recipe7.jpg')],
	[8, 8, 0, 4, 90, 20, 200, 1, File.open('db/fixtures/recipe8.jpg')],
	[9, 9, 1, 4, 93, 30, 250, 10, File.open('db/fixtures/recipe9.jpg')],
	[10, 10, 0, 3, 93, 30, 250, 5, File.open('db/fixtures/recipe10.jpg')],
	[11, 11, 0, 3, 88, 20, 200, 0, File.open('db/fixtures/recipe11.jpg')],
	[12, 12, 0, 5, 93, 15, 150, 1, File.open('db/fixtures/recipe12.jpg')]
].each do |user_id, bean_id, hot_ice, grind, temperature, amount, extracted_amount, extraction, recipe_image|
	I18n.locale = :ja
  Recipe.create!(
    user_id: user_id, bean_id: bean_id, hot_ice: hot_ice, grind: grind, temperature: temperature,
    amount: amount, extracted_amount: extracted_amount, extraction: extraction, recipe_image: recipe_image
  )
end

[
  [1, 3, 3, 3, 5, 5, '美味しい!１週間後が楽しみ'],
  [2, 5, 2, 5, 4, 3, '90度ぐらいで入れたほうがおいしいかも'],
	[3, 3, 3, 2, 4, 5, 'コクがあって美味しい！'],
	[4, 1, 4, 4, 3, 4, '甘い。ネルでも試したい'],
	[5, 2, 5, 4, 4, 4, '独特の香り。アイスでもうまかった'],
	[6, 3, 3, 4, 4, 5, '苦い。目を覚ましたいときはこれ'],
	[7, 5, 2, 3, 5, 3, '酸味が強い。撹拌して淹れると美味しい'],
	[8, 5, 3, 3, 4, 5, '美味しい。ミルク入れても美味しい'],
	[9, 5, 3, 3, 4, 5, '夏はこれよ'],
	[10, 2, 4, 4, 4, 3, 'サイフォンで淹れるとすっきり'],
	[11, 3, 4, 4, 4, 3, '甘いパンにめっちゃ合う'],
	[12, 5, 3, 2, 4, 3, '冷めてからの酸味が美味しい〜']
].each do |recipe_id, t_sour, t_sweet, t_bitter, t_aroma, t_fullbody, t_comment|
	I18n.locale = :ja
  Taste.create!(
    recipe_id: recipe_id, t_sour: t_sour, t_sweet: t_sweet, t_bitter: t_bitter,
    t_aroma: t_aroma, t_fullbody: t_fullbody, t_comment: t_comment
  )
end

# I18n.locale = :en
[
	['GuestMan', 'guesten@guest.com', 'guestmanen', Time.now]
].each do |name, mail, pass, confirmed_at|
	#I18n.locale = :en
	User.create!(
	  username: name, email: mail, password: pass, avatar: open("db/fixtures/avatar12.jpg"), confirmed_at: confirmed_at
	)
end

14.upto(23) do |n|
	#I18n.locale = :en
	username = Faker::Internet.username
	email = Faker::Internet.free_email
	password = Faker::Internet.password
	confirmed_at = Time.now
	User.create!(
		username: username, email: email, password: password, avatar: open("db/fixtures/avatar#{n}.jpg"), confirmed_at: confirmed_at
	)
end

[
	['Starbucks Coffee Pike Place', '1912 Pike Place Seattle, WA 98101', 'https://www.starbucks.com/store-locator/store/11676/pike-place-1912-pike-place-seattle-wa-981011013-us',File.open('db/fixtures/shop12.jpg'),47.609966,-122.342323],
 	['The Coffee Bean & Tea leaf Pico & Smithwood', '9541 W. Pico Blvd. Los Angeles CA 90035 USA', 'https://www.coffeebean.com/store/usa/los-angeles/pico-and-smithwood',File.open('db/fixtures/shop13.jpg'),34.055595, -118.396758],
	['Honolulu Coffee Experience Center', '1800 Kalakaua Ave Honolulu, HI 96815', 'https://www.honolulucoffee.com/pages/honolulu-coffee-experience-center',File.open('db/fixtures/shop14.jpg'),21.290679, -157.835092],
	['Stumptown Coffee Roasters Divisions', '4525 SE Division Street Portland, OR 97206', 'https://www.stumptowncoffee.com/locations/portland/division',File.open('db/fixtures/shop15.jpg'),45.505504, -122.615562],
	['Bird Rock La Jolla','5627 La Jolla Blvd, La Jolla, CA 92037','https://www.birdrockcoffee.com/',File.open('db/fixtures/shop16.jpg'),32.814479, -117.269759],
	['Devoción', '69 Grand St, Brooklyn, NY 11249','https://www.devocion.com/', File.open('db/fixtures/shop17.jpg'),40.716057, -73.964690],
	['George Howell Coffee', '505 Washington St, Boston, MA 02111','https://www.georgehowellcoffee.com/',File.open('db/fixtures/shop18.jpg'),42.362057, -71.057043],
	['Go Get Em Tiger', '230 N Larchmont Blvd, Los Angeles, CA 90004','https://gget.com/',File.open('db/fixtures/shop19.jpg'),34.075583, -118.323485],
	['JBC Coffee Roasters','5821 Femrite Dr # H, Madison, WI 53718','http://www.jbccoffeeroasters.com/',File.open('db/fixtures/shop20.jpg'),43.051040, -89.278895],
	['Mostra Coffee', '12045 Carmel Mountain Rd Ste 302, San Diego, CA 92128','http://www.mostracoffee.com/',File.open('db/fixtures/shop21.jpg'),32.983281, -117.075453],
	['Passenger Coffee & Tea Showroom','7 W King St, Lancaster, PA 17602','http://passengercoffee.com/',File.open('db/fixtures/shop22.jpg'),40.038126, -76.306330]
].each do |name, address, url, shop_image, latitude, longitude|
	I18n.locale = :en
  Shop.create!(
    name: name, address: address, url: url, shop_image: shop_image, latitude: latitude, longitude: longitude
  )
end

[
	[13, 13, 17, '', '', '', 3, 4, 2.5, File.open('db/fixtures/bean13.jpg')],
  [14, 14, 9, '', '', '', 1, 3, 0.6, File.open('db/fixtures/bean14.jpg')],
	[15, 15, 20, '', '', '', 3, 4, 5.8, File.open('db/fixtures/bean15.jpg')],
	[16, 16, 7, 'Huehuetenango', 1, 'El Injerto', '', 4, 3.66, File.open('db/fixtures/bean16.jpg')],
	[17, 17, 10, 'Huila', 1, '', '', 5, 1.66, File.open('db/fixtures/bean17.jpg')],
	[18, 18, 10, 'Tolima', 15, '', '', 5, 1.9, File.open('db/fixtures/bean18.jpg')],
	[19, 19, 18, 'Boquete', 9, 'La Esmeralda', 0, 2, 16.9, ''],
	[20, 20, 3, 'Habitat Forest', 2, '', '', 4, 1.9, File.open('db/fixtures/bean20.jpg')],
	[21, 21, 8, 'KIRINYAGA', 12, '', 0, 5, 1.75, File.open('db/fixtures/bean21.jpg')],
	[22, 22, 24, 'Cau Dat', '', '', 0, 4, 1.5, File.open('db/fixtures/bean22.jpg')],
	[23, 23, 22, 'Kayanza', 1, '', 0, 4, 1.5, File.open('db/fixtures/bean23.jpg')]
].each do |user_id, shop_id, country, area, variety, farm, process, roast, price, bean_image|
	I18n.locale = :en
  Bean.create!(
    user_id: user_id, shop_id: shop_id, country: country, area: area,
    variety: variety, farm: farm, process: process, roast: roast, roast_date: Time.now, price: price, bean_image: bean_image
  )
end

[
  [13, 3, 3, 3, 'Delicious! But little bit expensive.'],
  [14, 5, 3, 3, 'Bring Back Costa Rica from coffee beans!'],
	[15, 3, 5, 3, 'The smell is very gorgeous！'],
	[16, 3, 5, 5, 'I wanna say thank you to a farm directly!'],
	[17, 4, 2, 1, 'Its strong sour. I recommend brew with high hot water'],
	[18, 2, 3, 4, 'LA PRIMAVERA WOMEN IN COFFEE'],
	[19, 5, 4, 2, 'NO NEED WORD!'],
	[20, 3, 3, 4, 'Bulanced'],
	[21, 4, 4, 4, 'Bitter and sweet and beautiful!'],
	[22, 2, 4, 5, 'Bitter. its so match with milk.'],
	[23, 3, 3, 3, 'This is my first time buy beans of Burunji. it was awesome.']
].each do |bean_id, i_sour, i_sweet, i_bitter, i_comment|
	I18n.locale = :en
  Impression.create!(
    bean_id: bean_id, i_sour: i_sour, i_sweet: i_sweet, i_bitter: i_bitter, i_comment: i_comment
  )
end

[
  [13, 13, 0, 2, 90, 15, 150, 6, File.open('db/fixtures/recipe13.jpg')],
  [14, 14, 0, 4, 95, 10, 100, 0, File.open('db/fixtures/recipe14.jpg')],
	[15, 15, 0, 4, 88, 20, 200, 0, File.open('db/fixtures/recipe15.jpg')],
	[16, 16, 1, 4, 93, 25, 200, 2, File.open('db/fixtures/recipe16.jpg')],
	[17, 17, 0, 4, 95, 25, 200, 0, File.open('db/fixtures/recipe17.jpg')],
	[18, 18, 0, 3, 90, 20, 200, 1, File.open('db/fixtures/recipe18.jpg')],
	[19, 19, 0, 4, 92, 20, 200, 3, File.open('db/fixtures/recipe19.jpg')],
	[20, 20, 0, 4, 93, 25, 220, 0, File.open('db/fixtures/recipe20.jpg')],
	[21, 21, 1, 4, 92, 30, 250, 1, File.open('db/fixtures/recipe21.jpg')],
	[22, 22, 0, 4, 90, 30, 300, 1, File.open('db/fixtures/recipe22.jpg')],
	[23, 23, 0, 3, 92, 30, 300, 0, File.open('db/fixtures/recipe23.jpg')]

].each do |user_id, bean_id, hot_ice, grind, temperature, amount, extracted_amount, extraction, recipe_image|
	I18n.locale = :en
  Recipe.create!(
    user_id: user_id, bean_id: bean_id, hot_ice: hot_ice, grind: grind, temperature: temperature,
    amount: amount, extracted_amount: extracted_amount, extraction: extraction, recipe_image: recipe_image
  )
end

[
  [13, 3, 3, 3, 4, 5, 'I wanna go Papua new guinia!!'],
  [14, 5, 3, 3, 4, 3, 'I recommend make coffee with high tempreture hot water'],
	[15, 3, 5, 3, 4, 5, 'GOOOD！'],
	[16, 3, 5, 5, 3, 4, 'Its good match with milk!'],
	[17, 4, 2, 1, 5, 4, 'Its falvor like a lime'],
	[18, 2, 3, 4, 4, 4, 'Its balanced'],
	[19, 5, 4, 2, 5, 5, 'NO NEED WORD!'],
	[20, 3, 3, 4, 3, 3, 'AWESOME with Bread'],
	[21, 2, 3, 4, 4, 2, 'Best summer iced coffee'],
	[22, 2, 4, 5, 4, 2, 'So Bitter'],
	[23, 3, 3, 3, 4, 2, 'BURUNJI!!']

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
	[3, 4],
	[4, 5],
	[5, 6],
	[6, 7],
	[7, 8],
	[8, 9],
	[9, 10],
	[10, 11],
	[11, 12],
	[12, 1]
].each do |user_id, bean_id|
	I18n.locale = :ja
  BeanLike.create!(
    user_id: user_id, bean_id: bean_id
  )
end

[
  [13, 14],
	[14, 15],
	[16, 17],
	[17, 18],
	[18, 19],
	[19, 20],
	[20, 21],
	[21, 22],
	[22, 23],
	[23, 1]
].each do |user_id, bean_id|
	I18n.locale = :en
  BeanLike.create!(
    user_id: user_id, bean_id: bean_id
  )
end

[
	[1, 2],
  [2, 3],
	[3, 4],
	[4, 5],
	[5, 6],
	[6, 7],
	[7, 8],
	[8, 9],
	[9, 10],
	[10, 11],
	[11, 12],
	[12, 1]
].each do |user_id, recipe_id|
	I18n.locale = :ja
  RecipeLike.create!(
    user_id: user_id, recipe_id: recipe_id
  )
end

[
  [13, 14],
	[14, 15],
	[16, 17],
	[17, 18],
	[18, 19],
	[19, 20],
	[20, 21],
	[21, 22],
	[22, 23],
	[23, 1]
].each do |user_id, recipe_id|
	I18n.locale = :en
  RecipeLike.create!(
    user_id: user_id, recipe_id: recipe_id
  )
end



[
	[1, 2],
  [2, 3],
	[3, 4],
	[4, 5],
	[5, 6],
	[6, 7],
	[7, 8],
	[8, 9],
	[9, 10],
	[10, 11],
	[11, 12],
	[12, 1]
].each do |user_id, shop_id|
	I18n.locale = :ja
  ShopLike.create!(
    user_id: user_id, shop_id: shop_id
  )
end

[
  [12, 13],
  [13, 14],
	[14, 15],
	[16, 17],
	[17, 18],
	[18, 19],
	[19, 20],
	[20, 21],
	[21, 22],
	[22, 23],
	[23, 1]
].each do |user_id, shop_id|
	I18n.locale = :en
  ShopLike.create!(
    user_id: user_id, shop_id: shop_id
  )
end
