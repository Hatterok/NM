using Test, Main.Domaca02, QuadGK

@testset "Porazdelitvena funkcija normalne slucajne spremenljivke" begin

    # funkcija za integracijo
    function f(x)
        1 / (sqrt(2π)) * exp(-(x^2) / 2)
    end

    f(x) = 1 / (sqrt(2π)) * exp(-(x^2) / 2)

    # vhodni parametri
    a_ = -9000 # zelo slab priblizek za -neskoncno, saj funkcija quadgk vrne error za -Inf
    a = -9999999999 # Priblizek za -neskoncno
    b = 0.3
    epsilon = 1e-7

    # klic nase funkcije
    S, Nev, err = Domaca02_1(f, a, b, epsilon)

    # klic vgrajene funkcije quadgk
    result, error = quadgk(f, a_, b)

    #test
    @test isapprox(S, result, atol=1e-9)

    # vhodni parametri
    b = 0.1

    # klic nase funkcije
    S, Nev, err = Domaca02_1(f, a, b, epsilon)

    # klic vgrajene funkcije quadgk
    result, error = quadgk(f, a_, b)

    #test
    @test isapprox(S, result, atol=1e-9)

    # vhodni parametri
    b = 0.69

    # klic nase funkcije
    S, Nev, err = Domaca02_1(f, a, b, epsilon)

    # klic vgrajene funkcije quadgk
    result, error = quadgk(f, a_, b)

    #test
    @test isapprox(S, result, atol=1e-9)
end

#--------------------------------------------------------------------------------------------#
#-------------------------------------2.-NALOGA----------------------------------------------#
#--------------------------------------------------------------------------------------------#

@testset "Gauss-Legendrove kvadrature" begin

    # funkcija za integracijo
    function integrand(x)
        sin(x) / x
    end

    f(x) = sin(x) / x

    # vhodni parametri
    a, b = 0.0, 5.0
    zeljena_natancnost = 1e-10

    # klic nase funkcije
    priblizek, koraki = Domaca02_2(integrand, a, b, zeljena_natancnost)

    # klic vgrajene funkcije quadgk
    result, error = quadgk(f, a, b)

    # test
    @test isapprox(priblizek, result, atol=1e-11)
end