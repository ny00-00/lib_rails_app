class BooksController < ApplicationController
  # require_login をコメントアウトして、ログイン不要にする
  # before_action :require_login
  
  # require_librarian をコメントアウトして、司書専用機能も外す
  # before_action :require_librarian, only: [:edit, :update, :destroy]
  
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @categories = Book.distinct.pluck(:category)
  
    @books = Book.all
  
    if params[:query].present?
      keyword = "%#{params[:query]}%"
      @books = @books.where("title LIKE ? OR author LIKE ?", keyword, keyword)
    end
  
    if params[:category].present? && params[:category] != ""
      @books = @books.where(category: params[:category])
    end
  end
  
  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # require_librarian メソッドは今は不要なのでコメントアウト
  # def require_librarian
  #   unless current_user&.role == 'librarian'
  #     redirect_to books_path, alert: "権限がありません"
  #   end
  # end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :category, :total_copies)
  end
end
