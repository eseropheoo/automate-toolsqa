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
		@session.find_field('firstname').value
		@session.fill_in('firstname',  :with => 'Ese')
	 
	 	@session.find_field('lastname').value
		@session.fill_in('lastname',  :with => 'okoro')
	end

	it "should click an option for sex" do
		@session.find_by_id("sex-0").click

	end

	it "should click an option for years of experience " do
		@session.find_by_id("exp-2").click
		
	end

	it "should fill in the date" do
		@session.fill_in("datepicker", :with => "12/12/2006")
		
	end

	it "should click an option for the profession" do
		@session.find_by_id("profession-1").click
	end

	it "should click an option for automation tool" do
		@session.find_by_id("tool-2").click

	end

	it "should search through the scroll bar and select a continent" do
		@session.find_by_id("continents").click
		@session.find(:select, 'continents').first(:option, 'Africa').select_option
		

	end

	it "should search through selenium commands" do
		@session.find_by_id('selenium_commands').click
		@session.find(:select, 'selenium_commands').first(:option, 'Wait Commands').select_option

	end

	it "should click the submit button" do
		@session.find_by_id('submit').click
	end

end
	

	
