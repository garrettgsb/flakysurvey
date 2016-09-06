class AddSurveysTable < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
