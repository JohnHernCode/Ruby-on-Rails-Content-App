# frozen_string_literal: true

class ArticleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :article_categories do |t|
      t.integer :CategoryId
      t.integer :ArticleId

      t.timestamps
    end
  end
end
