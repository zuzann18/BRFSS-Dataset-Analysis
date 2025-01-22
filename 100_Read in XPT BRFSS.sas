/*set libname as r*/

Libname r "/home/u59908841/r";
run;

/*set libname of actual XPT file*/

Libname XPTfile xport '/home/u59908841/LLCP2014.XPT';
run;

/*data step reads it in and unpacks it into libname mapped to r*/

data r.BRFSS_a;
    set XPTfile.LLCP2014;
run;

/*verify success*/

proc contents data=r.BRFSS_a;
run;

/*proc freq without options*/

proc freq data=r.BRFSS_b;
	tables VETERAN3;
run;

/*check exclusions with the missing option*/

proc freq data=r.BRFSS_b;
	tables VETERAN3 / missing;
	tables DIABETE3 / missing;
	tables SLEPTIM1 / missing;
	tables ASTHMA3 / missing;
run;



