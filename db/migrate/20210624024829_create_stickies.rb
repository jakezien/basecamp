class CreateStickies < ActiveRecord::Migration[6.1]
  def change
    create_table :stickies do |t|
      t.text :body
      t.belongs_to :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
