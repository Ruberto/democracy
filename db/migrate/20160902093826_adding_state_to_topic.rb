class AddingStateToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :state, :integer
  end
end
