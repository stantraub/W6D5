require 'date'

class Cat < ApplicationRecord
  COLORS = ['blue', 'red', 'black', 'green']
  validates :birth_date, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: ['M', 'F']

  has_many :cat_rental_requests, dependent: :destroy,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

  def age
    date = Date.parse(birth_date)
    today = Date.today

    date_difference = today - date
    date_difference / 365
  end
end
