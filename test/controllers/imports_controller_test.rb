require 'test_helper'

class ImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get import_index_url
    assert_response :success
  end

end
