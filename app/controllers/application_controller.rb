class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      flash[:alert] = "ログインが必要です"
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user&.role == "admin"
      flash[:alert] = "管理者専用ページです"
      redirect_to root_path
    end
  end

  def require_librarian_or_admin
    unless current_user&.admin?
      flash[:alert] = "司書または管理者のみアクセス可能です"
      redirect_to root_path
    end
  end
end


