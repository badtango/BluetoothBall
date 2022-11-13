g = ArduinoSMS("/dev/tty.ARDUINOBT-BluetoothSeri-1", 115200);

(
SynthDef(\osc, { arg carfreq = 0, modfreq = 0,  index = 0; 
 
                     var env, pmo, pan, out;

 env = EnvGen.kr(Env.perc((40/1000), 0.02, 0.5, -5), 1.0, doneAction: 2);
 pmo = PMOsc.ar(carfreq, modfreq, index, 0, 0.3);
 pan = Pan2.ar(env * pmo, 0, 0.3);

 out = Out.ar(0, pan); 

}).send(s);
);

(
g.action = { 
| ... msg | 
       
Synth(\osc,     [\carfreq, msg[0].linlin(400, 650, 10.midicps, 110.midicps), 
                 \modfreq, msg[1].linlin(400, 650, 0.0, 1000.0), 
                   \index, msg[2].linlin(400, 650, 1.0, 30.0); ]);

};
);

g.close;
