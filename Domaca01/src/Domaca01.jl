module Domaca01

# Uporaba knjižnic LinearAlgebra in Plots
using LinearAlgebra, Plots

"""
  Podatkovna struktura, ki je sestavljena iz dveh matrik.
  Matrika V vsebuje neničelne vrednosti razpršene matrike.
  Matrika I pripadajoči stolpec neničelne vrednosti razpršene matrike.
"""

struct RazpršenaMatrika
  V::Matrix{Float64}
  I::Matrix{Int}
end

"""
  LastnaVrednost = LastneVrednosti(A, w)
  Matriko pretvorimo in izračunamo lastne vrednosti.
  S tem preverimo konvergenco.
"""

function LastneVrednosti(A, w)
  L=-tril(A,-1)
  U=-triu(A,1)
  D=diagm(diag(A))
  R=(D-w*L)\((1-w)*D+w*U)
  f=eigen(R)
  f.values
  LastnaVrednost = abs.(f.values)
  return LastnaVrednost
end

# Funkcije za obdelavo razpršenih matrik
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

"""
  x = Base.product = (A::RazpršenaMatrika, b::Vector{Float64})
  Množenje z vektorjem z desne za razpršene matrike.
  S tem preverimo pravilno rešitev SOR iteracije.
"""

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

"""
  xn, korak = sor(A::RazpršenaMatrika, b::Vector{Float64}, x1::Vector{Float64}, w, tol)
  SOR iteracije za razpršene matrike.
"""

function sor(A::RazpršenaMatrika, b::Vector{Float64}, x1::Vector{Float64}, w, tol)
  xn=copy(x1)
  x1=copy(x1)
  x1=Inf*xn
  fii, fij = Base.firstindex(A::RazpršenaMatrika)
  lii, lij = Base.lastindex(A::RazpršenaMatrika)
  diagonalniElement = 1
  korak = 0
  while ((norm(xn-x1, Inf) > tol) && (korak < 10000))
    # println(korak) # Če želimo izpis števila korakov, to odkomentiramo.
    copyto!(x1,xn)
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

"""
  OdvisnostW(A::RazpršenaMatrika, b::Vector{Float64}, x1::Vector{Float64}, w, tol)
  Funkcija izriše graf odvisnosti konvergence od relaksacijskega parametra.
"""

function OdvisnostW(A::RazpršenaMatrika, b::Vector{Float64}, x1::Vector{Float64}, w, tol)
  W = LinRange(0.1, 1.5, 100)
  K = similar(W)
  S = size(W)
  t = S[1]

  for i in 1:t
    y, korak = sor(B,b,x0,W[i],tol)
    K[i] = korak
  end

  plot(W, K)
end

end

