require "spec_helper"

describe LibraryMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = create(:user, :id => 21)
    @user.save!
    @user1 = create(:user, :id => 22)
    @user1.save!
    @user2 = create(:user, :id => 23)
    @user2.save!
    @owner = create(:user, :id => 24)
    @owner.save!
    @book = create(:approved_active_book)
    @book.user_id = @owner.id
    @book.save!
    @follow = Follow.new
    @follow.user_id = @user.id
    @follow.book_id = @book.id
    @follow.save!
    @follow1 = Follow.new
    @follow1.user_id = @user1.id
    @follow1.book_id = @book.id
    @follow1.save!
    @follow2 = Follow.new
    @follow2.user_id = @user2.id
    @follow2.book_id = @book.id
    @follow2.save!
    @review = create(:review)
    @review.user_id = @owner.id
    @review.book_id = @book.id
    @review.rating = 2;
    @review.description = "sdfghjertyui"
    @review.save
    @user_preferences = UserConfig.new
    @user_preferences.user_id = @user1.id
    @user_preferences.opt_out_by_rating = false
    @user_preferences.opt_out_by_review = true
    @user_preferences.rating_threshold = 1
    @user_preferences.save!
    @book_preferences = OptedOut.new
    @book_preferences.book_id = @book.id
    @book_preferences.user_id = @user2.id
    @book_preferences.by_review = false
    @book_preferences.by_rating = true
    @book_preferences.rating_threshold = 4
    @book_preferences.save!

  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it "Sends email on review" do
    LibraryMailer.on_new_review(@review).deliver
    ActionMailer::Base.deliveries.count.should == 1
  end
  it "Sends daily digest if configured" do
    @user_preferences.daily_digest_enabled = true
    @user_preferences.save!
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
end
