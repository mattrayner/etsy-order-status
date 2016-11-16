require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe '#index' do
    before :each do
      get :index
    end

    it 'returns a 200 status code' do
      expect(response.code).to eq('200')
    end

    it 'Defines ETSY verification URL' do
      expect(controller.instance_variable_get(:@etsy_verification_url)).not_to be_nil
    end
  end
end
