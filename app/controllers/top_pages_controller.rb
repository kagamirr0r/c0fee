class TopPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @beans = Bean.joins(shop: :translations).where(shop_translations: { locale: I18n.locale }).first(12)
    @recipes = Recipe.joins(bean: { shop: :translations }).where(shop_translations: { locale: I18n.locale }).first(12)
    @shops = Shop.with_translations.where(shop_translations: { locale: I18n.locale }).first(12)
  end
end
