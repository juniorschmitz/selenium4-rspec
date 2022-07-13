describe('Selenium 4 Relative Locators') do
  it('Finds by relative locator to the right') do
    @driver.navigate.to "https://compass.uol"
    a_header_careers = @driver.find_element(css: '.Menu_menu__Orucn a[href*="/careers/"]')
    a_lets_talk = @driver.find_element(relative: { tag_name: "a", right: a_header_careers })
    expect(a_lets_talk.text).to eql "Let's talk"
  end

  it('Finds by relative locator to the left') do
    @driver.navigate.to "https://compass.uol"
    a_header_careers = @driver.find_element(css: '.Menu_menu__Orucn a[href*="/careers/"]')
    a_our_work = @driver.find_element(relative: { tag_name: "a", left: a_header_careers })
    img_logo = @driver.find_element(relative: { tag_name: "img", left: a_header_careers })
    expect(a_our_work.text).to eql "Our work"
    expect(img_logo[:src]).to eql "https://compass.uol/triangle.svg"
  end

  it('Finds by relative locator above') do
    @driver.navigate.to "https://www.jenkins.io/artwork"
    img_atomium = @driver.find_element(css: 'img[alt="Atomium"]')
    img_actor = @driver.find_element(relative: { tag_name: "img", above: img_atomium })
    expect(img_actor[:src]).to include 'actor'
  end

  it('Finds by relative locator below') do
    @driver.navigate.to "https://www.jenkins.io/artwork"
    img_atomium = @driver.find_element(css: 'img[alt="Atomium"]')
    img_balloon = @driver.find_element(relative: { tag_name: "img", below: img_atomium })
    expect(img_balloon[:src]).to include 'balloon'
  end
end