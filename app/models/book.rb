class Book < ActiveRecord::Base
	belongs_to :user
	has_many :reviews
	
	has_many :follows
    has_many :followers, through: :follows, source: :user

	has_many :opted_outs
    has_many :opted_out_users, through: :opted_outs, source: :user

    has_many :book_tags
    has_many :tags, through: :book_tags

	mount_uploader :image, S3Uploader
    validates :title, :author, :isbn, presence: true
    validates :isbn, uniqueness: true

	def avg_rating
		if !self.reviews.empty?
			self.reviews.collect{ |r| r.rating }.reduce(:+) / self.reviews.size
		else
			" - "
		end
	end
end
