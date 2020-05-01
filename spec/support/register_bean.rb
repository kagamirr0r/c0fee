# module RegisterBean
#   def register_bean(bean,impression)
#     visit shops_path
#     find('.register_bean').click
#     fill_in 'bean_country', with: bean.country
#     fill_in 'bean_area', with: bean.area
#     fill_in 'bean_farm', with: bean.farm
#     fill_in 'bean_variety', with: bean.variety
#     select bean.process, from: 'bean_process'
#     select bean.roast, from: 'bean_roast'
#     fill_in 'bean_price', with: bean.price
#     fill_in 'bean_bean_url', with: bean.bean_url
#     fill_in 'bean_impression_attributes_i_sour', with: impression.i_sour
#     fill_in 'bean_impression_attributes_i_sweet', with: impression.i_sweet
#     fill_in 'bean_impression_attributes_i_bitter', with: impression.i_bitter
#     fill_in 'bean_impression_attributes_i_comment', with: impression.i_comment
#     click_button I18n.t('beans.form.register')
#     expect(page).to have_content I18n.t('beans.flash.registered_bean')
#   end
# end

# RSpec.configure do |config|
#   config.include RegisterBean
# end
