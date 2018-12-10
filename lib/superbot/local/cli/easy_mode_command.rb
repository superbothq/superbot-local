# frozen_string_literal: true

require 'selenium-webdriver'

module Superbot
  module Local
    module CLI
      class EasyModeCommand < Clamp::Command
        def execute
          puts "Press [control+c] to exit"
          open_step_editor
          run_converter
          Superbot::Web.run!(webdriver_type: 'local')
        ensure
          close_step_editor
        end

        private

        def open_step_editor
          options = ::Selenium::WebDriver::Chrome::Options.new
          options.add_argument("app=#{Superbot::Local.step_editor_url}")
          options.add_argument('no-sandbox')
          @step_editor = ::Selenium::WebDriver.for :chrome, options: options
        end

        def close_step_editor
          @step_editor&.quit
          @chromedriver&.kill
        end

        def run_converter
          chromedriver_path = Chromedriver::Helper.new.binary_path
          @chromedriver = Kommando.run_async "#{chromedriver_path} --silent --port=9515 --url-base=wd/hub"
        end
      end
    end
  end
end
