class Employee
    attr_accessor :name, :title
    def initialize(name, title)
        @name, @title = name, title
        @earnings = 0
    end

    def pay(amount)
        @earnings += amount
    end

end
