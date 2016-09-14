require 'capybara'
require 'site_prism'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara/poltergeist'
require 'support/wait_for_ajax'
require 'support/authentication'

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Capybara configuration
Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, window_size: [1920, 1080], phantomjs_logger: IO::NULL,
                                           debug: false, default_wait_time: 30, timeout: 90,
                                           phantomjs_options: ['--ignore-ssl-errors=yes', '--local-to-remote-url-access=yes'],
                                           js_errors: false)
end

Capybara.current_driver = :selenium #:webkit #:selenium test (off/on)
Capybara.configure do |config|
    # config.default_driver = ENV['HEADLESS'] ? :poltergeist : :chrome # HEADLESS or :selenium
    config.app_host = ENV['REGRESSION_HOST']
    config.javascript_driver = :poltergeist
    config.run_server = false
    ignore_hidden_elements = true
end

RSpec.configure do |config|
    config.include Capybara::DSL, capybara_feature: true, js: true, type: :feature
    config.include WaitForAjax, type: :feature
    config.include Authentication
    config.after do
        Capybara.reset_sessions!
    end
end
