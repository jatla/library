require 'spec_helper'

describe "UserConfigs" do
  describe "GET /user_configs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_configs_path
      response.status.should be(200)
    end
  end
end
