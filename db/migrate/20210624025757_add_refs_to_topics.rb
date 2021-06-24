class AddRefsToTopics < ActiveRecord::Migration[6.1]
  def change
    add_reference :topics, :message, null: false, foreign_key: true
    add_reference :topics, :sticky, null: false, foreign_key: true
  end
end
