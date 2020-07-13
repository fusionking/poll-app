require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  test "should not save an Option without a question" do
  	option = Option.new
  	assert_not option.save, "Saved the Option without a question"
  end
end
