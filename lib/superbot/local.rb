# frozen_string_literal: true

module Superbot
  module Local
    STEP_EDITOR_URL = "https://loving-golick-30e340.netlify.com/?saveStepUrl=http://localhost:4567/__superbot/v1/convert"
  end
end

require_relative 'local/version'
require_relative 'local/cli'
