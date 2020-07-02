class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable, :timeoutable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.guest
    if I18n.locale == :ja
      find_or_create_by!(email: 'guestja@guest.com') do |user|
        user.password = 'guestmanja'
        user.confirmed_at = Time.now
      end
    else
      find_or_create_by!(email: 'guesten@guest.com') do |user|
        user.password = 'guestmanen'
        user.confirmed_at = Time.now
      end
    end
  end

  has_many :beans, dependent: :destroy
  has_many :bean_likes, dependent: :destroy
  has_many :like_beans, through: :bean_likes, source: :bean

  def like_bean(bean)
    bean_likes.find_or_create_by(bean_id: bean.id)
  end

  def cancel_like_bean(bean)
    bean_like = bean_likes.find_by(bean_id: bean.id)
    bean_like&.destroy
  end

  def liked_bean?(bean)
    like_beans.include?(bean)
  end

  has_many :recipes, dependent: :destroy
  has_many :recipe_likes, dependent: :destroy
  has_many :like_recipes, through: :recipe_likes, source: :recipe

  def like_recipe(recipe)
    recipe_likes.find_or_create_by(recipe_id: recipe.id)
  end

  def cancel_like_recipe(recipe)
    recipe_like = recipe_likes.find_by(recipe_id: recipe.id)
    recipe_like&.destroy
  end

  def like_recipe?(recipe)
    like_recipes.include?(recipe)
  end

  has_many :shop_likes, dependent: :destroy
  has_many :like_shops, through: :shop_likes, source: :shop

  def like_shop(shop)
    shop_likes.find_or_create_by(shop_id: shop.id)
  end

  def cancel_like_shop(shop)
    shop_like = shop_likes.find_by(shop_id: shop.id)
    shop_like&.destroy
  end

  def liked_shop?(shop)
    like_shops.include?(shop)
  end

  mount_uploader :avatar, AvatarUploader
end
