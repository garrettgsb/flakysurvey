class ChangeQuestionTypeColumn < ActiveRecord::Migration[5.0]
  def change
    change_table :questions do |t|
      t.rename :type, :question_type
    end
  end
end
