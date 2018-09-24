# frozen_string_literal: true

require_relative 'local/version_command'
require_relative 'local/run_command'

module Superbot
  module CLI
    class LocalCommand < Clamp::Command
      subcommand ['run'], "Run tests from local directory", Local::RunCommand
      subcommand ['version'], "Superbot local version", Local::VersionCommand

      def self.run
        super
      rescue StandardError => exc
        warn exc.message
        warn exc.backtrace.join("\n")
      end
    end
  end
end
