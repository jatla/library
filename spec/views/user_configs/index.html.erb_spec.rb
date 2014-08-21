require 'spec_helper'

describe "user_configs/index" do
  before(:each) do
    assign(:user_configs, [
      stub_model(UserConfig,
        :update => "Update"
      ),
      stub_model(UserConfig,
        :update => "Update"
      )
    ])
  end

  it "renders a list of user_configs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Update".to_s, :count => 2
  end
end
