require 'spec_helper'

describe "user_configs/new" do
  before(:each) do
    assign(:user_config, stub_model(UserConfig,
      :update => "MyString"
    ).as_new_record)
  end

  it "renders new user_config form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_configs_path, "post" do
      assert_select "input#user_config_update[name=?]", "user_config[update]"
    end
  end
end
