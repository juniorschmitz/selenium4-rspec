describe('Selenium 4 Works') do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:each) do
    @driver.quit
  end

   it('Navigates to Google') do
    @driver.navigate.to "http://google.com"
    expect(@driver.title).to eql "Google"
  end
end