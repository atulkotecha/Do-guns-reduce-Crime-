clear all
use "C:\Users\ask190007\Desktop\guns.dta"   , clear
twoway (line vio shall)
summarize
corr shall incarc_rate density avginc pop pm1029 pb1064 pw1064
xtset stateid
gen ln_vio = ln(vio)
gen ln_mur = ln(mur)
gen ln_rob = ln(rob)


***Violence ***
reg ln_vio shall incarc_rate density avginc pop pm1029 pb1064 pw1064, vce(cluster state)
reg ln_vio shall incarc_rate density avginc pop pm1029 pb1064 pw1064 i.year, vce(cluster state)


xtreg ln_vio shall incarc_rate density avginc pop pm1029 pb1064 pw1064, fe cluster (state)
xtreg ln_vio shall incarc_rate density avginc pop pm1029 pb1064 pw1064 i.year, fe cluster (state)
testparm i.year
xtreg ln_vio shall incarc_rate density avginc pop pm1029 pb1064 pw1064, fe
estimates store fixed
xtreg ln_vio shall incarc_rate density avginc pop pm1029 pb1064 pw1064, re
estimates store random
hausman fixed random

**** Robbery***
reg ln_rob shall incarc_rate density avginc pop pm1029 pb1064 pw1064, vce(cluster state)

xtreg ln_rob shall incarc_rate density avginc pop pm1029 pb1064 pw1064, fe cluster (state)
xtreg ln_rob shall incarc_rate density avginc pop pm1029 pb1064 pw1064 i.year, fe cluster (state)
testparm i.year
xtreg ln_rob shall incarc_rate density avginc pop pm1029 pb1064 pw1064, fe
estimates store fixed
xtreg ln_rob shall incarc_rate density avginc pop pm1029 pb1064 pw1064, re
estimates store random
hausman fixed random


*** Murder ***
reg ln_mur shall incarc_rate density avginc pop pm1029 pb1064 pw1064, vce (cluster state)

xtreg ln_mur shall incarc_rate density avginc pop pm1029 pb1064 pw1064, fe cluster (state)
xtreg ln_mur shall incarc_rate density avginc pop pm1029 pb1064 pw1064 i.year, fe cluster (state)
testparm i.year
xtreg ln_mur shall incarc_rate density avginc pop pm1029 pb1064 pw1064, fe
estimates store fixed
xtreg ln_mur shall incarc_rate density avginc pop pm1029 pb1064 pw1064, re
estimates store random
hausman fixed random
