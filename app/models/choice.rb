class Choice < ApplicationRecord
  belongs_to :question
  has_many :answers
  validates :text, :presence => true
  validates :question_id, :presence => true
end
