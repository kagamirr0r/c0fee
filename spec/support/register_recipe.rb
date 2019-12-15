module RegisterRecipe
  def register_recipe
    visit beans_path
    find('.create_recipe').click
    select 'ホット', from: 'recipe_hot_ice'
    select '中細挽き', from: 'recipe_grind'
    fill_in 'recipe_amount', with: 15
    select 'ペーパーフィルター', from: 'recipe_extraction'
    fill_in 'recipe_temperature', with: 95
    fill_in 'recipe_taste_attributes_t_sour', with: 3
    fill_in 'recipe_taste_attributes_t_sweet', with: 3
    fill_in 'recipe_taste_attributes_t_bitter', with: 3
    fill_in 'recipe_taste_attributes_t_aroma', with: 3
    fill_in 'recipe_taste_attributes_t_fullbody', with: 3
    fill_in 'recipe_taste_attributes_t_comment', with: '美味しい！'
    click_button I18n.t('recipes.form.register')
    expect(page).to have_content I18n.t('recipes.flash.created_recipe')
  end
end

RSpec.configure do |config|
  config.include RegisterRecipe
end
