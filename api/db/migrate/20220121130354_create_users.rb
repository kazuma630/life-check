class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false, comment: 'ニックネーム'
      t.datetime :birth_at, null: false, comment: '誕生日'
      t.timestamps
    end
  end
end
