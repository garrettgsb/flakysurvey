class Choice < ApplicationRecord
  belongs_to :question
  validates :text, :presence => true
  validates :question_id, :presence => true
end
