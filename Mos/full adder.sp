
.options POST=NW
VDD 1 0 DC 1


MP1 7 3 1 1 PMOS W=90n L=32n
MP2 8 2 7 7 PMOS W=90n L=32n
MP3 8 7 2 2 PMOS W=90n L=32n
MP4 5 4 9 9 PMOS W=90n L=32n
MP5 5 9 4 4 PMOS W=90n L=32n
MP6 9 8 1 1 PMOS W=90n L=32n
MP7 6 8 4 4 PMOS W=90n L=32n
MP8 6 9 3 3 PMOS W=90n L=32n
MN1 7 3 0 0 NMOS W=64n L=32n
MN2 8 2 3 3 NMOS W=64n L=32n
MN3 8 3 2 2 NMOS W=64n L=32n
MN4 5 4 8 8 NMOS W=64n L=32n
MN5 5 8 4 4 NMOS W=64n L=32n
MN6 9 8 0 0 NMOS W=64n L=32n
MN7 6 9 4 4 NMOS W=64n L=32n
MN8 6 8 3 3 NMOS W=64n L=32n

va 2 0 PULSE(0 1 0 2n 2n 70n 100n)
vb 3 0 PULSE(0 1 0 2n 2n 50n 100n)
vc 4 0 PULSE(0 1 0 2n 2n 250n 500n)

.include "32nm.md"

* --- Transient Analysis ---

.tran 1n 500n 
.print tran v(5) v(6)
.meas avg_power AVG p(vdd) FROM=1n TO=500n
.MEASURE TRAN tdlay TRIG V(2) VAL=0.5 TD=0.1n
+ FALL=1 TARG V(5) VAL=0.5 FALL=1
.op

 
.end    