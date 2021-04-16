require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it 'should has many article categories' do
      a = Category.reflect_on_association(:article_categories)
      expect(a.macro).to eq(:has_many)
    end
    it 'should has many articles' do
      e = Category.reflect_on_association(:articles)
      expect(e.macro).to eq(:has_many)
    end
  end
end
