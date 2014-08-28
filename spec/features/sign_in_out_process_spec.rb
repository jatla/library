require 'spec_helper'
describe "the signin/out process", :type => :feature do
  include Warden::Test::Helpers
  before :each do
    Warden.test_mode!
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2]
    OmniAuth.config.add_mock(:google_oauth2, {:uid => '67890'})
    @user = create(:user)
    @user.save!
  end

  after do
    OmniAuth.config.test_mode = false
  end

  it "signs me in" do
    visit new_user_session_path
    click_link 'Sign in with Google'
    expect(page).to have_content 'Successfully authenticated from Google account.'
  end
  it "signs me out" do
    login_as(@user)
    visit new_user_session_path
    click_on @user.email
    click_link 'Sign out'
    expect(page).to have_content 'Please sign in with your Google account to access all features of this website!'
  end
end