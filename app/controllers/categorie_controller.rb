class CategorieController < ApplicationController
  def index

  end
  def show
    @category = Categorie.select('*,(select count(*) from category_articles where category_articles.category_id = categories.id) as count_data')
    conver_url = ''
    Categorie.all.each do |data|
      if data.name.downcase.gsub(/[^0-9A-Za-z]/, '') == params[:id]
        conver_url = data.name
      end
    end

    @categoryName = Categorie.find_by_name(conver_url)
    @category_ = CategoryArticle.where(:category_id =>@categoryName).paginate(page: params[:page], per_page: 10)
    render 'article/category'
  end

  def articleShow
    @articleshow = CategoryArticle.where(:category_id => params[:id])
  end

end
