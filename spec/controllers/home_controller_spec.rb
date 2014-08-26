require 'spec_helper'

describe HomeController do
  let(:valid_session) { {} }
  describe "GET 'home'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'invite_user'" do
    context "no user signed in" do
      it "should redirect to home page with sign in message" do
        get :invite_user, {:email => Faker::Internet.free_email}, valid_session
        response.should redirect_to(new_user_session_url)
      end
    end
    context "with user signed in" do
      before do
        ActionMailer::Base.delivery_method = :test
        ActionMailer::Base.perform_deliveries = true
        ActionMailer::Base.deliveries = []
        OmniAuth.config.test_mode = true
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
        request.env["devise.mapping"] = Devise.mappings[:admin]
        OmniAuth.config.add_mock(:google_oauth2, {:uid => '67890'})
        @admin = create(:admin)
        @admin.save!
        sign_in @admin
      end

      after do
        OmniAuth.config.test_mode = false
        ActionMailer::Base.deliveries.clear
      end

      it "should invite the user, if user is already signed in and with valid params" do
        get :invite_user, {:email => Faker::Internet.free_email}, valid_session
        response.should be_success
        ActionMailer::Base.deliveries.count.should == 1
      end
      it "should raise exception, if user is already signed in and with in-valid params" do
        get :invite_user, {:emai => Faker::Internet.free_email}, valid_session
        ActionMailer::Base.deliveries.count.should == 1
      end
    end
  end
end
