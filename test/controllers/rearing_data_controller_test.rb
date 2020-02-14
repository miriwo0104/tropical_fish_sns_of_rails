require 'test_helper'

class RearingDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rearing_data_index_url
    assert_response :success
  end

end
