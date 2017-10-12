require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get keyboard_init" do
    get :keyboard_init
    assert_response :success
  end

end
