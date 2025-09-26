class Book < ApplicationRecord
  has_many :loans
  has_many :users, through: :loans

  def borrowed_count
    loans.where(returned_at: nil).count
  end

  def available_count
    total_copies - borrowed_count
  end
end
