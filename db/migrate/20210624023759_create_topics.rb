class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :status
      t.boolean :is_selected

      t.timestamps
    end
  end
end
