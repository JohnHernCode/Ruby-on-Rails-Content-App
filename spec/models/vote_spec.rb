require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'associations' do
    it 'should belong to user' do
      a = Vote.reflect_on_association(:user)
      expect(a.macro).to eq(:belongs_to)
    end
    it 'should belong to article' do
      e = Vote.reflect_on_association(:article)
      expect(e.macro).to eq(:belongs_to)
    end
  end
end
