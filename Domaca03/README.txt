• ime in priimek avtorja:

    	Rok Klobučar

• opis naloge:

    	Matematično nihalo
	Kotni odmik θ(t) (v radianih) pri nedušenem nihanju nitnega nihala opišemo z diferencialno enačbo

	g/lsin(θ(t))+θ′′(t)=0,θ(0)=θ0, θ′(0)=θ′0,

	kjer je g=9.80665m/s^2 težni pospešek in l dolžina nihala. Napišite funkcijo nihalo, ki računa odmik nihala ob določenem času. Enačbo drugega reda prevedite na sistem prvega reda in računajte z metodo Runge-Kutta četrtega reda:

	k1=hf(xn,yn)
	k2=hf(xn+h/2,yn+k1/2)
	k3=hf(xn+h/2,yn+k2/2)
	k4=hf(xn+h,yn+k3)
	yn+1=yn+(k1+2k2+2k3+k4)/6.

	Klic funkcije naj bo oblike odmik=nihalo(l,t,theta0,dtheta0,n)

	kjer je odmik enak odmiku nihala ob času t,
	dolžina nihala je l,
	začetni odmik (odmik ob času 0) je theta0
	in začetna kotna hitrost (θ′(0)) je dtheta0,
	interval [0,t] razdelimo na n podintervalov enake dolžine.

	Primerjajte rešitev z nihanjem harmoničnega nihala. Za razliko od harmoničnega nihala (sinusno nihanje), je pri matematičnem nihalu nihajni čas odvisen od začetnih pogojev (energije). Narišite graf, ki predstavlja, kako se nihajni čas spreminja z energijo nihala.

• navodila kako uporabiti kodo:

    	Za uporabo so potrebne knjižnici Plots in Test.

    	Ko poženete julio, najprej vnesete ukaz using Revise [1]
    	v paketnem načinu napišete (v.01) pkg>activate Domaca03

    	Kodo iz Domaca03\scripts\demo.jl poženete z Shift-Enter v VS Code ali z ukazom julia> include("Domaca03\scripts\demo.jl").
    	Kode iz Domaca03\src NE nalagate s Shift-Enter. Revise bi moral poskrbeti, da se bo avtomatsko naložila ob vsaki spremembi.

• navodila, kako pognati teste:

    	Glejte prejšnjo točko.
    	Teste poženete v paketnem načinu z ukazom (Domaca03) pkg> test.

• navodila, kako ustvariti poročilo:

    	Poročilo je že ustvarjeno v PDF obliki. :)
