# frozen_string_literal: true

require_relative 'local_command'

module Superbot
  module CLI
    class RootCommand < Clamp::Command
      subcommand ['local'], "Show local commands", LocalCommand
    end
  end
end
