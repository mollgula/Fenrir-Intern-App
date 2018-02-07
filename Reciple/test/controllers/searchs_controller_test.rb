require 'test_helper'

class SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get sear" do
    get searchs_sear_url
    assert_response :success
  end

  test "should get resu" do
    get searchs_resu_url
    assert_response :success
  end

end
