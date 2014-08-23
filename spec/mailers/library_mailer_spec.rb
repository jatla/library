require "spec_helper"

describe LibraryMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = create(:user)
    @user.save!
    @book = create(:approved_active_book)
    @book.user_id = @user.id
    @book.save!
    @follow = Follow.new
    @follow.user_id = @user.id
    @follow.book_id = @book.id
    @follow.save!
    @review = create(:review)
    @review.user_id = @user.id
    @review.book_id = @book.id
    @review.save
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it "Sends email on review" do
    LibraryMailer.on_new_review(@review).deliver
    ActionMailer::Base.deliveries.count.should == 1
  end
  it "Sends email to users following a book" do

    LibraryMailer.on_follow(@follow).deliver
    ActionMailer::Base.deliveries.count.should == 1
  end
  it "Sends email to invited users" do
    LibraryMailer.invite_user("mailertest@rspec.com", @user).deliver
    ActionMailer::Base.deliveries.count.should == 1
  end
  it "Sends email to user on becoming admin" do
    LibraryMailer.on_admin(@user).deliver
    ActionMailer::Base.deliveries.count.should == 1
  end
end
