class Categorie < ApplicationRecord
  self.primary_key = "id"
  has_many :CategoryArticle, :class_name =>CategoryArticle

  def slug
    name.downcase.gsub(/[^0-9A-Za-z]/, '')
  end

  def to_param
    # "#{slug}"
    name.downcase.gsub(/[^0-9A-Za-z]/, '')
  end

  protected

end
