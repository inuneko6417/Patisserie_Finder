require "test_helper"

class PatisseriesControllerTest < ActionDispatch::IntegrationTest
  test "should get ranking" do
    get patisseries_ranking_url
    assert_response :success
  end

  test "should get index" do
    get patisseries_index_url
    assert_response :success
  end

  test "should get show" do
    get patisseries_show_url
    assert_response :success
  end
end
