require "application_system_test_case"

class SchoolsTest < ApplicationSystemTestCase
  test "visiting the index" do
	visit schools_url
  
	assert_selector "h1", text: "Schools"
  end

  
	test "creating an school" do
	  visit schools_path
	 
	  click_on "New School"
	 
	  fill_in "Name", with: "Creating an School Name"
	  fill_in "Code", with: "Created this school code"
	 
	  click_on "Create School"
	 
	  assert_text "Creating an School"
	end
end
