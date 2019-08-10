require "test_helper"

class Api::FilesControllerTest < ActionDispatch::IntegrationTest
  test "should create record with valid inputs" do
    file = fixture_file_upload(Rails.root.join("test", "fixtures", "files", "dummy.pdf"), "application/pdf")
    post api_files_url, params: { name: "Osaze", tags: ["lambda", "zeem", "grim"], file: file }

    assert_response :success
  end

  test "should throw an error on invalid filetype" do
    file = fixture_file_upload(Rails.root.join("test", "fixtures", "files", "ir211wk12sample.xls"), "application/vnd.ms-excel")

    assert_raise ActiveRecord::RecordInvalid, "Validation failed" do
      post api_files_url, params: { name: "Osaze", tags: ["lambda", "zeem", "grim"], file: file }
    end
  end

  test "should throw error on invalid params" do
    assert_raise ActiveRecord::RecordInvalid, "Validation failed" do
      post api_files_url, params: {}
    end
  end
end
