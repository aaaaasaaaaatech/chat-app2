require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path) #「current_path（現在のページ）」は「new_user_session_path（サインインページ）」となることを確認している
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user) #(1)｢ FactoryBot｣データベースにcreateメソッドでユーザーをテスト用のDBに保存｡@user.saveは不正解
    
    # サインインページへ移動する
    visit new_user_session_path
    
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path) 

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    #(1)の後､保存したユーザーの「メールアドレス」「パスワード」をfill_inメソッドで入力｡
    
    # ログインボタンをクリックする
    click_on ('Log in')
    
    # トップページに遷移していることを確認する
    expect(current_path).to eq(root_path) #expectメソッドを用いて、ログインページ（current_path）から、トップページ（root_path）に遷移していることを確認
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # トップページに遷移する
    visit root_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)

    # 誤ったユーザー情報を入力する
    fill_in 'user_email', with: 'test'
    fill_in 'user_password', with: 'test'

    # ログインボタンをクリックする
    click_on ('Log in')
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq(new_user_session_path)

  end
end