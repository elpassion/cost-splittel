require "uuid"

macro define_entity_id(name)
  struct {{name}}
    getter id : UUID

    def self.generate
      new(UUID.random)
    end

    def initialize(@id : UUID)
    end
  end
end
