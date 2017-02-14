class CategoryArticle < ApplicationRecord
  self.primary_key = "id"

  belongs_to :categorie ,:class_name =>Categorie, :foreign_key=>'category_id'
  has_many :articles

  def slug
    categorie.name.downcase.gsub(/[^0-9A-Za-z]/, '')
  end

  def to_param
    "#{slug}"
  end

  # def self.find_by_param(input)
  #   find_by_name(input)
  # end

end
