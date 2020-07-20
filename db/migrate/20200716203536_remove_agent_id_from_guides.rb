class RemoveAgentIdFromGuides < ActiveRecord::Migration[5.2]
  def change
    remove_column :guides, :agent_id
  end
end
