# frozen_string_literal: true

require 'selenium-webdriver'

module Superbot
  module CLI
    module Local
      class EasyModeCommand < Clamp::Command
        def execute
          web = Superbot::Web.new(webdriver_endpoint: Superbot.webdriver_endpoint('local'))
          web.run_async_after_running!

          puts "🤖 active"
          puts ""
          puts "Press ENTER to exit"

          open_step_editor

          $stdin.gets

          web.capybara_runner.kill_session
          close_step_editor
        end

        private

        def open_step_editor
          options = Selenium::WebDriver::Chrome::Options.new
          options.add_argument("app=#{Superbot::Local.step_editor_url}")
          options.add_argument('no-sandbox')
          @step_editor = Selenium::WebDriver.for :chrome, options: options
        end

        def close_step_editor
          @step_editor.quit
        end
      end
    end
  end
end
