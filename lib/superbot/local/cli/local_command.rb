# frozen_string_literal: true

require_relative 'local/version_command'
require_relative 'local/run_command'
require_relative 'local/easy_mode_command'

module Superbot
  module CLI
    class LocalCommand < Clamp::Command
      subcommand ['run'], "Run tests from local directory", Local::RunCommand
      subcommand ['version'], "Superbot local version", Local::VersionCommand
      subcommand ['easymode'], "Superbot UI test constructor", Local::EasyModeCommand

      def self.run
        super
      rescue StandardError => exc
        warn exc.message
        warn exc.backtrace.join("\n")
      end
    end
  end
end
