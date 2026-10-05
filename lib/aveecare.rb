# frozen_string_literal: true

require_relative "aveecare/version"
require_relative "aveecare/errors"
require_relative "aveecare/not_given"
require_relative "aveecare/retry"
require_relative "aveecare/model"
require_relative "aveecare/page"
require_relative "aveecare/resource"
require_relative "aveecare/generated/models"
require_relative "aveecare/generated/resources"
require_relative "aveecare/client"

# The official Ruby library for the AveeCare API (https://www.aveecare.com/docs/api).
#
#   client = Aveecare::Client.new(api_key: ENV.fetch("AVEECARE_API_KEY"))
#   client.patients.list(limit: 25).each { |patient| puts patient.id }
module Aveecare
end
