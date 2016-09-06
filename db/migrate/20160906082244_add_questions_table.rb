class AddQuestionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.belongs_to :survey, index: true
      t.string :type
      t.text :prompt
      t.timestamps
    end
  end
end
