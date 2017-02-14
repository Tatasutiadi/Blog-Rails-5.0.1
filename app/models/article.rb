class Article < ApplicationRecord
  belongs_to :category_article,:class_name =>CategoryArticle, :foreign_key=>'id'
  belongs_to :account,:class_name =>Account, :foreign_key=>'user_id'

  # def slug
  #   title.downcase.gsub(" ", "-")
  # end

  def to_param
    [id, title.parameterize].join("-")
  end
  # def self.search(query)
  #   search = "%#{query}%"
  #   select('*')
  #   where('title like ? ',search)
  # end

  def self.search(search, page)
    if search
      where('title LIKE ? OR body LIKE ? ', "%#{search}%", "%#{search}%").paginate(page: page, per_page: 7).order('id DESC')
    else
      paginate(page: page, per_page: 7).order('id DESC')
    end
  end

end
