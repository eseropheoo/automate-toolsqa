require 'spec_helper'


describe "Auto_Testing practice form"  do 

	before(:all) do
		@session = Capybara::Session.new(:chrome)
		@session.visit("http://toolsqa.com/automation-practice-form/")
	end

	it "should check the url" do
		expect(@session.current_url).to eq("http://toolsqa.com/automation-practice-form/")

	end

	it "should fill in the first and last name" do
		@session.find_field('firstname').has_field?
		@session.fill_in('firstname',  :with => 'Ese')
		expect(@session.find_field('firstname').value).to eq('Ese')
		

	 	@session.find_field('lastname').has_field?
		@session.fill_in('lastname',  :with => 'okoro')
		expect(@session.find_field('lastname').value).to eq('okoro')
		
		
	end

	it "should click an option for gender" do
		@session.find_by_id("sex-0").has_button?
		@session.find_by_id("sex-0").click
		@session.find_field("sex-0").has_checked_field?
		@session.find_field("sex-1").has_no_unchecked_field?


	end

	it "should click an option for years of experience " do
		@session.find_by_id("exp-2").has_button?
		@session.find_by_id("exp-2").click
		@session.find_by_id("exp-2").has_checked_field?
		
	end

	it "should fill in the date" do
		@session.find_field("datepicker").has_field?
		@session.fill_in("datepicker", :with => "12/12/2006")
		expect(@session.find_field("datepicker").value).to be_an_instance_of(String)
		
		
	end

	it "should click an option for the automation tester in profession" do
		@session.find_by_id("profession-1").has_field?
		@session.find_by_id("profession-1").click
		@session.find_by_id("profession-1").has_checked_field?
		@session.find_by_id("profession-0").has_no_checked_field?

	end

	it "should upload a photo" do
		@session.attach_file('photo', '/Users/tech-a10/Desktop/google-img.png')
		#Assertion difficult because there's no change in the html object
	end

	it "should click an option for automation tool" do
		@session.find_by_id("tool-2").has_field?
		@session.find_by_id("tool-2").click
		@session.find_by_id("tool-2").has_checked_field?
	end

	it "should search through the scroll bar and select a continent" do
		@session.find_by_id("continents").has_select?
		# @session.find_by_id("continents").click
		@session.find(:select, 'continents').first(:option, 'Africa').select_option
		expect(@session.find(:select, 'continents').value).to eq('Africa')
	end

	it "should search through selenium commands" do
		@session.find_by_id('selenium_commands').has_select?
		@session.find(:select, 'selenium_commands').find(:option, 'Wait Commands').select_option
		expect(@session.find(:select, 'selenium_commands').value).to eq(['Wait Commands'])

	end

	it "should click the submit button" do
		@session.find_by_id('submit').has_button?
		@session.find_by_id('submit').click
	end

	

end
	

	
