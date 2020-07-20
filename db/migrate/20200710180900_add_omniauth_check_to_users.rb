class AddOmniauthCheckToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :omniauth, :boolean
  end
end
