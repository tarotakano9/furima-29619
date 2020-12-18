class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birth_date, :date, null: false
  end
end
