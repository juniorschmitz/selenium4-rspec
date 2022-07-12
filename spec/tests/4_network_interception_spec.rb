describe('Selenium 4 Network Interception') do
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

  it('Logs all requests') do
    @driver.intercept do |request, &continue|
      puts "#{request.method} #{request.url}"
      continue.call(request)
    end
    @driver.navigate.to 'https://en.wikipedia.org/wiki/Potato'
  end

  it('Mutates requests') do
    @driver.intercept do |request, &continue|
      continue.call(request) do |response|
        response.body = 'Request foi mutada! :o' if request.url.include?('broken_images')
      end
    end

    @driver.navigate.to 'https://the-internet.herokuapp.com'
    @driver.find_element(css: 'a[href^="/broken_images"]').click

    expect(@driver.page_source).to include 'Request foi mutada! :o'
  end

  it('Stubs broken images') do
    @driver.intercept do |request, &continue|
      if request.url == IMAGE_BROKEN_1 || request.url == IMAGE_BROKEN_2
        request.url = IMAGE_POTATO_HEAD
      end
      continue.call(request)
    end
    @driver.navigate.to 'https://the-internet.herokuapp.com/broken_images'
    @driver.find_elements(css: '#content img').each do |element|
      expect(element.displayed?).to eql true
    end
  end

  it('Stubs Compass Logo') do
    @driver.intercept do |request, &continue|
      if request.url.match?(/\logo.svg$/)
        request.url = IMAGE_SELENIUM_LOGO
      end
      continue.call(request)
    end

    @driver.navigate.to 'https://compass.uol'

    logo = @driver.find_element(css: ".Header_logo__NvaF1 img")
    expect(logo.displayed?).to eql true
    expect(logo[:src]).to eql "https://compass.uol/logo.svg"
  end

  it('Stubs DuckDuckGo Logo') do
    @driver.intercept do |request, &continue|
      if request.url.match?(/\.svg$/)
        request.url = IMAGE_SELENIUM_LOGO
      end
      continue.call(request)
    end

    @driver.navigate.to 'https://duckduckgo.com'

    logo = @driver.find_element(id: "logo_homepage_link")
    expect(logo.displayed?).to eql true
  end
end
