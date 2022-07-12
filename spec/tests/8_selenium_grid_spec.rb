describe('Selenium 4 Grid') do
  before(:each) do
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("goog:chromeOptions" => {"args" => ["--headless"]})
    @driver = Selenium::WebDriver.for(:remote,
      :url => "http://localhost:4444/wd/hub",
      :capabilities => caps)
  end

  after(:each) do
    @driver.quit
  end

  it('Runs on Selenium Grid') do
    @driver.navigate.to "http://google.com"
    expect(@driver.title).to eql "Google"
  end
end
