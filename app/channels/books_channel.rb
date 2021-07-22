class BooksChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'books'
  end

  def unsubscribed
  end
end
