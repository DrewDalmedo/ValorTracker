class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :kills
      t.integer :deaths
      t.integer :assists
      t.integer :friendly_team_score
      t.integer :enemy_team_score
      t.integer :agent_id
      t.integer :map_id
      t.integer :user_id

      t.timestamps
    end
  end
end
