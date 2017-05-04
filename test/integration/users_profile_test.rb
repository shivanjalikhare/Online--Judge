require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.scoreboards.count.to_s, response.body
    assert_select 'div.pagination'
    @user.scoreboards.paginate(page: 1).each do |micropost|
      assert_match scoreboard.team, response.body
      assert_match scoreboard.correctness, response.body
      assert_match scoreboard.creativity, response.body
      assert_match scoreboard.relevance, response.body
      assert_match scoreboard.sustainability, response.body
      assert_match scoreboard.userExperience, response.body
      
    end
  end
end  