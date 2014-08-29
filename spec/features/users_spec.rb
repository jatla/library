require 'spec_helper'
describe "Users", :type => :feature do
  include Warden::Test::Helpers
  before :each do
    Warden.test_mode!
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2]
    OmniAuth.config.add_mock(:google_oauth2, {:uid => '67890'})
    @user = create(:user)
    @user.save!
    @admin = create(:admin)
    @admin.save!
  end

  after do
    OmniAuth.config.test_mode = false
  end

  context "if user is not signed in" do
    it "should not have Admin link" do
      expect {
        find_link('Admin')
      }.to raise_error
    end
  end

  context "if user signed in" do
    before do
      login_as(@user)
    end
    after do
      logout(:user)
    end

    it "should not have Admin link" do
      expect {
        find_link('Admin')
      }.to raise_error
    end
  end

  context "if admin signed in" do
    before do
      login_as(@admin)
    end
    after do
      logout(:user)
    end
    it "should have Admin link" do
      vist users_path
      expect(page).to have_content 'Users'
    end
  end
end