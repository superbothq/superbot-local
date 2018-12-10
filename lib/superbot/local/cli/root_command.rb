# frozen_string_literal: true

require_relative 'version_command'
require_relative 'easy_mode_command'

module Superbot
  module Local
    module CLI
      class RootCommand < Clamp::Command
        subcommand ['version'], "Superbot local version", VersionCommand
        subcommand ['easymode'], "Superbot UI test constructor", EasyModeCommand

        def self.run
          super
        rescue StandardError => exc
          warn exc.message
          warn exc.backtrace.join("\n")
        end
      end
    end
  end
end
