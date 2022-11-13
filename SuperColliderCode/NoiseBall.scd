g = ArduinoSMS("/dev/tty.ARDUINOBT-BluetoothSeri-1", 115200);

(
SynthDef(\whitenoise, {  arg noise1 = 0, noise2 = 0, noise3 = 0;
                    
                    var pulse, noise, enver, comb, filt, pants; 
                     
                     pulse = Impulse.kr(noise1, 0, 0.5);
                     noise = WhiteNoise.ar(pulse, 5.0);
                     enver = EnvGen.kr(Env.perc((40/1000), 0.2, 0.5, -5), 1.0, doneAction: 2);
	                  comb = CombN.ar(noise, 0.01, noise3, mul: enver);
	                  filt = BPF.ar(comb, noise2, 0.5.wrap2(1) * 0.5);
	                 pants = Pan2.ar(filt, 0, 0.5);      	                      
	                       Out.ar(0, pants)}).send(s);
)
                  
	                 
(
g.action = { 
| ... msg | 
       
Synth(\whitenoise, [ \noise1, msg[0].linlin(400, 650, 1000.0, 1.0), 
                     \noise2, msg[1].linlin(400, 650, 80.0, 10000.0), 
                     \noise3, msg[2].linlin(400, 650, 0.001, 0.01); 
]);
};
)

g.close;
