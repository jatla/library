require 'spec_helper'

describe "user_configs/show" do
  before(:each) do
    @user_config = assign(:user_config, stub_model(UserConfig,
      :update => "Update"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Update/)
  end
end
