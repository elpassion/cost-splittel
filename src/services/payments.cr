require "../domain/payments/register"

class PaymentsRegisterRepository
  @registers = [] of Payments::Register

  def save(register : Payments::Register)
    result = find(register.id)
    if !result
      @registers << register
    end
  end

  def find(register_id : Payments::RegisterId)
    @registers.find { |i| i.id == register_id }
  end
end

module Services
  class Payments
    @repository : PaymentsRegisterRepository

    def initialize(@repository : PaymentsRegisterRepository)
    end

    def create
      register = Payments::Register.create
      @repository.save(register)
      register.id
    end

    def add_participant(register_id : UUID, participant_id : UUID)
      register = @repository.find(::Payments::RegisterId.new(register_id))
      if register
        register.add_participant(::Payments::ParticipantId.new(participant_id))
        @repository.save(register)
      end
    end

    def add_cost
    end

    def close
    end
  end
end
