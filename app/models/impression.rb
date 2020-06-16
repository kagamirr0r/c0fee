class Impression < ApplicationRecord
  validates :i_comment, length: { maximum: 100 }

  belongs_to :bean

  scope :search_impression, ->(bean_search_params) do
    return if bean_search_params.blank?

    sour_search(bean_search_params[:i_sour])
      .sweet_search(bean_search_params[:i_sweet])
      .bitter_search(bean_search_params[:i_bitter])
  end

  scope :sour_search, ->(i_sour) { where(i_sour: i_sour) if i_sour.present? }
  scope :sweet_search, ->(i_sweet) { where(i_sweet: i_sweet) if i_sweet.present? }
  scope :bitter_search, ->(i_bitter) { where(i_bitter: i_bitter) if i_bitter.present? }
end
