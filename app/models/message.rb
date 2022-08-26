class Message < ApplicationRecord
  belongs_to :book
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  paginates_per 20

  def self.conversations_of(user:)
    messages = where(sender: user).or(where(recipient: user)).order(created_at: :desc)
    
    messages.each do |message|
      if message.sender == user
        message.code = (message.sender_id.to_s + message.recipient_id.to_s + message.book_id.to_s)
      else
        message.code = (message.recipient_id.to_s + message.sender_id.to_s + message.book_id.to_s)
      end
    end

    messages.uniq { |message| message.code }
  end

  def get_counterparty_id_of(user)
    sender_id == user.id ? recipient_id : sender_id
  end

  def name(user)
    first = self.sender == user ? self.recipient.first_name : self.sender.first_name
    last = self.sender == user ? self.recipient.last_name : self.sender.last_name

    first + " " + last

  end

  def self.mine(book:, user:, other_user:)
    messages = where(sender: user, recipient: other_user, book: book).or(where(sender: other_user, recipient: user, book: book)).order(created_at: :desc)
  end

  def full_name
    self.first_name + " " + self.last_name
  end

end
