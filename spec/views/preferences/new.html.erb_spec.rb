require 'spec_helper'

describe "book_preferences/new" do
  before(:each) do
    assign(:book_preference, stub_model(OptedOut).as_new_record)
  end

  it "renders new book_preference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", book_preferences_path, "post" do
    end
  end
end
