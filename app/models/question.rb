class Question < ApplicationRecord
  belongs_to :survey
  # has_many :answers, :choices
  validates :survey_id, :presence => true
  validates :type, :presence => true
  validates :prompt, :presence => true
end
