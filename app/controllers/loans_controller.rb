class LoansController < ApplicationController
    def borrow
      book = Book.find(params[:book_id])
      user = User.find(params[:user_id])
  
      if book.available_count > 0
        loan = Loan.new(user: user, book: book, borrowed_at: Time.now, due_at: Time.now + 2.weeks)
  
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
        loan = Loan.find(params[:loan_id])
      
        # 返却状態を更新するだけでOK！
        loan.update!(returned: true)
      
        flash[:notice] = "本を返却しました。"
        redirect_to book_path(loan.book)
      end
      
  end
  