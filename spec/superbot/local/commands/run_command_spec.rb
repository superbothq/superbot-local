require "spec_helper"

RSpec.describe Superbot::CLI::Local::RunCommand do
  describe "success" do
    around do |example|
      FileUtils.rm_r superbot_test_path if Dir.exist? superbot_test_path
      example.call
      FileUtils.rm_r superbot_test_path if Dir.exist? superbot_test_path
    end

    it do
      superbot "new", superbot_test_path
      expect(Superbot::Capybara::Runner).to receive(:run).with("visit \"http://example.com\"\n")

      command = described_class.new(superbot_test_path)
      command.path = superbot_test_path
      command.execute
    end
  end
end
