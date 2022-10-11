require_relative "room"

class Hotel

    def initialize(name, capacities)
        @name = name
        @rooms = {}
        capacities.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        @name.split(" ").map(&:capitalize).join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.include?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            p 'sorry, this room does not exist '
            if @rooms[room_name].add_occupant(room_name)
                p 'check in successful '
            else
                p 'sorry, room is full '
            end
        else
            p 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.values.any?{|room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |room, capacity|
            puts "#{room}: #{capacity.available_space}"
        end
    end

end
