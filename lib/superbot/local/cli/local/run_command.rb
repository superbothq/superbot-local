# frozen_string_literal: true

module Superbot
  module CLI
    module Local
      class RunCommand < Clamp::Command
        include Superbot::Validations

        parameter "PATH", "project directory" do |path|
          validates_project_path path
        end

        def execute
          script = File.read(File.join(path, 'main.rb'))
          Superbot::Capybara::Runner.run(script)
        end
      end
    end
  end
end
