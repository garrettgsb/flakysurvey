class AddChoiceIdToAnswers < ActiveRecord::Migration[5.0]
  def change
    change_table :answers do |t|
      t.belongs_to :choice, index: true
    end
  end
end
