require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it 'should belong to user' do
      t = Article.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should has many article categories' do
      a = Article.reflect_on_association(:article_categories)
      expect(a.macro).to eq(:has_many)
    end
    it 'should has many categories' do
      e = Article.reflect_on_association(:categories)
      expect(e.macro).to eq(:has_many)
    end
    it 'should has many votes' do
      e = Article.reflect_on_association(:votes)
      expect(e.macro).to eq(:has_many)
    end
  end
end
