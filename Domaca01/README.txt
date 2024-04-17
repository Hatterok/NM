• ime in priimek avtorja:

    Rok Klobučar

• opis naloge:

    SOR iteracija za razpršene matrike
    Naj bo A n × n diagonalno dominantna razpršena matrika(velika večina elementov je ničelnih aij=0).

    Definirajte nov podatkovni tip RazprsenaMatrika, ki matriko zaradi prostorskih zahtev hrani
    v dveh matrikah V in I, kjer sta V in I matriki n × m, tako da velja:
   
    V(i,j)=A(i,I(i,j)).

    V matriki V se torej nahajajo neničelni elementi matrike A.
    Vsaka vrstica matrike V vsebuje ničelne elemente iz iste vrstice v A.
    V matriki I pa so shranjeni indeksi stolpcev teh neničelnih elementov.

    Za podatkovni tip RazprsenaMatrika definirajte metode za naslednje funkcije:
    indeksiranje: Base.getindex,Base.setindex!,Base.firstindex in Base.lastindex
    množenje z desne Base.* z vektorjem

    Napišite funkcijo x, it = sor(A, b, x0, omega, tol=1e-10), ki reši tridiagonalni sistem Ax=b z SOR iteracijo.
    Pri tem je x0 začetni približek, tol pogoj za ustavitev iteracije in omega parameter pri SOR iteraciji.
    Iteracija naj se ustavi, ko je
    
    |Ax(k)−b|∞ < tol
    
    Metodo uporabite za vožitev grafa v ravnino ali prostor s fizikalno metodo. Če so (xi,yi,zi)
    koordinate vozlišč grafa v prostoru, potem vsaka koordinata posebej zadošča enačbam

    −st(i)xi+∑j∈N(i)xj=0,
    −st(i)yi+∑j∈N(i)yj=0,
    −st(i)zi+∑j∈N(i)zj=0,

    kjer je st(i) stopnja i-tega vozlišča, N(i) pa množica indeksov sosednjih vozlišč.
    Če nekatera vozlišča fiksiramo, bodo ostala zavzela ravnovesno lego med fiksiranimi vozlišči.

    Za primere, ki jih boste opisali, poiščite optimalni omega, pri katerem SOR
    najhitreje konvergira in predstavite odvisnost hitrosti konvergence od izbire ω.

• navodila kako uporabiti kodo:

    Za uporabo so potrebne knjižnice LinearAlgebra, Plots in Test.
    V Domaca01.jl poženite modul Domaca01 z ukazom shift+enter. Z istim ukazom poženite vse vrstice v demo.jl.
    Enako storite v runtests.jl. Sledite komentarjem.

• navodila, kako pognati teste:

    Glejte prejšnjo točko.

• navodila, kako ustvariti poročilo:

    Poročilo je že ustvarjeno v PDF obliki. :)
