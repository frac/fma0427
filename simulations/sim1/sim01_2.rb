#!/usr/bin/ruby
#

def get_qsi
	saida = -1.0
  	if rand() >= 0.5
		saida = 1.0
	end
	return saida
end

TAU    = 0.01
GAMMA  = 1.0
LAMBDA = 1.0

TEMPO_GRANDE = 100
MAX_COUNT = 100000
INTERVALOS = 100

saida = {}
keys  = []
(0..MAX_COUNT).each {

	v = 0.0

	(0..TEMPO_GRANDE).each{|i|
		v = v + TAU * ( - GAMMA * v) + get_qsi * Math::sqrt(TAU * LAMBDA) 

	}
	p "#{v} em #{ TEMPO_GRANDE * TAU }s"	
	disc = ( v * INTERVALOS ).to_i
        keys << disc
	saida[disc] = (saida[disc] || 0) + 1


}
keys.sort!
keys.uniq!
p keys
(keys[0]..keys[keys.size-1]).each{|faixa|
	p "#{1.0 * faixa/INTERVALOS}, #{saida[faixa] || 0}"
}

