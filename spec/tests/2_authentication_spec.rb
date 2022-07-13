describe('Selenium 4 Authentication') do
  USERNAME = "admin"
  PASSWORD = "admin"
  
  it('Authenticates with Basic Authentication (old way)') do
    @driver.navigate.to "https://#{USERNAME}:#{PASSWORD}@the-internet.herokuapp.com/basic_auth"
    p_message_authenticated = @driver.find_element(css: ".example p")
    expect(p_message_authenticated.text).to eql 'Congratulations! You must have the proper credentials.'
  end

  it('Authenticates with Basic Authentication (new way)') do
    @driver.devtools.new
    @driver.register(username: USERNAME, password: PASSWORD)
    @driver.get "https://the-internet.herokuapp.com/basic_auth"
    p_message_authenticated = @driver.find_element(css: ".example p")
    expect(p_message_authenticated.text).to eql 'Congratulations! You must have the proper credentials.'
  end

  it('Authenticates with Digest Authentication (old way)') do
    @driver.navigate.to "https://#{USERNAME}:#{PASSWORD}@the-internet.herokuapp.com/digest_auth"
    p_message_authenticated = @driver.find_element(css: ".example p")
    expect(p_message_authenticated.text).to eql 'Congratulations! You must have the proper credentials.'
  end

  it('Authenticates with basic auth (new way)') do
    @driver.devtools.new
    @driver.register(username: USERNAME, password: PASSWORD)
    @driver.get "https://the-internet.herokuapp.com/digest_auth"
    p_message_authenticated = @driver.find_element(css: ".example p")
    expect(p_message_authenticated.text).to eql 'Congratulations! You must have the proper credentials.'
  end
end
