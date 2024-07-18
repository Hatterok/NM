module Domaca03

"""
    Runge-Kutta cetrtega reda
    Reseveanje DE
    Podatki:
            f           zvezna funkcija
            x           neodvisna spremeljivka
            y           odvisna spremenljivka
            h           dolžina koraka
Rezultat:
            y           nova vrednost odvisne spremenljivke
"""

function rungeKutta(f, x, y, h)
    k1 = h * f(x, y)
    k2 = h * f(x + h / 2, y + k1 / 2)
    k3 = h * f(x + h / 2, y + k2 / 2)
    k4 = h * f(x + h, y + k3)
    return y + (k1 + 2k2 + 2k3 + k4) / 6
end

"""
    nihalo
    Podatki:
            l           dolzina nihala
            t           cas
            theta0      zacetni odmik
            dtheta0     zacetna kotna hitrost
            n           stevilo podintervalov
Rezultat:
            theta       odmik nihala v radianih
"""

function nihalo(l, t, theta0, dtheta0, n)
    g = 9.80665
    h = t / n

    f(x, y) = [y[2], -(g / l) * sin(y[1])]

    y = [theta0, dtheta0]
    for i in 1:n
        y = rungeKutta(f, i * h, y, h)
    end

    return y[1]
end

"""
    harmonicniOscilator
    Podatki:
            l               dolzina nihala
            t               cas
            theta0          zacetni odmik
            dtheta0         zacetna kotna hitrost
            n               stevilo podintervalov
Rezultat:
            thetaHarmonic   odmik nihala v radianih
"""

function harmonicniOscilator(l, t, theta0, dtheta0, n)
    g = 9.80665
    omega = sqrt(g / l)
    A = sqrt(theta0^2 + (dtheta0 / omega)^2)
    phi = atan(dtheta0 / (omega * theta0))

    thetaHarmonic = A * cos(omega * t + phi)
    return thetaHarmonic
end

"""
    nihajniCas
    Podatki:
            l           dolzina nihala
            theta0      zacetni odmik
Rezultat:
            t           nihajni cas
"""

function nihajniCas(theta0, l)
    g = 9.80665
    T = 2 * pi * sqrt(l / g) * (1 + (1 / 16) * theta0^2 + (11 / 3072) * theta0^4)
    return T
end


export Domaca03, nihalo, rungeKutta, harmonicniOscilator, nihajniCas

end