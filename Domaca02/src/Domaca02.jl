module Domaca02

"""
    adaptivno Simpsonovo pravilo 
    Racunanje vrednosti dolocenega integrala
    Podatki:
            f           zvezna funkcija
            a                       zacetna tocka intervala
            b                       koncna tocka intervala
            epsilon zahtevana natancnost rezultata
Rezultat:
            S               priblizek za vrednost integrala
            Nev             stevilo izracunov funkcijskih vrednosti
            err               ocena napake priblizka
"""

function simpsonovoadaptivno(f, a, b, epsilon)
    fa = f(a)
    fb = f(b)
    h = (b - a)
    c = (a + b) / 2
    fc = f(c)
    d = (a + c) / 2
    fd = f(d)
    e = (c + b) / 2
    fe = f(e)

    S1 = h / 6 * (fa + 4 * fc + fb)
    S2 = h / 12 * (fa + 4 * fd + 2 * fc + 4 * fe + fb)

    err = abs(S2 - S1) / 15
    if err < epsilon
        S = S2 + (S2 - S1) / 15
        Nev = 5
        return S, Nev, err
    else
        S11, Nev1, err1 = simpsonovoadaptivno(f, a, c, epsilon / 2)
        S21, Nev2, err2 = simpsonovoadaptivno(f, c, b, epsilon / 2)
        S = S11 + S21
        Nev = Nev1 + Nev2
        err = err1 + err2
        return S, Nev, err
    end
end

function Domaca02_1(f, a, b, epsilon)
    fa = f(a)
    fb = f(b)
    h = (b - a)
    c = (a + b) / 2
    fc = f(c)

    d = (a + c) / 2
    fd = f(d)
    e = (c + b) / 2
    fe = f(e)


    S1 = h / 6 * (fa + 4 * fc + fb)
    S2 = h / 12 * (fa + 4 * fd + 2 * fc + 4 * fe + fb)

    err = abs(S2 - S1) / 15
    if err < epsilon
        S = S2 + (S2 - S1) / 15
        Nev = 5
    else
        S11, Nev1, err1 = simpsonovoadaptivno(f, a, c, epsilon / 2)
        S21, Nev2, err2 = simpsonovoadaptivno(f, c, b, epsilon / 2)
        S = S11 + S21
        Nev = Nev1 + Nev2
        err = err1 + err2
    end

    return S, Nev, err
end

#--------------------------------------------------------------------------------------------#
#-------------------------------------2.-NALOGA----------------------------------------------#
#--------------------------------------------------------------------------------------------#

"""
    Gauss-Legendrov kvadrature
    Racunanje vrednosti dolocenega integrala
    Podatki:
            f           zvezna funkcija
            a                       zacetna tocka intervala
            b                       koncna tocka intervala
            natancnost zahtevana natancnost rezultata
Rezultat:
            priblizek               priblizek za vrednost integrala
            n             stevilo korakov
"""

function gausslegendre2point(f, a, b, n)
    # Koreni in uteži za Gauss-Legendreovo pravilo z dvema točkama
    x1, x2 = -1 / sqrt(3), 1 / sqrt(3)
    w1, w2 = 1, 1

    # Dolžina podintervala
    h = (b - a) / n

    integral = 0.0
    for i in 0:(n-1)
        # Meje trenutnega podintervala
        a_i = a + i * h
        b_i = a + (i + 1) * h

        # Transformacija korenov za trenutni podinterval
        t1 = 0.5 * (a_i + b_i + h * x1)
        t2 = 0.5 * (a_i + b_i + h * x2)

        # Preračun uteži
        integral += 0.5 * h * (w1 * f(t1) + w2 * f(t2))
    end

    return integral
end


function Domaca02_2(integrand, a, b, natancnost)
    # Začetno število podintervalov
    n = 1
    i = 1
    priblizek = gausslegendre2point(integrand, a, b, n)

    # Povečujemo število podintervalov dokler ne dosežemo željene natančnosti
    while true
        n *= 2
        i = i + 1
        nov_priblizek = gausslegendre2point(integrand, a, b, n)
        if abs(nov_priblizek - priblizek) < natancnost
            priblizek = nov_priblizek
            break
        end
        priblizek = nov_priblizek
    end

    return priblizek, i
end

export simpsonovoadaptivno, gausslegendre2point, Domaca02_1, Domaca02_2

end