require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  def setup
    @menu = JSON.parse(File.read(Rails.root + 'app/data/menu.json'))
    @selectedObject = selected_object(@menu['outbound'], 'name', 'patreon')
  end

  test "selected_object should return a hash during an array lookup" do
    assert @selectedObject.instance_of? Hash
  end

end