class CreateLabelsTopicsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :labels, :topics do |t|
      # t.index [:label_id, :topic_id]
      # t.index [:topic_id, :label_id]
    end
  end
end
