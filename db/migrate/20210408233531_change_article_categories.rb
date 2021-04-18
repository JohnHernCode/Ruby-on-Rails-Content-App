class ChangeArticleCategories < ActiveRecord::Migration[6.1]
  def change
    rename_column :article_categories, :CategoryId, :category_id
    rename_column :article_categories, :ArticleId, :article_id
  end
end
