class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    def self.random_word
        DICTIONARY.sample
    end
    attr_accessor :guess_word, :attempted_chars, :remaining_incorrect_guesses
    def initialize
        @secret_word = Hangman.random_word
        @guess_word = Array.new(@secret_word.length, "_")
        @attempted_chars = []
        @remaining_incorrect_guesses = 5
    end

    def already_attempted?(char)
        if @attempted_chars.include?(char)
            return true
        else
            return false
        end
    end

    def get_matching_indices(char)
        return [] if !@secret_word.include?(char)
        output = []
        @secret_word.each_char.with_index do |ele, i|
            if char == ele
                output << i
            end
        end
        output
    end

    def fill_indices(char, arr)
        arr.each do |index|
            @guess_word[index] = char
        end
    end

    def try_guess(char)
        if self.already_attempted?(char)
            p 'that has already been attempted'
            return false
        end
        @attempted_chars << char
        matching = self.get_matching_indices(char)
        self.fill_indices(char, matching)
        @remaining_incorrect_guesses -= 1 if matching.empty?
        return true
    end

    def ask_user_for_guess
        print 'Enter a char: '
        user = gets.chomp
        return self.try_guess(user)
    end

    def win?
        if @guess_word.join('') == @secret_word
            p 'WIN '
            return true
        else
            return false
        end
    end

    def lose?
        if @remaining_incorrect_guesses == 0
            print 'LOSE'
            return true
        else
            return false
        end
    end

    def game_over?
        if win? or lose?
            p @secret_word
            return true
        else
            return false
        end
    end

end
