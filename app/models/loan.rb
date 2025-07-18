class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # 延滞判定メソッド
  def overdue?
    returned_at.nil? && due_at < Date.today
  end
end

