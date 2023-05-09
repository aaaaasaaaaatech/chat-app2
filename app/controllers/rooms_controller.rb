class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new #チャットルームの新規作成なので「new」アクション.form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
    # new.html.erbファイルのform_withに渡される｡
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

end
