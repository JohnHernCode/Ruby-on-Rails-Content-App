# frozen_string_literal: true

class ArticleCategory < ApplicationRecord
  belongs_to :category, foreign_key: 'category_id', class_name: 'Category'
  belongs_to :article, foreign_key: 'article_id', class_name: 'Article'
end
