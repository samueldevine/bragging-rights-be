class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.bigint :user_id
      t.integer :score

      t.timestamps
    end
  end
end
