class MessagesController < ApplicationController
  #before_action :set_book
  before_action :set_product, except: %i[ index show book_messages ]
    
  def index
    @conversations = Message.conversations_of user: current_user
    # @messages = Message.page(params[:page])
  end

  def show
    # @message = Message.find(message.id)
    # @message = Message.new
  end

  def create
    #@product = Product.find(params[:id])
    @message = Message.new(message_params.merge(sender_id: current_user.id, book_id: @product.book.id, recipient_id: @product.user.id))

    respond_to do |format|
      if @message.save
        format.html { redirect_to message_url(@message)}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  def book_messages
    # def set_book
    @book = Book.find(params[:book_id])
    @user = User.find(params[:user_id])
    @messages = Message.mine(book: @book, user: @user, other_user: current_user)
    @message = @messages.first
  end

  private
  # def set_book
  #   @book = Book.find(params[:id])
  # end

  def set_product
    @product = Product.find(params[:id])
  end
  # def set_my_messages
  #   @my_messages = Message.all.mine
  # end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:content)
  end

end