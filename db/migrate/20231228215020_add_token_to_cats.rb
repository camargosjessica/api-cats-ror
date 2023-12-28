class AddTokenToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :token, :string, null: false
    add_index :cats, :token
  end
end
