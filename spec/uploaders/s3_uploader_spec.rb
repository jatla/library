require 'spec_helper'
require 'carrierwave/test/matchers'

describe S3Uploader do
  include CarrierWave::Test::Matchers

  before do
    S3Uploader.enable_processing = true
    @uploader = S3Uploader.new(@user, :avatar)
    path_to_file = "app/assets/images/logo.jpg"
    @uploader.store!(File.open(path_to_file))
  end

  after do
    S3Uploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 50 by 50 pixels" do
      @uploader.thumb.should have_dimensions(50, 50)
    end
  end
end