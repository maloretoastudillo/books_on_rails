class ProductsController < ApplicationController
  before_action :set_book, only: %i[ new edit update create ]
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_condition, only: %i[ new create edit update ]
  before_action :set_status, only: %i[ new create edit update ]
  before_action :authenticate_user!

  def index
    @my_products = Product.all.where(user: current_user)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params.merge(user: current_user))
    @product.book = @book

    respond_to do |format|
      if @product.save
        format.html { redirect_to book_path(@book), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:book_id])
  end    
    
  def set_product
    @product = Product.find(params[:id])
  end

  def set_condition
    @condition = Product.conditions.keys.map{|condition| [condition.humanize, condition] }
  end

  def set_status
    @status = Product.statuses.keys.map{|status| [status.humanize, status] }
  end

  # Only allow a list of trusted parameters through.

  def product_params
    params.require(:product).permit(:editorial,  :price, :condition, :status, images: [])
  end
end
