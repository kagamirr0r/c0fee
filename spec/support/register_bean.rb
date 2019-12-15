module RegisterBean
  def register_bean
    visit shops_path
    find('.register_bean').click
    fill_in 'bean_country', with: 'ブラジル'
    fill_in 'bean_area', with: 'ミナスジェライス'
    fill_in 'bean_farm', with: 'サンタカタリーナ'
    fill_in 'bean_variety', with: 'カツアイ'
    select 'ナチュラル', from: 'bean_process'
    select 'シティ', from: 'bean_roast'
    fill_in 'bean_price', with: 800
    fill_in 'bean_bean_url', with: 'http://greenbeans.jp/?pid=56382011'
    fill_in 'bean_impression_attributes_i_sour', with: 3
    fill_in 'bean_impression_attributes_i_sweet', with: 3
    fill_in 'bean_impression_attributes_i_bitter', with: 3
    fill_in 'bean_impression_attributes_i_comment', with: '美味しい！'
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.registered_bean')
  end
end

RSpec.configure do |config|
  config.include RegisterBean
end
