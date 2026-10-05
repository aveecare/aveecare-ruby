# frozen_string_literal: true

module Aveecare
  # Sentinel for "argument not passed", distinct from an explicit +nil+.
  #
  # On update calls, +client.patients.update(id, email: nil)+ sends
  # <tt>"email": null</tt> and clears the field, while leaving +email+ out does
  # not send it at all.
  module NotGiven
    def self.inspect
      "Aveecare::NOT_GIVEN"
    end

    def self.to_s
      inspect
    end
  end

  NOT_GIVEN = NotGiven
end
