class User < ApplicationRecord
  has_secure_password

  has_many :articles, foreign_key: 'author_id', class_name: 'Article'
  has_many :votes, foreign_key: 'user_id', class_name: 'Vote', dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
