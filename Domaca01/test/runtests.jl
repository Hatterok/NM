using Test, Domaca01

@testset "SOR" begin
    B = RazpršenaMatrika(
        [-2.0 1.0 1.0;
            1.0 -2.0 1.0;
            1.0 -2.0 1.0;
            1.0 -3.0 1.0;
            1.0 -2.0 1.0;
            1.0 1.0 -2.0
        ], [1 2 3;
            1 2 3;
            2 3 4;
            2 4 5;
            4 5 6;
            4 5 6
        ]
    )
    b = [1.0, 0.0, 0.0,
        0.0, 1.0, 0.0
    ]
    x0 = ones(6) * 1.0
    tol = 1e-10
    w = 1.3

    xn, korak = sor(B, b, x0, w, tol)

    x2 = Base.product(B, xn) - b

    @test isapprox(x2, zeros(length(x2)), atol=1e-8)

end