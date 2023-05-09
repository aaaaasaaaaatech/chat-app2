class Room < ApplicationRecord
  # has_many users, foreign_key:id 適当に答えたやつ笑
  has_many :room_users #中間テーブルの名前書く
  has_many :users, through: :room_users #usersは中間テーブルの相手のテーブル名？ through:は中間テーブル名？
  has_many :messages

  validates :name, presence: true
  
end
