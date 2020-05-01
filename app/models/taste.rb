class Taste < ApplicationRecord
  validates :t_sour, :t_sweet, :t_bitter, :t_aroma, :t_fullbody, presence: true
  validates :t_comment, length: { maximum: 100 }

  belongs_to :recipe

  scope :search_taste, ->(recipe_search_params) do
    sour_search(recipe_search_params[:t_sour])
      .sweet_search(recipe_search_params[:t_sweet])
      .bitter_search(recipe_search_params[:t_bitter])
      .aroma_search(recipe_search_params[:t_aroma])
      .fullbody_search(recipe_search_params[:t_fullbody])
  end

  scope :sour_search, ->(t_sour) { where(t_sour: t_sour) if t_sour.present? }
  scope :sweet_search, ->(t_sweet) { where(t_sweet: t_sweet) if t_sweet.present? }
  scope :bitter_search, ->(t_bitter) { where(t_bitter: t_bitter) if t_bitter.present? }
  scope :aroma_search, ->(t_aroma) { where(t_aroma: t_aroma) if t_aroma.present? }
  scope :fullbody_search, ->(t_fullbody) { where(t_fullbody: t_fullbody) if t_fullbody.present? }
end
