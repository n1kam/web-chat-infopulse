require 'test_helper'
class LoginTest < ActionDispatch::IntegrationTest

  test 'Login' do
    get '/login'
    assert_select 'label', 'Логин'
  end

  test 'Login in site' do
    post '/login', params: {l: "n1kam", p: "atr791frq12"}
    # assert_response :success
    assert_redirected_to login_index_path
  end

end