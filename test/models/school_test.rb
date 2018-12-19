require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  
	test "should not save school without title" do
	  school = School.new
	  assert_not school.save
	end
  def setup
    @school = schools(:one)
    # @school = schools(:two)
  end
	
	test "should report error" do
	  assert_raises(NameError) do
	    some_undefined_variable
	  end
    end

    
  test "name validation should trigger" do
    assert_not School.new(code: "code").save
  end

  test "school should save" do
       # should have_many(:school_staffs)
    puts profiles(:one).gender
  end

  test 'invalid without code' do
	  school = School.new(name: 'John')
	  refute school.valid?
	  assert_not_nil school.errors[:code]
  end

  test '#school_staffs' do
    assert_equal 3 , @school.school_staffs.length
    assert_equal "babi", @school.school_staffs.first.name
    assert_equal "babi@gmail.com", @school.school_staffs.first.email
    assert_equal 1, @school.school_staffs.first.contact
    assert_equal 1, @school.school_staffs.first.year_of_experience
    assert_equal "hindi", @school.school_staffs.first.specialist
  
    assert_equal "harish", @school.school_staffs.last.name
    assert_equal "harish.gp520@gmail.com", @school.school_staffs.third.email
    assert_equal 96424199, @school.school_staffs.last.contact
    assert_equal 5, @school.school_staffs.last.year_of_experience
    assert_equal "telugu", @school.school_staffs.last.specialist

    assert_equal "siva", @school.school_staffs.second.name
    assert_equal "siva@gmail.com", @school.school_staffs.second.email
    assert_equal 123456, @school.school_staffs.second.contact
    assert_equal 4, @school.school_staffs.second.year_of_experience
    assert_equal "english", @school.school_staffs.second.specialist



  end
  
  test "#events" do
  	assert_equal 2 , @school.events.length
    assert_equal "running", @school.events.first.name
    assert_equal "dance", @school.events.second.name

  end
  
  test "#admissions" do
  	assert_equal 1 , @school.admissions.length
    assert_equal "2018", @school.admissions.first.year
    assert_equal 1000, @school.admissions.first.boys
    assert_equal 1000, @school.admissions.first.girls
      
  end

end














# https://www.youtube.com/watch?v=jQvB0QWe5Bs


# test "check school info" do
    # 	school = School.new
    # 	result = school.school_info
    # 	assert_equal "lllll"
    # end

# def test_school_info

    #    assert_equal "lllll", @school.test_school_info
    # end
