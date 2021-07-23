require 'rails_helper'

RSpec.describe "BooksRequest", type: :request do
  let!(:buyer) { create(:buyer) }
  let!(:seller) { create(:seller) }
  let(:book) { create(:book) }
  let(:seller_book) { create(:book, seller: seller) }
  let(:cart_element_seller_book) { create(:cart_element, book: seller_book) }

  describe 'Unlogged' do
    it 'should not access the books index page' do
      get books_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'Logged as an buyer' do
    before do
      sign_in(buyer)
    end

    it 'should access the books index page' do
      get books_path
      expect(response).to have_http_status(200)
    end

    it 'should access a book show page' do
      get book_path(book)
      expect(response).to have_http_status(200)
    end

    it 'should not be able to create a book' do
      books_params = attributes_for(:book)
      expect { post books_path, params: { book: books_params } }.to raise_error(Pundit::NotAuthorizedError)
    end
  end

  describe 'Logged as an seller' do
    before do
      sign_in(seller)
    end

    it 'should access the books index page' do
      get books_path
      expect(response).to have_http_status(200)
    end

    it 'should access a book show page' do
      get book_path(book)
      expect(response).to have_http_status(200)
    end

    it 'should be able to create a book' do
      books_params = attributes_for(:book)
      expect { post books_path, params: { book: books_params } }.to change(Book, :count).by(1)
    end

    it "should not be able to update a book which isn't mine" do
      books_params = attributes_for(:book, description: "New description")
      expect { patch book_path(book), params: { book: books_params } }.to raise_error(Pundit::NotAuthorizedError)
    end

    it "should be able to update a book which is mine" do
      books_params = attributes_for(:book, description: "New description")
      patch book_path(seller_book), params: { book: books_params }
      expect(seller_book.reload.description).to eq("New description")
    end

    it "should not be able to destroy a book which isn't mine" do
      expect { delete book_path(book) }.to raise_error(Pundit::NotAuthorizedError)
    end

    it "should be able to destroy a book which is mine" do
      seller_book
      expect { delete book_path(seller_book) }.to change(Book, :count).by(-1)
    end

    it "should not be able to destroy a book which is in a customer's cart" do
      seller_book
      cart_element_seller_book
      expect { delete book_path(seller_book) }.to raise_error(Pundit::NotAuthorizedError)
    end
  end
end
