describe('Selenium 4 Relative Locators') do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:each) do
    @driver.quit
  end

  it('Finds by relative locator') do
    @driver.navigate.to "https://compass.uol"
    a_header_careers = @driver.find_element(css: ".Menu_menu__Orucn a[href*='/careers/']")
    a_lets_talk = @driver.find_element(relative: { tag_name: "a", right: a_header_careers })
    a_our_work = @driver.find_element(relative: { tag_name: "a", left: a_header_careers })
    img_logo = @driver.find_element(relative: { tag_name: "img", left: a_header_careers })
    expect(a_lets_talk.text).to eql "Let's talk"
    expect(a_our_work.text).to eql "Our work"
    expect(img_logo[:src]).to eql "https://compass.uol/triangle.svg"
  end
end