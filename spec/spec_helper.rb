require "bundler/setup"
require "superbot"
require "superbot/local"
require "kommando"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def superbot_local(*cmds)
  Kommando.new("exe/superbot-local #{cmds.join(" ")}").tap { |k| k.run }
end

def superbot(*cmds)
  Kommando.new("superbot #{cmds.join(" ")}").tap { |k| k.run }
end

def superbot_test_path
  "__test_#{ENV['TEST_ENV_NUMBER'].to_i}"
end
