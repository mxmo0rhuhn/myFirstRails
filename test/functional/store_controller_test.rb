require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#main .entry', 1 # alles in meinen fixures
  end

test "markup needed for store.js.coffee is in place" do
get :index
assert_select '.store .entry > img', 3
assert_select '.entry input[type=submit]', 3
end

end
