class HomesController < ApplicationController

    def index
        if params[:text]
            redirect_to dashboard_path(text: params[:text])
        end
    end

    def dashboard
        @titles = Book.where("title iLike ?", "%" + "#{params[:text]}" + "%")
        @authors = Book.where("author iLike ?", "%" + "#{params[:text]}" + "%")
        @editorials = Book.where("editorial iLike ?", "%" + "#{params[:text]}" + "%")
        @books = @titles + @authors + @editorials
        @results = Product.where(book: @books)
    end
end
