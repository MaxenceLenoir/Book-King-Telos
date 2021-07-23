require 'rails_helper'

RSpec.describe "CartsRequest", type: :request do
  let!(:buyer) { create(:buyer) }
  let!(:seller) { create(:seller) }

  describe 'Unlogged' do
    it 'should not be able to access a show cart page' do
      get cart_path(buyer.cart)
      expect(response).to have_http_status(302)
    end

    it 'should not be able to paid' do
      patch cart_payment_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'Logged as an seller' do
    before do
      sign_in(seller)
    end

    it 'should not be able to access a show cart page' do
      get cart_path(buyer.cart)
      expect(response).to have_http_status(302)
    end

    it 'should not be able to paid' do
      patch cart_payment_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'Logged as an buyer' do
    before do
      sign_in(buyer)
    end

    it 'should be able to access a show cart page' do
      get cart_path(buyer.cart)
      expect(response).to have_http_status(200)
    end

    it 'should be able to paid' do
      buyer.cart.increment(:amount_cents, 3_200).save
      patch cart_payment_path
      expect(buyer.reload.account_money_cents).to eq(1_800)
    end
  end
end
