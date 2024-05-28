require "test_helper"

class NewCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_categories_new_url
    assert_response :success
  end
end
