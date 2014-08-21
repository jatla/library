class User < ActiveRecord::Base
  devise :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :books
  has_many :reviews

  has_many :follows
  has_many :followed_books, through: :follows, source: "Book"

  def books
    Book.where("user_id = ?", self.id)
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.avatar = auth.info.image
    end
  end
end
