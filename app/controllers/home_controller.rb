class HomeController < ApplicationController
  def index
    @users = User.all
    @shots = Shot.order()
  end
end
