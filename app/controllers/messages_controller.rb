class MessagesController < ApplicationController
  before_action :set_book, only: %i[ new create ]
  before_action :set_product, except: %i[ index xat book_messages ]
  before_action :authenticate_user!
    
  def index
    @conversations = Message.conversations_of user: current_user
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params.merge(sender_id: current_user.id, book_id: @product.book.id, recipient_id: @product.user.id))

    respond_to do |format|
      if @message.save
        format.html { redirect_to book_messages_path(@message.recipient_id, @message.book.id) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  def book_messages
    @book = Book.find(params[:book_id])
    @user = User.find(params[:user_id])
    @messages = Message.mine(book: @book, user: @user, other_user: current_user)
    @message = @messages.first
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:content)
  end
end