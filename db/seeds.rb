# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#[
#	['ゲストマン', 'guestja@guest.com', 'guestmanja', Time.now]
#].each do |name, mail, pass, confirmed_at|
#	I18n.locale = :ja
#  User.create!(
#    username: name, email: mail, password: pass, avatar: open("db/fixtures/avatar1.png"), confirmed_at: confirmed_at
#  )
#end
#
#2.upto(11) do |n|
#	I18n.locale = :ja
#	username = Faker::Internet.username
#	email = Faker::Internet.free_email
#	password = Faker::Internet.password
#	confirmed_at = Time.now
#	User.create!(
#		username: username, email: email, password: password, avatar: open("db/fixtures/avatar#{n}.png"), confirmed_at: confirmed_at
#	)
#end

#[
#	['スターバックスコーヒー 銀座松屋通り店', '東京都中央区銀座３丁目７−１４ ESKビル 1F', 'https://store.starbucks.co.jp/detail-1/',File.open('db/fixtures/shop1.png'),35.671700, 139.766601],
#	['カルディコーヒーファーム 下高井戸店', '東京都世田谷区松原3-29-20 稲川ビル1F', 'https://map.kaldi.co.jp/kaldi/detailMap?account=kaldi&accmd=0&adr=13&bpref=13112&bid=004&pgret=2',File.open('db/fixtures/shop2.png'),35.666357, 139.641513],
#	['やなか珈琲店 谷中店', '東京都台東区谷中3-8-6', 'https://www.yanaka-coffeeten.com/', File.open('db/fixtures/shop3.png'),35.726894, 139.764729],
#	['サザコーヒー本店', '茨城県ひたちなか市共栄町', 'https://www.saza.co.jp/', File.open('db/fixtures/shop4.png'),36.398315, 140.527000],
#	['雨の日の珈琲', '千葉県柏市あけぼの4-4-2 ライネスハイム柏107', 'https://www.amenohi-coffee.jp/', File.open('db/fixtures/shop5.png'),35.8663161,139.9699134],
#	['COFFEE VALLEY', '東京都豊島区南池袋２丁目２６−３', 'https://coffeevalley.jp/', File.open('db/fixtures/shop6.png'),35.7277996,139.7132372],
#	['LIGHT UP COFFEE', '東京都武蔵野市吉祥寺本町4-13-15', 'https://lightupcoffee.com/', File.open('db/fixtures/shop7.png'),35.705462, 139.572519],
#	['LiLo Coffee Roasters', '大阪府大阪市中央区西心斎橋１丁目１−10-28 心斎橋Mビル', 'https://coffee.liloinveve.com/',  File.open('db/fixtures/shop8.png'),34.674107, 135.498055],
#	['SWITCH COFFEE TOKYO', '東京都目黒区目黒１丁目１７−２３', 'http://www.switchcoffeetokyo.com/', File.open('db/fixtures/shop9.png'),35.636246, 139.709597],
#	['マメココロ', '東京都足立区千住1-27-1', 'https://ja-jp.facebook.com/mamecocoro/', File.open('db/fixtures/shop10.png'),35.747852, 139.801818],
#	['WEEKENDERS COFFEE 富小路', '京都市中京区富小路通六角下ル西側骨屋之町560離れ', 'https://weekenderscoffee.com/', File.open('db/fixtures/shop11.png'),35.006792, 135.764502]
#].each do |name, address, url, shop_image, latitude, longitude|
#	I18n.locale = :ja
#  Shop.create!(
#    name: name, address: address, url: url, shop_image: shop_image, latitude: latitude, longitude: longitude
#  )
#end
#
#[
#  [1, 1, 7, 'ニューオリエンテ', '', '', 0, 5, 1040, File.open('db/fixtures/bean1.png')],
#  [2, 2, 0, 'モカマタリ','', '','' , 5, 800, File.open('db/fixtures/bean2.png')],
#	[3, 3, 2, 'トラジャ', 0, 'スロトコ', 0, 5, 800,File.open('db/fixtures/bean3.png')],
#	[4, 4, 25, 'クスコ', 1, '', 1, 4, 600,File.open('db/fixtures/bean4.png')],
#	[5, 5, 27, 'ラ・フロリダ', 0, 'ラ　フロレンシア', 0, 4, 750,File.open('db/fixtures/bean5.png')],
#	[6, 6, 22, 'カルモデミナス', 1, 'モンテアレグレ', 1, 5, 600,File.open('db/fixtures/bean6.png')],
#	[7, 7, 4, 'グジ シャキソ', 10, 'シャキソ',0,2,870,File.open('db/fixtures/bean7.png')],
#	[8, 8, 29, 'ソコヌスコ', 14, 'Finca Guadelupe Zaju',0,4,950,File.open('db/fixtures/bean8.png')],
#	[9, 9, 5, 'アパネカ', 1, '',2,3,900,File.open('db/fixtures/bean9.png')],
#	[10, 10, 23, 'ムインガ', 1, '', 0,4,410 ,File.open('db/fixtures/bean10.png')],
#	[11, 11, 30, 'ドゥクンデカワ ミビリマ', 1, '', 0,2,750,'']
#].each do |user_id, shop_id, country, area, variety, farm, process, roast, price, bean_image|
#	I18n.locale = :ja
#  Bean.create!(
#    user_id: user_id, shop_id: shop_id, country: country, area: area,
#    variety: variety, farm: farm, process: process, roast: roast, price: price, bean_image: bean_image
#  )
#end
#
#[
#  [1, 3, 3, 5, '美味しい!でも高い！'],
#  [2, 2, 5, 4, 'ワインのような香り。やわらかい甘味とコクがある'],
#	[3, 3, 5, 3, '初めての農園だけど美味しい！'],
#	[4, 1, 4, 4, 'すっきりとしてる。後に甘さが残る'],
#	[5, 2, 5, 4, '完熟感があり、甘味もたっぷりあります'],
#	[6, 3, 3, 4, 'アーモンドやカカオニブを彷彿とさせるビター感'],
#	[7, 5, 2, 3, 'さくらんぼやセイロンティーを思わせるような風味'],
#	[8, 5, 3, 3, '独特の酸味！さっぱりとしたお菓子に合う！'],
#	[9, 5, 2, 2, '酸味が強くて美味しい。アイスにしてもうまい'],
#	[10, 2, 4, 4, 'バランスが良くてうまい。'],
#	[11, 2, 4, 4, 'すっきりした酸味。夏の定番になるかも']
#].each do |bean_id, i_sour, i_sweet, i_bitter, i_comment|
#	I18n.locale = :ja
#  Impression.create!(
#    bean_id: bean_id, i_sour: i_sour, i_sweet: i_sweet, i_bitter: i_bitter, i_comment: i_comment
#  )
#end

[
	['GuestMan', 'guesten@guest.com', 'guestmanen', Time.now]
].each do |name, mail, pass, confirmed_at|
	I18n.locale = :en
	User.create!(
	  username: name, email: mail, password: pass, avatar: open("db/fixtures/avatar1.png"), confirmed_at: confirmed_at
	)
end

2.upto(11) do |n|
	I18n.locale = :en
	username = Faker::Internet.username
	email = Faker::Internet.free_email
	password = Faker::Internet.password
	confirmed_at = Time.now
	User.create!(
		username: username, email: email, password: password, avatar: open("db/fixtures/avatar#{n}.png"), confirmed_at: confirmed_at
	)
end

[
	['Starbucks Coffee Pike Place', '1912 Pike Place Seattle, WA 98101', 'https://www.starbucks.com/store-locator/store/11676/pike-place-1912-pike-place-seattle-wa-981011013-us',File.open('db/fixtures/shop12.png'),47.609966,-122.342323],
 	['The Coffee Bean & Tea leaf Pico & Smithwood', '9541 W. Pico Blvd. Los Angeles CA 90035 USA', 'https://www.coffeebean.com/store/usa/los-angeles/pico-and-smithwood',File.open('db/fixtures/shop13.png'),34.055595, -118.396758],
	['Honolulu Coffee Experience Center', '1800 Kalakaua Ave Honolulu, HI 96815', 'https://www.honolulucoffee.com/pages/honolulu-coffee-experience-center',File.open('db/fixtures/shop14.png'),21.290679, -157.835092],
	['Stumptown Coffee Roasters Divisions', '4525 SE Division Street Portland, OR 97206', 'https://www.stumptowncoffee.com/locations/portland/division',File.open('db/fixtures/shop15.png'),45.505504, -122.615562],
	['Bird Rock La Jolla','5627 La Jolla Blvd, La Jolla, CA 92037','https://www.birdrockcoffee.com/',File.open('db/fixtures/shop16.png'),32.814479, -117.269759],
	['Devoción', '69 Grand St, Brooklyn, NY 11249','https://www.devocion.com/', File.open('db/fixtures/shop17.png'),40.716057, -73.964690],
	['George Howell Coffee', '505 Washington St, Boston, MA 02111','https://www.georgehowellcoffee.com/',File.open('db/fixtures/shop18.png'),42.362057, -71.057043],
	['Go Get Em Tiger', '230 N Larchmont Blvd, Los Angeles, CA 90004','https://gget.com/',File.open('db/fixtures/shop19.png'),34.075583, -118.323485],
	['JBC Coffee Roasters','5821 Femrite Dr # H, Madison, WI 53718','http://www.jbccoffeeroasters.com/',File.open('db/fixtures/shop20.png'),43.051040, -89.278895],
	['Mostra Coffee', '12045 Carmel Mountain Rd Ste 302, San Diego, CA 92128','http://www.mostracoffee.com/',File.open('db/fixtures/shop21.png'),32.983281, -117.075453],
	['Passenger Coffee & Tea Showroom','7 W King St, Lancaster, PA 17602','http://passengercoffee.com/',File.open('db/fixtures/shop22.png'),40.038126, -76.306330]
].each do |name, address, url, shop_image, latitude, longitude|
	I18n.locale = :en
  Shop.create!(
    name: name, address: address, url: url, shop_image: shop_image, latitude: latitude, longitude: longitude
  )
end

[
	[12, 12, 12, 'Kilimanjaro', 0, '', 6, 4, 340],
  [13, 13, 4, 'Yirgacheffe', 2, '', 1, 3, 850],
  [14, 14, 22, 'Minas Gerais', 4, 'TomioFukuda', 0, 5, 800]
].each do |user_id, shop_id, country, area, variety, farm, process, roast, price|
	I18n.locale = :en
  Bean.create!(
    user_id: user_id, shop_id: shop_id, country: country, area: area,
    variety: variety, farm: farm, process: process, roast: roast,
    price: price
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
#
#[
#  [1, 1, 0, 0, 90, 15, 3],
#  [2, 2, 0, 1, 95, 10, 0],
#  [3, 3, 1, 2, 85, 20, 10]
#].each do |user_id, bean_id, hot_ice, grind, temperature, amount, extraction|
#	I18n.locale = :ja
#  Recipe.create!(
#    user_id: user_id, bean_id: bean_id, hot_ice: hot_ice, grind: grind, temperature: temperature,
#    amount: amount, extraction: extraction
#  )
#end
#
#[
#  [1, 2, 3, 5, 4, 5, 'ブラジルのコーヒーは間違いない'],
#  [2, 5, 2, 5, 4, 3, '高い温度で入れたほうがおいしいかも'],
#  [3, 3, 5, 3, 4, 4, '最高！']
#].each do |recipe_id, t_sour, t_sweet, t_bitter, t_aroma, t_fullbody, t_comment|
#	I18n.locale = :ja
#  Taste.create!(
#    recipe_id: recipe_id, t_sour: t_sour, t_sweet: t_sweet, t_bitter: t_bitter,
#    t_aroma: t_aroma, t_fullbody: t_fullbody, t_comment: t_comment
#  )
#end


#[
#  [4, 4, 0, 0, 90, 15, 3],
#  [5, 5, 0, 1, 95, 10, 0],
#  [6, 6, 1, 2, 85, 20, 10]
#].each do |user_id, bean_id, hot_ice, grind, temperature, amount, extraction|
#	I18n.locale = :en
#  Recipe.create!(
#    user_id: user_id, bean_id: bean_id, hot_ice: hot_ice, grind: grind, temperature: temperature,
#    amount: amount, extraction: extraction
#  )
#end
#
#[
#  [4, 2, 3, 5, 4, 5, 'Brazil beans are truelly awesome!'],
#  [5, 5, 2, 5, 4, 3, 'I recommend make coffee with high tempreture hot water'],
#  [6, 3, 5, 3, 4, 4, 'GOOOD！']
#].each do |recipe_id, t_sour, t_sweet, t_bitter, t_aroma, t_fullbody, t_comment|
#	I18n.locale = :en
#  Taste.create!(
#    recipe_id: recipe_id, t_sour: t_sour, t_sweet: t_sweet, t_bitter: t_bitter,
#    t_aroma: t_aroma, t_fullbody: t_fullbody, t_comment: t_comment
#  )
#end
#
#
#[
#  [1, 2],
#  [2, 3],
#  [3, 1]
#].each do |user_id, bean_id|
#	I18n.locale = :ja
#  BeanLike.create!(
#    user_id: user_id, bean_id: bean_id
#  )
#end
#
#[
#  [4, 5],
#  [5, 6],
#  [6, 4]
#].each do |user_id, bean_id|
#	I18n.locale = :en
#  BeanLike.create!(
#    user_id: user_id, bean_id: bean_id
#  )
#end
#
#[
#  [1, 2],
#  [2, 3],
#  [3, 1]
#].each do |user_id, recipe_id|
#	I18n.locale = :ja
#  RecipeLike.create!(
#    user_id: user_id, recipe_id: recipe_id
#  )
#end
#
#[
#  [4, 5],
#  [5, 6],
#  [6, 4]
#].each do |user_id, recipe_id|
#	I18n.locale = :en
#  RecipeLike.create!(
#    user_id: user_id, recipe_id: recipe_id
#  )
#end
#
#
#
#[
#  [1, 2],
#  [2, 3],
#  [3, 1]
#].each do |user_id, shop_id|
#	I18n.locale = :ja
#  ShopLike.create!(
#    user_id: user_id, shop_id: shop_id
#  )
#end
#
#[
#  [4, 5],
#  [5, 6],
#  [6, 4]
#].each do |user_id, shop_id|
#	I18n.locale = :en
#  ShopLike.create!(
#    user_id: user_id, shop_id: shop_id
#  )
#end
