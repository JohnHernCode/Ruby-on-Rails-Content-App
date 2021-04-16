require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should has many articles' do
      a = User.reflect_on_association(:articles)
      expect(a.macro).to eq(:has_many)
    end
    it 'should has many votes' do
      e = User.reflect_on_association(:votes)
      expect(e.macro).to eq(:has_many)
    end
  end
end
