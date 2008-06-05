#!/usr/bin/ruby
#
#Variavies globais N bolas, Passos por corrida e Numero de corridas
ENE      = 100
PASSOS   = 10000
CORRIDAS = 1000

resultado = []
mean    = 0.0
mean_sq = 0.0
(1..CORRIDAS).each {|i|
    #Preencho as urnas com as N bolas
    urna_a = (0..ENE-1).collect{|bola|bola}
    urna_b = []

    (1..PASSOS).each {|j|
        foo = rand(ENE)
        if urna_a.include?(foo)
            urna_a -= [foo]
            urna_b += [foo]
        else
            urna_a += [foo]
            urna_b -= [foo]
        end
    }
    resultado << urna_a.size
    mean += urna_a.size
    mean_sq += urna_a.size * urna_a.size

    variance = Math::sqrt((mean_sq/ resultado.size) - (mean/ resultado.size) * (mean/ resultado.size))

    p "this run #{urna_a.size} mean #{mean/ resultado.size} +- #{variance}"
}


