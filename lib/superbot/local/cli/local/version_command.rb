# frozen_string_literal: true

module Superbot
  module CLI
    module Local
      class VersionCommand < Clamp::Command
        def execute
          puts Superbot::Local::VERSION
        end
      end
    end
  end
end
