class AddcountryToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :country, :string
  end
end
