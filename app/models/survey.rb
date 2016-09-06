class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions
  validates :user_id, :presence => true
  validates :title, :presence => true
end
