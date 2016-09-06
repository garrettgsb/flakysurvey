class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions
  validates :user_id, :presence => true
end
