class AddFieldToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :start, :string
    add_column :ratings, :review, :string
    add_column :ratings, :article_id, :integer
  end
end
