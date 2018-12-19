require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
  	puts 'Testng'
    return false
  end
  
  def setup
   @user = users(:one)
  end
  
  puts "wdhgdsf"
  
  test 'invalid without email' do
    user = User.new(first_name: 'John')
    refute user.valid?
    assert_not_nil user.errors[:email]

  end
   
  
  test '#profile' do
    assert_equal "male", @user.profile.gender
    assert_equal "ongole", @user.profile.current_city
    assert_equal 112333, @user.profile.mobile_number
  end
  
  test '#recent' do
  assert_includes User.recent, users(:one)
  refute_includes User.recent, users(:two)
  end
end
