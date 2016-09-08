class CreateChoicesAddOrderIds < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.belongs_to :question, index: true
      t.integer :question_id
      t.integer :order_id
      t.text :text
      t.timestamps
    end

    change_table :questions do |t|
      t.integer :order_id
      t.text :placeholder
    end
  end
end
