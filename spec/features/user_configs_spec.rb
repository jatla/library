require 'spec_helper'
describe "UserConfig", :type => :feature do
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

  it "displays configs for user" do
    login_as(@user)
    visit user_config_path
    expect(page).to have_content 'Preferences'
  end
end