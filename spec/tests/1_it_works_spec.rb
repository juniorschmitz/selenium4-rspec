describe('Selenium 4 Works') do
   it('Navigates to Google') do
    @driver.navigate.to "http://google.com"
    expect(@driver.title).to eql "Google"
  end
end