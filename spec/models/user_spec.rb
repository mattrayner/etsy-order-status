require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = create(:user_with_receipts)
  end

  it 'should have a valid factory' do
    expect(@user).to be_valid
  end

  it 'should have an etsy_id' do
    expect(@user.etsy_id).not_to be_nil
  end

  describe '#receipts' do
    it 'should have 3 receipts' do
      expect(@user.receipts.count).to eq(3)
    end
  end
end
