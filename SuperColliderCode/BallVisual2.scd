g = ArduinoSMS("/dev/tty.ARDUINOBT-BluetoothSeri-1", 115200);

(
~ballvis1 = ({
g.action = { 
| ... msg | 
~param1 = msg[0].linlin(400, 650, 0, 1340);        
~param2 = msg[1].linlin(400, 650, 0, 800); 
~param3 = msg[2].linlin(400, 650, 1.03, 0.9);   
   ~red = msg[0].linlin(4, 48, 0.0, 1.0);
 ~green = msg[2].linlin(4, 48, 0.0, 1.0);
  ~blue = msg[1].linlin(4, 48, 0.0, 1.0);

};
});

~ballvis2 = ({
var w, run = true, phase = 0;
w = Window(border: false);
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;
w.fullScreen;
w.drawHook = {
       Pen.use { 
	    Pen.translate(~param1, ~param2);
		28.do {			
		Pen.scale(0.35, 0.35);
		Pen.color = Color.white;
		Pen.width = 0.8;	                
       Pen.beginPath;                  
       Pen.addAnnularWedge(Point(0,0), a = 230, a + 5, 1pi + 2.0, 2pi);
       Pen.fill;
			
}; 
}; 
}; 

{ while { run } { w.refresh; 0.05.wait; phase = phase + rrand(0.01pi, 0.05pi);} }.fork(AppClock)

});

~ballvis3 = ({
~ballvis1.value;
~ballvis2.value;
});
)

~ballvis3.value;

g.close;
