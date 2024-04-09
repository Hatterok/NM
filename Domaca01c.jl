# module Domaca01c

using LinearAlgebra

# Definicija podatkovnega tipa RazpršenaMatrika
struct RazpršenaMatrika
  V::Matrix{Float64}
  I::Matrix{Int}
end

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
function product(A::RazpršenaMatrika, b::Vector{Float64})
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

b = ones(4) * 1.0
x0 = ones(4) * 0.5
w = 1.25
tol = 1e-12


function sor(A::RazpršenaMatrika, b::Vector{Float64}, x1::Vector{Float64}, w, tol)
  xn=x1
  x1=Inf*xn
  fii, fij = Base.firstindex(A::RazpršenaMatrika)
  lii, lij = Base.lastindex(A::RazpršenaMatrika)
  while norm(xn-x1, Inf) > tol
    x1 = xn
    for i in fii:lii
      for j in fij:lij
        if A.I[i,j] != 0
        xn[i] = (1/(findmax(A.V[i,:])[1]))*(b[i] - sum(A.V[i,j]*x1[i]))
        xn[i] += (1-w)*x1[j] + w*xn[i] 
        end
      end
    end
  end
  return xn
end

x = sor(B,b,x0,w,tol)

product(B,x)
A * x



# end

