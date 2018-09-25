require "spec_helper"

RSpec.describe Superbot::CLI::Local::RunCommand do
  describe "success" do
    around do |example|
      FileUtils.rm_r superbot_test_path if Dir.exist? superbot_test_path
      example.call
      FileUtils.rm_r superbot_test_path if Dir.exist? superbot_test_path
    end

    context "run test" do
      around do |example|
        FileUtils.rm_r superbot_test_path if Dir.exist? superbot_test_path
        example.call
        FileUtils.rm_r superbot_test_path if Dir.exist? superbot_test_path
      end

      context "when valid test script" do
        it "successfully runs capybara tests" do
          superbot("new", superbot_test_path).run
          File.open(File.join(superbot_test_path, 'main.rb'), 'a') do |file|
            file.write "page.driver.browser.close\n"
          end
          @k = superbot_local "run", superbot_test_path
          expect(@k.out).to include("Test succeed")
        end
      end

      context "when invalid test script" do
        it "returns an error message" do
          superbot("new", superbot_test_path).run
          File.open(File.join(superbot_test_path, 'main.rb'), 'a') do |file|
            file.truncate(0)
            file.write "invalid script"
          end
          @k = superbot_local "run", superbot_test_path
          expect(@k.out).to include("Test failed")
        end
      end
    end
  end
end
