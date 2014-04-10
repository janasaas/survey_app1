class CreateQresponses < ActiveRecord::Migration
  def change
    create_table :qresponses do |t|
      t.integer :response_id      
      t.integer :question_id
      t.string  :answer
      t.timestamps
    end
  end
end
