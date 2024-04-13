# module Domaca01c

using LinearAlgebra, Plots

# Definicija podatkovnega tipa RazpršenaMatrika
struct RazpršenaMatrika
  V::Matrix{Float64}
  I::Matrix{Int}
end

A = [ -2.0 1.0 1.0 0.0 0.0 0.0;
      1.0 -2.0 1.0 0.0 0.0 0.0;
      1.0 1.0 -2.0 0.0 0.0 0.0;
      0.0 0.0 0.0 -2.0 1.0 1.0;
      0.0 0.0 0.0 1.0 -2.0 1.0;
      0.0 0.0 0.0 1.0 1.0 -2.0;
]

B = RazpršenaMatrika(

[ -2.0 1.0 1.0;
  1.0 -2.0 1.0;
  1.0 1.0 -2.0;
  -2.0 1.0 1.0;
  1.0 -2.0 1.0;
  1.0 1.0 -2.0;
],

[ 1 2 3;
  1 2 3;
  1 2 3;
  4 5 6;
  4 5 6;
  4 5 6;
]
)


  #Vozlišče 1:(1,0,0)
  #Vozlišče 2:(0,1,0)


b = [1.0, 0.0, 0.0,
     0.0, 1.0, 0.0
     ]

x0 = ones(6) * 1.0

tol = 1e-10
"""

A = [ 6.0 -2.0  0.0  0.0;
-2.0  7.0 -3.0  0.0;
0.0 -3.0  8.0 -4.0;
0.0  0.0 -4.0  9.0]

B = RazpršenaMatrika(
[
6.0 -2.0 0.0;
-2.0 7.0 -3.0;
-3.0 8.0 -4.0;
-4.0 9.0 0.0],
[
1 2 0;
1 2 3;
2 3 4;
3 4 0;]
)

x0 = ones(4) * 0.5
b = ones(4) * 1.0
tol = 1e-10
"""
# Indeksiranje
function Base.getindex(A::RazpršenaMatrika, i, j)
  return A.V[i, j]
end

function Base.setindex!(A::RazpršenaMatrika, value, i, j)
  A.V[i, j] = value
end

function Base.firstindex(A::RazpršenaMatrika)
  return 1, 1
end

function Base.lastindex(A::RazpršenaMatrika)
  return size(A.V)
end

# Množenje z desne z vektorjem
function Base.product(A::RazpršenaMatrika, b::Vector{Float64})
  fii, fij = Base.firstindex(A::RazpršenaMatrika)
  lii, lij = Base.lastindex(A::RazpršenaMatrika)
  x = zeros(lii)
  for i in fii:lii
    for j in fij:lij
      if A.I[i,j] != 0
        x[i] += A.V[i,j] * b[A.I[i,j]]
      end
    end
  end
  return x
end

#SOR
function sor(A::RazpršenaMatrika, b::Vector{Float64}, x1::Vector{Float64}, w, tol)
  xn=copy(x1)
  x1=Inf*xn
  fii, fij = Base.firstindex(A::RazpršenaMatrika)
  lii, lij = Base.lastindex(A::RazpršenaMatrika)
  diagonalniElement = 1
  korak = 0
  while norm(xn-x1, Inf) > tol 
    println(korak)
    x1 = copy(xn)
    for i in fii:lii
      vsota = 0
      for j in fij:lij
        if A.I[i,j] != 0
          if A.I[i,j] == i
            diagonalniElement = A.V[i,j]
          else
            vsota += A.V[i,j]*xn[A.I[i,j]]
          end
        end
      end
      xn[i]=(1-w)*xn[i] + (w/diagonalniElement)*(b[i]-vsota)
    end
    korak += 1
  end
  return xn, korak
end

W = LinRange(0.5, 1.5, 100)
K = similar(W)

S = size(W)
t = S[1]

for i in 1:t
    y, korak = sor(B,b,x0,W[i],tol)
    K[i] = korak
    println(i)
end

plot(W, K)

w = 0.9
x, korak = sor(B,b,x0,w,tol)
Base.product(B,x)-b
A*x-b

# end

