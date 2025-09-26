class SessionsController < ApplicationController
  def new
    # ログイン画面を表示するだけ（問題なし）
  end

  def create
    user = User.find_by(student_no: params[:student_no])

    if user && user.password == params[:password]  # ← ここはauthenticateじゃなくてこれでOK
      session[:user_id] = user.id
      flash[:notice] = "ログインしました！"
      redirect_to root_path
    else
      flash.now[:alert] = "学籍番号またはパスワードが違います。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました！"
    redirect_to root_path
  end
end


