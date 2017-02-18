class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎访问JDStore！"
  end
end
