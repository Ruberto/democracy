class CreateBallots < ActiveRecord::Migration[5.0]
  def change
    create_table :ballots do |t|
      t.string :ip_address
      t.string :name

      t.timestamps
    end
  end
end
