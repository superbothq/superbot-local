# frozen_string_literal: true

require 'selenium-webdriver'
require 'superbot/cli/teleport_command'

module Superbot
  module CLI
    module Local
      class EasyModeCommand < Clamp::Command
        def execute
          open_step_editor
          open_teleport

          puts "Press ENTER to exit"

          $stdin.gets

        ensure
          close_step_editor
          close_teleport
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

        def open_teleport
          @teleport = Thread.new do
            Superbot::CLI::TeleportCommand.run(nil, [], context)
          end
        end

        def close_teleport
          @teleport.kill
        end
      end
    end
  end
end
