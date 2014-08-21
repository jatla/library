require 'spec_helper'

describe "book_preferences/show" do
  before(:each) do
    @book_preference = assign(:book_preference, stub_model(OptedOut))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
