module RegisterShop
  def register_shop(shop)
    visit new_shop_path
    fill_in 'shop_name', with: shop.name
    fill_in 'shop_address', with: shop.address
    fill_in 'shop_url', with: shop.url
    click_button I18n.t('shops.form.register')
  end
end

RSpec.configure do |config|
  config.include RegisterShop
end
