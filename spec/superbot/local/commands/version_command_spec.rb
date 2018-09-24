RSpec.describe Superbot::CLI::Local::VersionCommand do
  before { @k = superbot_local "version" }

  describe "stdout" do
    it do
      expect(@k.out).to include "#{Superbot::Local::VERSION}\r\n"
    end
  end
end
