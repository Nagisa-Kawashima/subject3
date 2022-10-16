class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  # validates :body, presence: true
  # validates :body, {presence: true length: maximum: 140 }
  validates :body, {presence: true, length: { maximum: 200}}
# length: { minimun:　1, maximun: 50 }




end
