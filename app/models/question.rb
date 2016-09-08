class Question < ApplicationRecord
  belongs_to :survey
  has_many :choices
  has_many :answers
  # has_many :answers
  validates :survey_id, :presence => true
  validates :question_type, :presence => true
  validates :prompt, :presence => true
end
