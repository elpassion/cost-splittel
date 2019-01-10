module Payments
  define_entity_id ParticipantId

  class Participant
    getter id

    def initialize(@id : ParticipantId)
    end
  end
end
