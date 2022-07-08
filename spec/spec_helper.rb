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
end

# https://www.selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/DriverExtensions/HasNetworkInterception.html
# https://www.selenium.dev/pt-br/documentation/webdriver/bidirectional/bidi_api/