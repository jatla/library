require 'spec_helper'
describe "Book", :type => :feature do
  include Warden::Test::Helpers
  before :each do
    Warden.test_mode!
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2]
    OmniAuth.config.add_mock(:google_oauth2, {:uid => '67890'})
    @user = create(:user)
    @user.save!
    @approved_book = create(:approved_active_book)
    @approved_book.save!
    @inactive_book = create(:approved_in_active_book)
    @inactive_book.save!
    @un_approved_book1 = create(:un_approved_book, :id => 98)
    @un_approved_book1.save!
    @un_approved_book2 = create(:un_approved_book, :id => 99)
    @un_approved_book2.save!
  end

  after do
    OmniAuth.config.test_mode = false
  end

  context "if user is not signed in" do
    it "clicking on books displays all books" do
      visit books_path
      expect(page).to have_content 'Books'
    end
    it "clicking on book displays the book" do
      visit book_path(@approved_book)
      expect(page).to have_content @approved_book.isbn
    end
  end

  context "if user signed in" do
    before do
      login_as(@user)
    end
    it "clicking on books displays all books" do
      visit books_path
      expect(page).to have_content 'Books'
    end
    it "clicking on book displays the book" do
      visit book_path(@approved_book)
      expect(page).to have_content @approved_book.isbn
    end
    it "clicking new book link displays new book " do
      visit new_book_path
      expect(page).to have_content ":image is required for the book to be approved!"
    end
  end
end