class UsersController < ApplicationController
  def edit
  end

  def update    # ユーザー情報の更新
    if current_user.update(user_params) 
      redirect_to root_path      # もしユーザー情報の更新に成功したら､チャット画面｢root_path｣へリダイレクト
    else
      render :edit      # もしユーザー情報の更新に失敗したら､editのビューを表示
    end
    # current_user.update(user_params)# 現在ログイン中のuser 「name」と「email」の編集を許可している状態
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
