require "../../common/money.cr"
require "../helpers/entity_id.cr"
require "../helpers/event.cr"
require "../helpers/aggregate_root.cr"
require "./cost.cr"
require "./participant.cr"


module Payments
  define_entity_id RegisterId

  class Register < AggregateRoot
    getter id : RegisterId

    def self.create
      new(RegisterId.generate)
    end

    @costs = [] of Cost
    @participants = [] of ParticipantId
    @open = true

    def initialize(@id : RegisterId)
    end

    def add_participant(participant : Participant)
      raise "register is closed" if closed?
      raise "participant already taking part" if taking_part?(participant)

      @participants << participant.id
    end

    def add_cost(amount : Money, payer : Participant)
      raise "register is closed" if closed?
      raise "participant is not taking part" unless taking_part?(payer)

      @costs << Cost.new(amount, payer.id)
    end

    def close
      return if closed?

      @open = false
      register_event(Event.new("PaymentsRegisterClosed"))
    end

    def closed?
      !@open
    end

    def taking_part?(participant)
      @participants.includes?(participant.id)
    end
  end
end
