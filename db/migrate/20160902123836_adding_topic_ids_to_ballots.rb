class AddingTopicIdsToBallots < ActiveRecord::Migration[5.0]
  def change
    add_column :ballots, :topic_ids, :text, array: true, default: []
  end
end
