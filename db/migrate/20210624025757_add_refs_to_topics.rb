class AddRefsToTopics < ActiveRecord::Migration[6.1]
  def change
    add_reference :topics, :message, null: true, foreign_key: true
    add_reference :topics, :sticky, null: true, foreign_key: true
  end
end
