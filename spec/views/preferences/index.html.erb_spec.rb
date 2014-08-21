require 'spec_helper'

describe "book_preferences/index" do
  before(:each) do
    assign(:book_preferences, [
      stub_model(OptedOut),
      stub_model(OptedOut)
    ])
  end

  it "renders a list of book_preferences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
