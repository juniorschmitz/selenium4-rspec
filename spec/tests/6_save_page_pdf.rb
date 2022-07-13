describe('Selenium 4 Save Page to PDF') do
  IMAGE_BROKEN_1 = 'https://the-internet.herokuapp.com/asdf.jpg'
  IMAGE_BROKEN_2 = 'https://the-internet.herokuapp.com/hjkl.jpg'
  IMAGE_POTATO_HEAD = 'https://live.staticflickr.com/4058/4264780554_d35acd7e87_b.jpg'
  IMAGE_SELENIUM_LOGO = 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Selenium_Logo.png'
  
  before(:each) do
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("goog:chromeOptions" => {"args" => ["--headless"]})
    @driver = Selenium::WebDriver.for(:chrome,
      :capabilities => caps)
  end

  it('Saves page to PDF') do
    @driver.navigate.to 'https://en.wikipedia.org/wiki/Potato'
    @driver.save_print_page("reports/potato#{Time.now.to_i}.pdf")
  end
end
