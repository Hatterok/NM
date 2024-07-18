using Test, Main.Domaca02, QuadGK

@testset "Porazdelitvena funkcija normalne slucajne spremenljivke" begin

    # Funkcija za integracijo
    function f(x)
        1 / (sqrt(2π)) * exp(-(x^2) / 2)
    end

    f(x) = 1 / (sqrt(2π)) * exp(-(x^2) / 2)

    # Vhodni parametri
    a_ = -9000 # zelo slab priblizek za -neskoncno, saj funkcija quadgk vrne error za -Inf
    a = -9999999999 # Priblizek za -neskoncno
    b = 0.3
    epsilon = 1e-7

    # Klic nase funkcije
    S, Nev, err = Domaca02_1(f, a, b, epsilon)

    # Klic vgrajene funkcije quadgk
    result, error = quadgk(f, a_, b)

    # Test
    @test isapprox(S, result, atol=1e-9)

    # Vhodni parametri
    b = 0.1

    # Klic nase funkcije
    S, Nev, err = Domaca02_1(f, a, b, epsilon)

    # Klic vgrajene funkcije quadgk
    result, error = quadgk(f, a_, b)

    # Test
    @test isapprox(S, result, atol=1e-9)

    # Vhodni parametri
    b = 0.69

    # Klic nase funkcije
    S, Nev, err = Domaca02_1(f, a, b, epsilon)

    # Klic vgrajene funkcije quadgk
    result, error = quadgk(f, a_, b)

    # Test

    @test isapprox(S, result, atol=1e-9)
end

#--------------------------------------------------------------------------------------------#
#-------------------------------------2.-NALOGA----------------------------------------------#
#--------------------------------------------------------------------------------------------#

@testset "Gauss-Legendrove kvadrature" begin

    # Funkcija za integracijo
    function integrand(x)
        sin(x) / x
    end

    f(x) = sin(x) / x

    # Vhodni parametri
    a, b = 0.0, 5.0
    zeljena_natancnost = 1e-10

    # Klic nase funkcije
    priblizek, koraki = Domaca02_2(integrand, a, b, zeljena_natancnost)

    # Klic vgrajene funkcije quadgk
    result, error = quadgk(f, a, b)

    # Test
    @test isapprox(priblizek, result, atol=1e-11)
end