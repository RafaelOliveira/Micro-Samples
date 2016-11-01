package;

import micro.SColor;
import micro.Micro.*;

typedef Particle = {
	x:Float,
	y:Float,
	col:Int,
	width:Float,
	widthFinal:Float,
	t:Float,
	maxT:Float,
	dx:Float,
	dy:Float,
	ddy:Float
};

class Game
{	
	var particleList:Array<Particle>;

	public function new() {}
	
	public function init()
	{		
		particleList = new Array<Particle>();
	}

	function createParticle(x:Float, y:Float, initSize:Float, col:Int):Void
	{
		var p:Particle = {
			x: x,
			y: y,
			col: col,
			width: initSize,
			widthFinal: initSize + rnd(3) + 1,
			t: 0,
			maxT: 30 + rnd(10),
			dx: rnd(1),
			dy: rnd(.05),
			ddy: .05
		};

		particleList.push(p);
	}		
	
	public function update() 
	{	
		for (p in particleList)
			moveParticle(p);

		createParticle(50, 50, rnd(4), SColor.picoColor7);
	}

	function moveParticle(p:Particle):Void
	{
		if (p.t > p.maxT)
			particleList.remove(p);
		else
		{
			if (p.t > p.maxT - 15)
			{
				p.width++;
				p.width = min(p.width, p.widthFinal);
			}

			p.x += p.dx;
			p.y += p.dy;
			p.dy += p.ddy;
			p.t++;
		}		
	}

	public function draw()
	{
		cls();
		
		for (p in particleList)
			circfill(p.x, p.y, p.width, p.col);
	}
}