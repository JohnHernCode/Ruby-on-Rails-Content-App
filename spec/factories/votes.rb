# frozen_string_literal: true

FactoryBot.define do
  factory :vote do
    user_id { 1 }
    article_id { 1 }
  end
end
