class ScoreboardsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user,   only: :destroy
  def create
    @scoreboard = current_user.scoreboards.build(scoreboard_params)
    flash[:success] = @scoreboard.team
    flash[:success] = @scoreboard.correctness
    flash[:success] = @scoreboard.creativity
    flash[:success] = @scoreboard.relevance
    flash[:success] = @scoreboard.sustainability
    flash[:success] = @scoreboard.userExperience
    @scoreboard.save
    if @scoreboard.save
      flash[:success] = "Scoreboard Created!"
      redirect_to root_url 
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end


  def destroy
        @scoreboard.destroy
    flash[:success] = "Code deleted"
    redirect_to request.referrer || home_url
  end
   
  def edit
        @scoreboard.edit
    redirect_to request.referrer || home_url
  end
    
    
  private
    def scoreboard_params
      params.require(:scoreboard).permit(:team, :correctness, :creativity, :relevance, :sustainability, :userExperience)
    end


    def correct_user
      @scoreboard = current_user.scoreboards.find_by(id: params[:id])
      redirect_to root_url if @scoreboard.nil?
    end
end