g = ArduinoSMS("/dev/tty.ARDUINOBT-BluetoothSeri-1", 115200);

(
g.action = { 
| ... msg | 

msg[0].post; 
msg[1].post; 
msg[2].postln; 

};
)

g.close;
