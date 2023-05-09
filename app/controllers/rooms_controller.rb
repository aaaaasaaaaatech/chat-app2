class RoomsController < ApplicationController

  def new
    @room = Room.new #チャットルームの新規作成なので「new」アクション.form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
    # new.html.erbファイルのform_withに渡される｡
  end

end
