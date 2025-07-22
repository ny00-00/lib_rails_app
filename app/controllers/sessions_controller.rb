# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    # ログイン画面を表示するだけ
  end

  def create
    user = User.find_by(student_no: params[:student_no])

    if user && user.password == params[:password]  # パスワードの一致を確認
      session[:user_id] = user.id
      flash[:notice] = "ログインしました！"
      redirect_to root_path  # ログイン後のリダイレクト先
    else
      flash[:alert] = "学籍番号またはパスワードが違います。"
      render :new  # ログイン画面を再表示
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました！"
    redirect_to root_path
  end
end
