class Book < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, S3Uploader
    validates :title, :author, :isbn, presence: true
	has_many :reviews

	def avg_rating
		if !self.reviews.empty?
			self.reviews.collect{ |r| r.rating }.reduce(:+) / self.reviews.size
		else
			" - "
		end
	end
end
