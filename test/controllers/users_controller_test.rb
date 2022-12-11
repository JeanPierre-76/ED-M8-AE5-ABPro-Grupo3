require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "admin login and browse brands" do
    https!
    get “/login”
    assert_response :success
    
    admin = users :admin
    post_via_redirect “/login”, username: admin.username, password: admin.password
    assert_equal ‘/welcome’, path
    # assert_equal ‘/welcome admin!’, flash[:notice]
    
    https! false
    get “/brands.all”
    assert_response :success
    assert_assigns :brands
  end

  test "vendedor login and browse products" do
    https!
    get “/login”
    assert_response :success
    
    admin = users :vendedor
    post_via_redirect “/login”, username: vendedor.username, password: vendedor.password
    assert_equal ‘/welcome’, path
    # assert_equal ‘/welcome vendedor!’, flash[:notice]
    
    https! false
    get “/products.all”
    assert_response :success
    assert_assigns :products
  end

end
