require 'test_helper'

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get v1_users_create_url
    assert_response :success
  end

end
