require 'rails_helper'

RSpec.describe "Pages", type: :request do
  let!(:buyer) { create(:buyer) }
  let!(:seller) { create(:seller) }

  describe 'Unlogged' do
    it 'should not access the books index page' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'Logged as a buyer' do
    before do
      sign_in buyer
    end

    it 'should not access the books index page' do
      get root_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'Logged as a seller' do
    before do
      sign_in seller
    end

    it 'should not access the books index page' do
      get root_path
      expect(response).to have_http_status(302)
    end
  end
end
