Rails.application.routes.draw do

  devise_for :users
  root to: "rooms#index"
  # get 'messages/index'
  # root to: "messages#index"# ビューを実装するために仮のルーティングを設定(rails g controller messages indexでコントローラーとビューを作成する)
  resources :users, only: [:edit, :update ]  # users にはedit(編集) update(更新)はセットで！
  resources :rooms, only: [:new, :create ]   # roomsにはnew(新規作成) :create(保存)のアクションを！
  resources :rooms, only: [:new, :create] do #メッセージ送信機能に必要なindexとcreate
    resources :messages, only: [:index, :create] #どのルームで投稿されたメッセージなのかをパスから判断できるようにしたいので、ルーティングのネストを利用｡
  end
  


  
end
