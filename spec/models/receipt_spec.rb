require 'rails_helper'

RSpec.describe Receipt, type: :model do
  before :each do
    @receipt = create(:receipt)
  end

  it 'has a valid factory' do
    expect(@receipt).to be_valid
  end

  it { expect(@receipt.etsy_id).not_to be_nil }
  it { expect(@receipt.active?).to eq(true) }
  it { expect(@receipt.user).not_to be_nil }
  it { expect(@receipt.status).not_to be_nil }
end
