class LibraryMailer < ActionMailer::Base
  default from: "library@viswajyothischools.org"

  def on_new_review(review)
    @review = review
    @book = Book.find(review.book_id)
    mail(:to => "library@viswajyothischools.org", :cc => mailing_list_for_book(@book, @review), :subject => "Review of the book: #{@book.title}")
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

  def mailing_list_for_book(book, review)
    user_emails = Array.new
    following_users = Array.new
    following_users.push(book.followers)
    following_users.push(User.find(book.user_id))
    following_users.flatten!
    following_users.each do |user|
      if (allowed(user, review))
        user_emails.push(user.try(:email))
      end
    end
    user_emails.join(";")
  end

  def allowed(user, review)
    allow = false
    user_preferences = UserConfig.find_by(user_id: user.id)
    book_preferences = OptedOut.find_by_user_id_and_book_id(user.id, review.book_id)
    if (!book_preferences.nil?)
      allow = preference(book_preferences.by_review, book_preferences.by_rating, book_preferences.rating_threshold, review.rating)
    elsif (!user_preferences.nil?)
      if ( user_preferences.daily_digest_enabled?)
        queue_for_digest(user, review)
      else
        allow = preference(user_preferences.opt_out_by_review, user_preferences.opt_out_by_rating, user_preferences.rating_threshold, review.rating)
      end
    else
      false
    end
    allow
  end

  def preference(by_review, by_rating, rating_threshold, review_rating)
    if (by_review)
      false
    elsif (by_rating && (review_rating < rating_threshold))
      false
    else
      true
    end
  end

  def queue_for_digest(user, review)
  end
end
