class Sentence < ApplicationRecord
  def index

  end

  private

  def user_params
    params.require(:user).permit(:nikname, :email, :password, :password_confirmation, :role)
  end
end
