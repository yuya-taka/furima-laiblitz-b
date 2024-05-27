class ModifyUsersAndCreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    # usersテーブルからカラムを削除
    change_table :users do |t|
      t.remove :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday
    end

    # user_profilesテーブルを作成
    create_table :user_profiles do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.date :birthday, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

