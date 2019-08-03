class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: ['APPROVED', 'DENIED', 'PENDING'], presence: true
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :overlapping_requests

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests 
    if CatRentalRequest.where(<<-SQL
      status = 'APPROVED' AND 
      cat_id = #{cat_id} AND 
      (
       '#{start_date}' BETWEEN start_date AND end_date OR 
       '#{end_date}' BETWEEN start_date AND end_date
      )
    SQL
    ).count > 0
      return false
    else
      return true
    end
  end
end

