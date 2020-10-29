require 'test_helper'

class GossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get author" do
    get gossips_author_url
    assert_response :success
  end

end
