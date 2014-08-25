require 'spec_helper'

describe User do
  before :each do
    @user = build(:admin)
  end

  it "should not be valid without a name" do
    expect { @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
