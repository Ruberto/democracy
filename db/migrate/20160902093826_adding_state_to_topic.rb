class AddingStateToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :state, :integer, default: 0
  end
end
