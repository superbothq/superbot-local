# frozen_string_literal: true

module Superbot
  module Local
    STEP_EDITOR_URL = "https://loving-golick-30e340.netlify.com/?saveStepUrl=http://localhost:4567/__superbot/v1/convert"
    private_constant :STEP_EDITOR_URL

    def self.step_editor_url
      STEP_EDITOR_URL
    end
  end
end

require_relative 'local/version'
require_relative 'local/cli'
