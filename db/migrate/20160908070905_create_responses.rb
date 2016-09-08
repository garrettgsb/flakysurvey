class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.belongs_to :survey, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
