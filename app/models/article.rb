class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save :capitalize_title

  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes, foreign_key: 'article_id', dependent: :destroy
  has_many :voters, through: :votes, source: :user

  validates :title, presence: true, length: { in: 3..50 }
  validates :text, presence: true, length: { minimum: 20 }
  validates :image, :author_id, :category_id, presence: true

  def capitalize_title
    self.title = title.capitalize
  end
end
