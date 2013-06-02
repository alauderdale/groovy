class ShotsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @shots = Shot.order()
  end

  def show
    @shot = Shot.find(params[:id])
  end


  def new
    @shot = Shot.new
  end

  def create
    @shot = Shot.new(params[:shot])
    if @shot.save
    #If save succeeds return to list action
      redirect_to shots_path, :notice => "Shot Created"
    #if form fails, redisplay form so user can fix problems
    else
      render('new')
    end
  end

  def delete
    @shot = Shot.find(params[:id])
  end

  def destroy_shot
    shot = Shot.find(params[:id])
    shot.destroy
    redirect_to shots_path, :notice => "Shot Deleted"
  end

end
