class Message < ApplicationRecord
  belongs_to :book
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  paginates_per 50

  def name
    first = self.sender == @current_user ? self.recipient.first_name : self.sender.first_name
    last = self.sender == @current_user ? self.recipient.last_name : self.sender.last_name

    first + " " + last

  end

  def mine
    sender = self.where(sender_id: @current_user.id).order(created_at: :desc)
    received = self.where(recipient_id: @current_user.id).order(created_at: :desc)

    sender_filtered = sender.uniq{|message| [message.book, message.recipient]}
    received_filtered = received.uniq{|message| [message.book, message.sender]}

    sender_filtered + received_filtered
    
    #.uniq{|message| [message.book, message.sender, message.recipient]}

    #mine.order(created_at: :desc)
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def conversation
    conversation = self.where(book: message.book, recipient_id: [message.recipient.id, current_user.id], sender_id: [message.recipient.id, current_user.id])
    conversation.order(created_at: :desc)
  end
end
