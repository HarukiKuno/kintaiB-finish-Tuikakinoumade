class UsersController < ApplicationController
  
  
 def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # この段階ではまだ実装は終わっていません。
    if @user.save
      log_in @user
      flash[:success] = "ユーザーの新規作成に成功しました。"
      redirect_to @user
      # 保存が成功した場合はここに記述した処理が実行される。
    else
      render 'new'
    end
  end
  
  private
  
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
