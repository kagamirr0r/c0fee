require 'rails_helper'

RSpec.feature 'BeanLikes', type: :feature do
  let(:impression) { create :impression }
  before do
    log_in(impression.bean.user)
  end

  scenario 'bean_like_button' do
    visit beans_path
    click_on 'favorite_border'
    expect(page).to have_content 'favorite'

    visit beans_path
    click_on 'favorite'
    expect(page).to have_content 'favorite_border'
  end
end
