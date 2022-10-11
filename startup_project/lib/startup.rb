require "employee"

class Startup
    attr_accessor :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(startup)
        if self.funding > startup.funding
            return true
        else
            return false
        end
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        money_owed = @salaries[employee.title]
        if @funding >= money_owed
            employee.pay(money_owed)
            @funding -= money_owed
        else
            raise 'not enough funding '
        end
    end

    def payday
        @employees.each do |ele|
            pay_employee(ele)
        end
    end

    def average_salary
        summed = 0
        @employees.each do |ele|
            summed += @salaries[ele.title]
        end
        summed / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
                @salaries[title] = amount
            end
        end
        @employees += startup.employees
        startup.close()
    end

end
