module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
      OmniAuth.config.add_mock(:google_oauth2, {:uid => '12345'})
      sign_in create(:admin)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      OmniAuth.config.add_mock(:google_oauth2, {:uid => '67890'})
      sign_in create(:user)
    end
  end
end