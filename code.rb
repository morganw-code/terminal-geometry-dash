=begin

    my attempt at a little geometry dash game that runs in the terminal, side scrolling is new to me.
    when i write these i try not to look at solutions so my ideas are probably inefficient and not the way you would properly implement them, but i am learning.

=end

$put_at = { :player => { :x => 0, :y => 0 } }

$print_buffer = []
$print_cache = []

class Game

    attr_accessor :width, :height, :line_count, :items_in_buffer

    def initialize(width, height)
        @width = width
        @height = height
        @line_count = 0
        @items_in_buffer = 0
    end

    def draw_screen()
        # y
        while(@line_count < @height)
            # loop for printing horizontal line x
            node_count = 0
            while(@items_in_buffer < @width)
                $print_buffer.push("0")
                node_count += 1
                @items_in_buffer += 1
            end

            self.print()

            @items_in_buffer = 0
            @line_count += 1
        end
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
game.draw_screen()