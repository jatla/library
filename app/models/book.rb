class Book < ActiveRecord::Base
	belongs_to :user
	has_many :reviews
	
	has_many :follows
    has_many :followers, through: :follows, source: "User"

	has_many :opted_outs
    has_many :opted_out_users, through: :opted_outs, source: "User"

	mount_uploader :image, S3Uploader
    validates :title, :author, :isbn, presence: true

	def avg_rating
		if !self.reviews.empty?
			self.reviews.collect{ |r| r.rating }.reduce(:+) / self.reviews.size
		else
			" - "
		end
	end
end
