class AddFieldToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :name, :string
    add_column :tags, :article_id, :integer
  end
end
