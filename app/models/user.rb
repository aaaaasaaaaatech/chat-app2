class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :rooms, foreign_key:id   適当に答えたやつ笑

  has_many :room_users
  has_many :rooms, through: :room_users


  validates :name, presence: true 
  # ニックネームがからのとき､会員登録できない仕様

end
