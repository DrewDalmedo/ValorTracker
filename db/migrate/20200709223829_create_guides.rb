class CreateGuides < ActiveRecord::Migration[5.2]
  def change
    create_table :guides do |t|
      t.string :title
      t.text :body
      t.integer :agent_id
      t.integer :map_id
      t.integer :user_id

      t.timestamps
    end
  end
end
