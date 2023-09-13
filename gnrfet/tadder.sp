
***************************************************
*For optimal accuracy, convergence, and runtime
***************************************************
.options POST=NW
.options PROBE
.options AUTOSTOP
.options INGOLD=2     DCON=1
.options GSHUNT=1e-12 RMIN=1e-15 
.options ABSTOL=1e-5  ABSVDC=1e-4 
.options RELTOL=1e-2  RELVDC=1e-2 
.options NUMDGT=4     PIVOT=13
.param   TEMP=27
***************************************************
***************************************************
*Include relevant model files
***************************************************
.lib 'gnrfet.lib' GNRFET
***************************************************
VDD 1 0 DC 1


XMP1 7 3 1 1 gnrfetpmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0 
XMP2 8 2 7 7 gnrfetpmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0 
XMP3 8 7 2 2 gnrfetpmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0 
XMP4 5 4 9 9 gnrfetpmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0 
XMP5 5 9 4 4 gnrfetpmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0 
XMP6 9 8 1 1 gnrfetpmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0 
XMP7 6 8 4 4 gnrfetpmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0 
XMP8 6 9 3 3 gnrfetpmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0 
XMN1 7 3 0 0 gnrfetnmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
XMN2 8 2 3 3 gnrfetnmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
XMN3 8 3 2 2 gnrfetnmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
XMN4 5 4 8 8 gnrfetnmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
XMN5 5 8 4 4 gnrfetnmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
XMN6 9 8 0 0 gnrfetnmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
XMN7 6 9 4 4 gnrfetnmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0
XMN8 6 8 3 3 gnrfetnmos nRib=1 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

va 2 0 PULSE(0 1 0 2n 2n 70n 100n)
vb 3 0 PULSE(0 1 0 2n 2n 50n 100n)
vc 4 0 PULSE(0 1 0 2n 2n 250n 500n)


* --- Transient Analysis ---

.tran 1n 500n 
.print tran v(2) v(3) v(4) v(5) v(6)
.probe
.meas avg_power AVG p(vdd) FROM=1n TO=500n
.MEASURE TRAN tdlay TRIG V(2) VAL=0.5 TD=0.1n
+ FALL=1 TARG V(5) VAL=0.5 FALL=1
.op

 
.end    