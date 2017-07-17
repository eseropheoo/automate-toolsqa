require 'capybara'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation

end

Capybara.register_driver :chrome do |web|
  Capybara::Selenium::Driver.new(web, :browser => :chrome)
end