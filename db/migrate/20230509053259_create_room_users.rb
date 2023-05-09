class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, null: false, foreign_key: true #null: false = からの状態で保存不可にする foreign_key: true = 外部キー(roomsテーブル)を参照
      t.references :user, null: false, foreign_key: true #null: false = からの状態で保存不可にする foreign_key: true = 外部キー(usersテーブル)を参照
      t.timestamps
    end
  end
end
