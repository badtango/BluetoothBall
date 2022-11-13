g = ArduinoSMS("/dev/tty.ARDUINOBT-BluetoothSeri-1", 115200);

(
~ball1 = ({
g.action = { 
| ... msg | 
~param1 = msg[0].linlin(400, 650, 1.07, 0.9);        
~param2 = msg[1].linlin(400, 650, 2** -0.1, 2**0.1); 
~param3 = msg[2].linlin(400, 650, 1.03, 0.9);        
~param4 = msg[0].linlin(400, 650, 0.0, 2.0);         
~param5 = msg[1].linlin(400, 650, 0.0, 2.0);         
~param6 = msg[2].linlin(400, 650, 0.0, 19.0);        
~param7 = msg[0].linlin(400, 650, 0.0, 20.0);         
~param8 = msg[1].linlin(400, 650, 40.0, 1.0);        
~param9 = msg[2].explin(400, 650, 50.0, 1.0);       
   ~red = msg[0].linlin(400, 650, 0.0, 0.6);        
 ~green = msg[1].linlin(400, 650, 0.0, 0.6);       
  ~blue = msg[2].linlin(400, 650, 0.0, 0.6);       
}
});

~ball2 = ({
var w, seed = Date.seed, phase = 0, 
    zoom = 0.7, zoomf = 1, run = true;
w = Window(border: false);
w.view.background = Color.white;
w.onClose = { run = false };
w.front;
w.fullScreen;
w.drawHook = {
	
	thisThread.randSeed = Date.seed;
	thisThread.randSeed = seed;
	Pen.use {
		var p1 = Point(~param6 + (800/~param5), ~param6 + (600/~param5)); 
		var p2 = Point(~param7 + (800/~param4), ~param7 + (600/~param4));
		var xscales = { ~param2 } ! 2; 
		var yscales = { ~param2 } ! 2; 
		var xlates = { 16 } ! 4;
		var ylates = { 16 } ! 4;
		var rots = { ~param2 + phase } ! 2; 
		var xform;
		    xscales = (xscales ++ (1/xscales)) * ~param3;
		    yscales = (yscales ++ (1/yscales)) * ~param1;
		    xlates = xlates ++ xlates.neg;
		    ylates = ylates ++ xlates.neg;
		    rots = rots ++ rots.neg;
		    xform = {|i| [ xlates[i], ylates[i], rots[i], xscales[i], yscales[i] ] } ! 2;
		Pen.strokeColor = Color.new(~red, ~green, ~blue);
		Pen.width = ~param9;
		Pen.translate(630, 373);
		Pen.scale(zoom, zoom);
		Pen.translate(-400, -400);
500.do {
		var p, rot, xlate, ylate, xscale, yscale;
		Pen.width = ~param8;
		Pen.beginPath;
		    #rot, xlate, ylate, xscale, yscale = xform.choose;
		Pen.translate(xlate, ylate);
		Pen.rotate(rot, 800/2, 800/2);
		Pen.scale(xscale, yscale);
		Pen.moveTo(p1);
		Pen.lineTo(p2);
		Pen.stroke;
		};
	};
};

{ while { run } { w.refresh; 0.005pi.wait; } }.fork(AppClock)

});

~ball3 = ({
~ball1.value;
~ball2.value;
});
)

~ball3.value;

g.close;



