class ArticleController < ApplicationController

  def index
    @category = Categorie.select('*,(select count(*) from category_articles where category_articles.category_id = categories.id) as count_data')
    @article = Article.order("id DESC").paginate(page: params[:page], per_page: 10)
  end

  def show
    @article = Article.find(params[:id])
    Article.update(params[:id],:view =>@article.view + 1)
    @tag = Tag.where(:article_id => params[:id]).pluck(:name)
    @articleRand = Article.all.limit('10').shuffle
  end

  def edit

  end

  def mostPopular
    @category = Categorie.select('*,(select count(*) from category_articles where category_articles.category_id = categories.id) as count_data')
    @mostPopular = Article.order('view DESC').paginate(page: params[:page], per_page: 10)
    render 'popularArticle'
  end

end
