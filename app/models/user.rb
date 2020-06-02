class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]
  validates :email, presence: true
  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  def self.guest
    if I18n.locale == :ja
      find_or_create_by!(email: 'sato@sato.com') do |user|
        user.password = 'satosatosato'
        user.confirmed_at = Time.now
      end
    else
      find_or_create_by!(email: 'smith@smith.com') do |user|
        user.password = 'smithsmith'
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
