class UsersController < ApplicationController
  def new
    @user_form = UserForm.new
  end

  def create
    @user_form = UserForm.new(user_params)
    if @user_form.valid?
      session[:user_form] = @user_form
      redirect_to verify_email_path
    else
      # フォームデータが不正な場合の処理
      flash[:alert] = "エラーが発生しました。"
      render :new
    end
  end

  def verify_email
    # セッションから再度インスタンスを作成
    @user_form = UserForm.new(session[:user_form])
  end

  private

  def user_params
    params.require(:user_form).permit(:name, :email, :verify_code)
  end
end
