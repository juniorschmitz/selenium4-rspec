describe('Selenium 4 Authentication') do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:each) do
    @driver.quit
  end

  it('Authenticates with basic auth (old way)') do
    @driver.navigate.to "https://admin:admin@the-internet.herokuapp.com/basic_auth"
    p_message_authenticated = @driver.find_element(css: ".example p")
    expect(p_message_authenticated.text).to eql 'Congratulations! You must have the proper credentials.'
  end

  it('Authenticates with basic auth (new way)') do
    @driver.devtools.new
    @driver.register(username: 'admin', password: 'admin')
    @driver.get "https://the-internet.herokuapp.com/basic_auth"
    p_message_authenticated = @driver.find_element(css: ".example p")
    expect(p_message_authenticated.text).to eql 'Congratulations! You must have the proper credentials.'
  end
end
