require 'test_helper'

class Api::FilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get files_index_url
    assert_response :success
  end

end
