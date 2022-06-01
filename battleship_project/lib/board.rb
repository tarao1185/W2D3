class Board
attr_reader :size, :n

    def initialize(n)
        @grid = Array.new(n){Array.new(n,:N)}
        @size = n * n
    end

    def [](pos)
       @grid[pos[0]][pos[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        @grid.each do |subArr|
            subArr.each do |ele|
                count += 1 if ele == :S
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S 
           self[pos] = :H
           print "you sunk my battleship!" 
           return true
        end
        
        self[pos]= :X
        false
    end

    def place_random_ships
        length = Math.sqrt(@size).to_i

        until self.num_ships == @size / 4
        rand_pos = [rand(0...length),rand(0...length)]
        self[rand_pos] = :S
        end

    end

    def hidden_ships_grid
        @grid.map do |subArr|
            subArr.map do |ele|
                if ele == :S 
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(arr)    
        arr.each do |subArr|
            puts subArr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
