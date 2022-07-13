describe('Selenium 4 Element Screenshots') do
  it('Takes screenshots of images') do
    @driver.navigate.to 'https://front.serverest.dev/login'
    logo_serverest = @driver.find_element(css: 'img[src*="serverestlogo"]')
    logo_serverest.save_screenshot("reports/logo_serverest.png")
  end

  it('Takes screenshots of buttons') do
    @driver.navigate.to 'https://front.serverest.dev/login'
    btn_entrar = @driver.find_element(css: 'button[data-testid="entrar"]')
    btn_entrar.save_screenshot("reports/btn_entrar.png")
  end
end
