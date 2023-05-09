class MessagesController < ApplicationController
  def index
    @message = Message.new #空のMessageモデルのインスタンス情報
    @room = Room.find(params[:room_id]) #paramsに含まれているチャットルームのレコード情報
    @messages = @room.messages.includes(:user) #N+1問題
  end

  def create
    @room = Room.find(params[:room_id]) 
    @message = @room.messages.new(message_params) #newメソッド チャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出し｡
    # @message.save #saveメソッド newメソッドとともに値をDBへ保存
    if @message.save #送信ができたら
      redirect_to room_messages_path(@room) #メッセージ一覧画面にリダイレクト
    else
      render :index #失敗したらindex.html.erbを表示するように
    end
  end

  private #ストロングパラメーターを用いてインスタンスを作成

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  
end
