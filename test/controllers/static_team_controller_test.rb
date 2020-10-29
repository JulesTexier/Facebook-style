require 'test_helper'

class StaticTeamControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get static_team_team_url
    assert_response :success
  end

end
