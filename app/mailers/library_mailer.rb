class LibraryMailer < ActionMailer::Base
  default from: "library@viswajyothischools.org"

  def on_new_review(review)
    @review = review
    @book = Book.find(review.book_id)
    user_emails = Array.new
    user_emails.push(User.find(@book.user_id).email)
    following_users = Follow.where("book_id = ?", @book.id)
    following_users.each do |f|
      user_emails.push(User.find(f.user_id).email)
    end
    mail(:to => user_emails.join(";"), :subject => "Review of the book: #{@book.title}")
  end

  def on_follow(follow)
    @book = Book.find(follow.book_id)
    @user = User.find(follow.user_id)
    mail(:to => @user.email, :subject => "New book #{@book.title} added to your following list!")
  end

  def invite_user(email, user)
    @current_user = user
    mail(:to => email, :cc => user.email, :subject => "You are invited to join Library")
  end
end
