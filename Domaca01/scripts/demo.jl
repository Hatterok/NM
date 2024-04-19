using Main.Domaca01

# Uporaba knjižnic LinearAlgebra in Plots
using LinearAlgebra, Plots

# Primer razpršene matrike
A = [ -2.0 1.0 1.0 0.0 0.0 0.0;
      1.0 -2.0 1.0 0.0 0.0 0.0;
      0.0 1.0 -2.0 1.0 0.0 0.0;
      0.0 1.0 0.0 -3.0 1.0 0.0;
      0.0 0.0 0.0 1.0 -2.0 1.0;
      0.0 0.0 0.0 1.0 1.0 -2.0;
]

# Zapis v strukturi RazpršenaMatrika
B = RazpršenaMatrika(
    [   -2.0 1.0 1.0;
        1.0 -2.0 1.0;
        1.0 -2.0 1.0;
        1.0 -3.0 1.0;
        1.0 -2.0 1.0;
        1.0 1.0 -2.0;
    ],

    [   1 2 3;
        1 2 3;
        2 3 4;
        2 4 5;
        4 5 6;
        4 5 6;
    ]
)

# Vozlišče 1:(1,0,0)
# Vozlišče 2:(0,1,0)
b = [   1.0, 0.0, 0.0,
        0.0, 1.0, 0.0
]

# Začetni približek
x0 = ones(6) * 1.0

# Toleranca
tol = 1e-10

#  relaksacijski parameter
w = 1.3

# Preverba konvergence
LastnaVrednost = LastneVrednosti(A, w)

# SOR iteracija
xn, korak = sor(B,b,x0,w,tol)

# Odvisnost konvergence od relaksacijskega parametra
OdvisnostW(B, b, x0, tol)

# Preverba rezultata
Base.product(B,xn)-b
A*xn-b