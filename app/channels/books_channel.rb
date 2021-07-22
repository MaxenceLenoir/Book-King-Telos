class BooksChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'books'
  end

  def unsubscribed
    stop_stream_from 'books'
  end
end
