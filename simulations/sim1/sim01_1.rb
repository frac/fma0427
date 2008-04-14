#!/usr/bin/ruby
#
def get_rand
	return rand()
end

MAX_COUNT = 100000
inside = 0

(0..MAX_COUNT).each {|i|
	x = get_rand
	y = get_rand
	if (x * x + y * y) <= 1
		inside += 1
        end 
}

p 4.0 * inside/MAX_COUNT

