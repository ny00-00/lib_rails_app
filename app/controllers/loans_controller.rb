class LoansController < ApplicationController
  before_action :require_login

  def borrow
    book = Book.find(params[:book_id])
    user = current_user

    if book.available_count > 0
      loan = Loan.new(
        user: user,
        book: book,
        borrowed_at: Time.current,
        due_at: 2.weeks.from_now
      )

      if loan.save
        flash[:notice] = "本を借りました。返却期限は#{loan.due_at.strftime('%Y-%m-%d')}です。"
      else
        flash[:alert] = "貸出に失敗しました。"
      end
    else
      flash[:alert] = "この本はすでに全て貸出中です。"
    end

    redirect_to books_path
  end

  def return_book
    loan = Loan.find(params[:id])  # ここを params[:id] に修正
    loan.update!(returned_at: Time.current)

    flash[:notice] = "本を返却しました。"
    redirect_to book_path(loan.book)
  end
end
