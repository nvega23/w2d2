class Room
    attr_accessor :capacity, :occupants
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if @occupants.length < @capacity
            return false
        else
            return true
        end
    end

    def available_space
        return @capacity - @occupants.length
    end

    def add_occupant(person)
        if !self.full?
            @occupants << person
            return true
        else
            return false
        end
    end

end
