require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get support" do
    get pages_support_url
    assert_response :success
  end

end
