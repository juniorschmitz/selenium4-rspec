require "selenium-webdriver"
require "rspec"
require "pry"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  config.after(:each) do
    @driver.quit
  end  
end

