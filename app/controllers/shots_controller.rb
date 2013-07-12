class ShotsController < ApplicationController

  def index
    if params[:tag]
      @shots = Shot.tagged_with(params[:tag]).page(params[:page]).order('created_at DESC')
      @tag = params[:tag]
    else
      @shots = Shot.order().page(params[:page]).order('created_at DESC')
    end
  end

  def show
    @shot = Shot.find(params[:id])
    @comment = Comment.new( :shot => @shot )
    @rebounds = Rebound.order()
  end

  def new
    if current_user
      @shot = Shot.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @shot = Shot.new(params[:shot])
    @shot.user_id = current_user.id
    if @shot.save
    #If save succeeds return to list action
      redirect_to shots_path, :notice => "Shot Created"
    #if form fails, redisplay form so user can fix problems
    else
      flash[:alert]= "Make sure the file you uploaded is an audio clip under 30 seconds!"
      render :action => :new

    end
  end

  def edit
    @shot = Shot.find(params[:id])
    if current_user && current_user.id == @shot.user_id

    else
      redirect_to new_user_session_path
    end
  end

  def update_shot
    # Find object using form parameters
    @shot = Shot.find(params[:id])
    # Update the object
    if @shot.update_attributes(params[:shot])
      # If update succeeds, redirect to the list action
      redirect_to shot_path, :notice => "Shot Updated"
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
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
