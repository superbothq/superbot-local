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
          Superbot::Capybara::Runner.new.tap do |runner|
            runner.run(script)

            loop do
              break if runner.finished

              sleep 0.001
            end

            runner.kill_session
          end
        end
      end
    end
  end
end
