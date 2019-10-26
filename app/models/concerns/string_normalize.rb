module StringNormalize
  extend ActiveSupport::Concern

  included do
    before_validation :normalize_string_attributes
  end

  private

  def normalize_string_attributes
    changed_attributes.each do |key, _|
      self[key] = normalize(self[key]) if self[key].is_a?(String) && self[key].present?
    end
  end

  def normalize(str)
    str.strip
       .gsub("\t", ' ').gsub(/ +/, ' ')
       .gsub("\r\n", "\n").gsub("\r", "\n")
  end
end
