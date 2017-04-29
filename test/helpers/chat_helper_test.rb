require 'test_helper'

class ChatHelperTest < ActionView::TestCase
  test 'get_messages' do
    json = get_messages('Admin')
    puts json[0]
    assert_equal 'n1kam', JSON.parse(json[0])['name']
    # json.assert_equals(:name, :message)
  end
end