class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image #各レコードとファイルを1対1の関係で紐づける.それぞれ1つのファイルを添付OK.imageって名前でアクセス｡このあとコントローラー
  validates :content, presence: true
end
