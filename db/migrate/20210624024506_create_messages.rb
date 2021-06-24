class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :subject
      t.text :body
      t.datetime :time_received
      t.boolean :is_note_to_self
      t.belongs_to :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
