class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :responses
  validates :user_id, :presence => true
  validates :title, :presence => true
end
