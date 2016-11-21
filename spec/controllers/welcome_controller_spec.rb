require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe '#index' do
    before :each do
      get :index
    end

    it 'returns a 302 status code' do
      expect(response.code).to eq('302')
    end
  end
end
