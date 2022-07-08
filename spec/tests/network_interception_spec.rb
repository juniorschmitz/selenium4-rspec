describe('Selenium 4 Network Interception') do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:each) do
    @driver.quit
  end

  it('Stubs Compass Logo') do
    @driver.intercept do |request, &continue|
      if request.url.match?(/\logo.svg$/)
        request.url = 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Selenium_Logo.png'
      end
      continue.call(request)
    end
    @driver.navigate.to 'https://compass.uol'
  end

  it('Stubs DuckDuckGo Logo') do
    @driver.intercept do |request, &continue|
      if request.url.match?(/\.svg$/)
        request.url = 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Selenium_Logo.png'
      end
      continue.call(request)
    end
    @driver.navigate.to 'https://duckduckgo.com'
  end
end