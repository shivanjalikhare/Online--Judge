class StaticPagesController < ApplicationController
  def home
    
  end
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  def score
    @scoreboard = current_user.scoreboards.build if logged_in?
  end    
  
  def about
  end
  
  def contact
  end
  
end  
