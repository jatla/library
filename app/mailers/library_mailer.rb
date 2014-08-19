require 'aws/core'
require 'aws/simple_email_service'

class LibraryMailer < ActionMailer::Base
  default from: "library@viswajyothischools.org"

  def on_new_review(review, book)
    @review = review
    @book = book
    @user = User.find(book.user_id)
    mail(:to => @user.email, :subject => "Review of the book: #{@book.title}")
  end
end
