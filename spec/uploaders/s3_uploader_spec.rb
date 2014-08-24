require 'spec_helper'
require 'carrierwave/test/matchers'

describe S3Uploader do
  include CarrierWave::Test::Matchers

  before do
    S3Uploader.enable_processing = true
    @user = create(:user)
    @user.save!
  end

  after do
    S3Uploader.enable_processing = false
  end

  context 'the image sizes' do
    it "should scale down a landscape image to be exactly 50 by 31 pixels" do
      @book = create(:approved_active_book)
      @book.user_id = @user.id
      @book.save!
      @book.image.thumb.should have_dimensions(50, 31)
    end
    it "should save image with full resolution" do
      @book = create(:approved_active_book)
      @book.user_id = @user.id
      @book.save!
      @book.image.should have_dimensions(1920, 1200)
    end
  end
  context 'default url' do
    it "should return default url if no image is attached" do
      @book = create(:un_approved_book)
      @book.user_id = @user.id
      @book.save!
      @book.image_url.should eq('default.jpg')
    end
  end
  context 'unsupported types' do
    it "should throw exception when unsupported types are being uploaded" do
      @book = create(:un_approved_book)
      @book.user_id = @user.id
      @book.image = File.open(File.join(Rails.root, '/app/assets/images/default.pdf'))
      expect { @book.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Image You are not allowed to upload \"pdf\" files, allowed types: jpg, jpeg, gif, png")
    end
  end
end