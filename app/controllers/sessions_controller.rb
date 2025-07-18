class SessionsController < ApplicationController
  def new
    # ログインフォーム表示
  end

  def create
    user = User.find_by(student_no: params[:student_no])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to books_path, notice: "ログインしました"
    else
      flash.now[:alert] = "学籍番号かパスワードが違います"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "ログアウトしました"
  end
end

