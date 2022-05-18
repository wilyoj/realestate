require "test_helper"

class CommonPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get common_pages_index_url
    assert_response :success
  end
end
