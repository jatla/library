class Book < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, S3Uploader

	has_many :reviews

	def has_reviews?
		Review.where("book_id = ?", self.id).count > 0
	end
end
