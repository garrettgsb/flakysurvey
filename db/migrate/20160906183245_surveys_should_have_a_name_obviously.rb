class SurveysShouldHaveANameObviously < ActiveRecord::Migration[5.0]
  def change
    change_table :surveys do |t|
      t.text :title
    end
  end
end
