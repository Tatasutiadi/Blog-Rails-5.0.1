class HomeController < ApplicationController

  def index
    @category = Categorie.all
    @categoryCount = Categorie.count
    # @article = Article.all.paginate(page: params[:page], per_page: 7)
    # @paginate = Article.order("id DESC").paginate(page: params[:page], per_page: 7)
    # SELECT * FROM `articles` order by view DESC LIMIT 7
    @article = Article.search(params[:search], params[:page])
    @topArticle = Article.order('view DESC').limit('7')

    # if params[:search]
    #   if(params[:search]=='')
    #     redirect_to root_path
    #   else
    #     @paged = params[:page]
    #     @arc = Article.search(params[:search]).paginate(page: params[:page], per_page: 20)
    #   end
    # else
    #   @paged = params[:page]
    #   @arc = Article.order("id DESC").paginate(page: params[:page], per_page: 20)
    # end

  end

end
