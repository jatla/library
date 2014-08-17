class Review < ActiveRecord::Base
	validates :description, :rating, presence: true
end
