describe('Selenium 4 Change Windows and Tabs') do
  IMAGE_BROKEN_1 = 'https://the-internet.herokuapp.com/asdf.jpg'
  IMAGE_BROKEN_2 = 'https://the-internet.herokuapp.com/hjkl.jpg'
  IMAGE_POTATO_HEAD = 'https://live.staticflickr.com/4058/4264780554_d35acd7e87_b.jpg'
  IMAGE_SELENIUM_LOGO = 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Selenium_Logo.png'
  
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:each) do
    @driver.quit
  end

  it('Changes Windows') do
    @driver.navigate.to 'https://en.wikipedia.org/wiki/Potato'
  end

  it('Changes Tabs') do
    @driver.navigate.to 'https://en.wikipedia.org/wiki/Potato'
  end
end
