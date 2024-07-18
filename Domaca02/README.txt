• ime in priimek avtorja:

	Rok Klobučar

• opis naloge:

	Porazdelitvena funkcija normalne slučajne spremenljivke
	Napišite učinkovito funkcijo, ki izračuna vrednosti porazdelitvene funkcije za standardno normalno porazdeljeno slučajno spremenljivko X∼N(0,1).

	Φ(x)=P(X≤x)=1/(√(2π))∫x−∞e^(−t^2/2)dt

• navodila kako uporabiti kodo:

    	Za uporabo so potrebne knjižnic QuadGK in Test.

    	Ko poženete julio, najprej vnesete ukaz using Revise [1]
    	v paketnem načinu napišete (v.01) pkg>activate Domaca02

    	Kodo iz Domace02\scripts\demo.jl poženete z Shift-Enter v VS Code ali z ukazom julia> include("Domaca02\scripts\demo.jl").
    	Kode iz Domaca02\src NE nalagate s Shift-Enter. Revise bi moral poskrbeti, da se bo avtomatsko naložila ob vsaki spremembi.

• navodila, kako pognati teste:

    	Glejte prejšnjo točko.
    	Teste poženete v paketnem načinu z ukazom (Domaca02) pkg> test.

• navodila, kako ustvariti poročilo:

    	Poročilo je že ustvarjeno v PDF obliki. :)
