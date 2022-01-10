class RenameGamesToScores < ActiveRecord::Migration[5.2]
  def change
    rename_table :games, :scores
  end
end
