class User < ApplicationRecord

  has_many :loans
  has_many :books, through: :loans

  # ロール判定メソッド
  def admin?
    role == "admin" || role == "librarian"
  end
end

  