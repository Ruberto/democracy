class AddingAuthorToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :author, :string
  end
end
