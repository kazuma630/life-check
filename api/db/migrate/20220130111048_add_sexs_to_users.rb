class AddSexsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sex, :string, :limit => 1, null: false, default: "0", after: :nickname, comment: "0: 不明, 1: 男性, 2: 女性, 9: 適用不能"
  end
end
