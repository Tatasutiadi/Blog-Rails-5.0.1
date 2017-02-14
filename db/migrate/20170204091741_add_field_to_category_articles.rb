class AddFieldToCategoryArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :category_articles, :article_id, :integer
    add_column :category_articles, :category_id, :integer
  end
end
