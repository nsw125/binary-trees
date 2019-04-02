class GameBoard

    attr_accessor :location
    def initialize(location)
        @location = location
    end

end



class Knight

    class Move

        attr_accessor :location, :last_position
        def initialize(location, last_position = nil)
            @location = location
            @last_position = last_position
        end

    end

    attr_accessor :start
    def initialize(start)
        @start = start
        @move_options = [ [2,1], [1,2], [-1,2], [-2, 1], [-1,-2], [-2,-1], [2,-1], [1,-2] ]
    end

    def knight_moves(start, target)
        start = Move.new(start)
        search_queue = []
        search_queue << start
        puts "Starting here! #{start.location}"
        puts "Our target [#{target.location.join(', ')}]"
        result_found = false
        until result_found == true
            current_move = search_queue.shift
            if current_move.location == target.location
                puts "The quickest way we found is:"
                turn_log = []
                until current_move.last_position == nil
                    turn_log << current_move
                    current_move = current_move.last_position
                end
                turn_log << current_move
                turn_counter = 0
                until turn_log[0] == nil
                    move = turn_log.pop
                    puts "Turn #{turn_counter}: [#{move.location.join(', ')}]"
                    turn_counter += 1
                end
                result_found = true
            else
                last_position = current_move.location
                @move_options.each do |move|
                    new_position = []
                    new_position << move[0] + last_position[0]
                    new_position << move[1] + last_position[1]
                    if (new_position[0] >= 1 and new_position[0] <= 8) and (new_position[1] >= 1 and new_position[1] <= 8)
                        new_move = Move.new(new_position, current_move)
                        search_queue << new_move
                    end
                end
            end
        end
    end

end

knight = Knight.new([2,1])
target = GameBoard.new([2,2])
knight.knight_moves(knight.start, target)
