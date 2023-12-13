class UserSessionsController < ApplicationController
    def new
    end

    def create
      @user = login(params[:email], params[:password])

      binding.pry

      if @user
        redirect_back_or_to(sentences_path, notice: 'ログインに成功しました')
      else
        flash.now[:alert] = 'ログインに失敗しました'
        render :new
      end
    end

    def destroy
      logout
      redirect_to(login_path, notice: 'ログアウトしました')
    end
end
