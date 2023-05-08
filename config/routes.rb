Rails.application.routes.draw do

  devise_for :users
  get 'messages/index'
  root to: "messages#index"# ビューを実装するために仮のルーティングを設定(rails g controller messages indexでコントローラーとビューを作成する)
  
end
