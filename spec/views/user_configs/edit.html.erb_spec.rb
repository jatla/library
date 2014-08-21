require 'spec_helper'

describe "user_configs/edit" do
  before(:each) do
    @user_config = assign(:user_config, stub_model(UserConfig,
      :update => "MyString"
    ))
  end

  it "renders the edit user_config form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_config_path(@user_config), "post" do
      assert_select "input#user_config_update[name=?]", "user_config[update]"
    end
  end
end
