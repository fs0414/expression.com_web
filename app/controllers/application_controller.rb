class ApplicationController < ActionController::Base
  def index
    render json: {message: 'hello 表現技法.com'}
  end
end
