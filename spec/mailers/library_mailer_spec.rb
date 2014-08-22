require "spec_helper"

let(:valid_attributes) { { "title" => "LibraryMailerTest", "user_id" => 2 } }
let(:valid_session) { {} }

describe LibraryMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    #@story = Factory.create(:story)
    LibraryMailer.confirmation_email(@story).deliver
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  context "Send mail to user on creating new book" do
    it "assigns all books as @books" do
      book = Book.create! valid_attributes
      get :index, {}, valid_session
      assigns(:books).should eq([book])
    end
  end
end
