require 'rails_helper'

RSpec.feature "Books", type: :feature, js: true do
  let!(:buyer) { create(:buyer) }
  let!(:seller) { create(:seller) }
  let!(:books) { create_list(:book, 10) }

  describe 'Unlogged' do
    it 'Should acces the root page' do
      visit(root_path)
      expect(page).to have_current_path(root_path)
    end

    it 'Should be redirected if try to acces books index' do
      visit(books_path)
      expect(page).to have_current_path(root_path)
    end
  end

  describe 'Logged as a buyer' do
    before do
      login_as(buyer, scope: :buyer)
    end

    it 'Should be able to add a book to his cart and buy it' do
      books
      book = books.first
      visit(books_path)
      click_on(id: "card-book-#{book.id}")
      click_on(id: "button-add-cart")
      expect(find('.notif-number')).to have_text('1')
      visit(cart_path(buyer.cart))
      click_on(id: "pay-button")
      notice = find('.alert.alert-info.alert-dismissible.fade.show.m-1')
      expect(notice).to have_text("You buy has been approved.")
    end

    it 'Should be able to search for a specific book' do
      books
      book = create(:book, title: "Searched Book")
      visit(books_path)
      expect(page).to have_css('.card-book', count: 11)
      fill_in "query", with: book.title
      click_on(id: "search-button")
      expect(page).to have_css('.card-book', count: 1)
    end
  end
end
