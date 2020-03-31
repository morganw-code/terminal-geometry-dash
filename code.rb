=begin

    my attempt at a little geometry dash game that runs in the terminal, side scrolling is new to me.
    when i write these i try not to look at solutions so my ideas are probably inefficient and not the way you would properly implement them, but i am learning.

=end

require 'colorize'

$put_at = { :player => { :x => [0, 1, 2, 3], :y => [16, 17, 18, 19] } }

$print_buffer = []
$print_cache = []

class Game

    attr_accessor :width, :height, :x, :y

    def initialize(width, height)
        @width = width
        @height = height
        @x = 0
        @y = 0
    end

    def run()
        while(true)
            draw_screen()
            sleep(0.1)
            system("clear") || system("cls")
            update_player_position()
        end
    end

    def update_player_position()
        if($put_at[:player][:x].any?(@width - 1))
            $put_at = { :player => { :x => [0, 1, 2, 3], :y => [16, 17, 18, 19] } }
        else
            $put_at[:player][:x] = $put_at[:player][:x].map { |pos|
                pos += 1
            }
        end
    end

    def draw_screen()
        # y
        while(@y < @height)
            # loop for printing horizontal line x
            while(@x < @width)
                    if($put_at[:player][:x].any?(@x) && $put_at[:player][:y].any?(@y))
                        $print_buffer.push("1".colorize(:white))
                    else
                        $print_buffer.push("0".colorize(:blue))
                    end
                @x += 1
            end

            self.print()

            @x = 0
            @y += 1
        end

        @y = 0
    end

    def print()
        $stdout.print("#{$print_buffer.join(' ')}\n")
        $print_cache.push($print_buffer)
        $print_buffer.clear()
    end

    def cleanup()
        $print_buffer.clear()
        $print_cache.clear()
    end
end

game = Game.new(100, 20)
game.run()