class MessagesController < ApplicationController
  #before_action :set_book
  before_action :set_product, except: %i[ index ]
    
  def index
    @my_messages = Message.page(params[:page])
  end

    def show
#        @conversation = @my_messages.conversation
        @conversation = Message.all
        @message = Message.new
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