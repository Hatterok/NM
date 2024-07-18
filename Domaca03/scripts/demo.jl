using Main.Domaca03, Plots

# Vhodni podatki
l = 1.0
theta0 = 0.2
dtheta0 = 0.0
t = 10.0
n = 1000

# Klic funkcije
odmik = nihalo(l, t, theta0, dtheta0, n)
println("Odmik nihala po casu $t s je $odmik radianov")

# Primer za harmonicni oscilator
odmikHarmonic = harmonicniOscilator(l, t, theta0, dtheta0, n)
println("Odmik harmonicnega nihala po casu $t s je $odmikHarmonic radianov")

# Priprava za izris grafa
energije = range(0.01, stop=1.0, length=100)
casNihanja = [nihajniCas(E, l) for E in energije]

# Izris grafa
plot(energije, casNihanja, xlabel="Zacetni kotni odmik (radiani)", ylabel="Nihajni cas (s)", title="Nihajni cas glede na zacetni kotni odmik", label="Matematicno nihalo")

