require 'rails_helper'

RSpec.describe Status, type: :model do
  before :each do
    @status = create(:status)
  end

  it 'should have a valid factory' do
    expect(@status).to be_valid
  end

  it 'should have a title' do
    expect(@status.title).to match(/Not Started\d+/)
  end
  
  describe '#receipts' do
    it 'should be used on 3 receipts' do
      expect(@status.receipts.count).to eq(3)
    end
  end
end
