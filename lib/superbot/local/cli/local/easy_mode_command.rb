# frozen_string_literal: true

require 'selenium-webdriver'

module Superbot
  module CLI
    module Local
      class EasyModeCommand < Clamp::Command
        def execute
          web = Superbot::Web.new
          web.run_async_after_running!

          puts "🤖 active"
          puts ""
          puts "Press enter to exit"

          open_step_editor

          $stdin.gets

          close_step_editor
        end

        private

        def open_step_editor
          options = Selenium::WebDriver::Chrome::Options.new
          options.add_argument("app=#{Superbot::Local::STEP_EDITOR_URL}")
          @step_editor = Selenium::WebDriver.for :chrome, options: options
        end

        def close_step_editor
          @step_editor.quit
        end
      end
    end
  end
end
