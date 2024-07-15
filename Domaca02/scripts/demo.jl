using Main.Domaca02

# Funkcija za integracijo
function f(x)
    1 / (sqrt(2π)) * exp(-(x^2) / 2)
end

# Vhodni parametri
a = -9999999999 # Priblizek za -neskoncno
b = 0.69
epsilon = 1e-7

# Klic funkcije
S, Nev, err = Domaca02_1(f, a, b, epsilon)

println("Approksimacija: ", S)
println("Stevilo korakov: ", Nev)
println("Napaka: ", err)

#--------------------------------------------------------------------------------------------#
#-------------------------------------2.-NALOGA----------------------------------------------#
#--------------------------------------------------------------------------------------------#

# Funkcija za integracijo
function integrand(x)
    sin(x) / x
end

# Vhodni parametri
a, b = 0.0, 5.0
zeljena_natancnost = 1e-10

# Klic funkcije
priblizek, koraki = Domaca02_2(integrand, a, b, zeljena_natancnost)

println("Priblizek: ", priblizek)
println("Stevilo korakov: ", koraki)