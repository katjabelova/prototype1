require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @sunbject = User.new
  end

  test "email_should_be_required" do

    should validate_presence_of(:email)
  end

end
