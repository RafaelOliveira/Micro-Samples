package;

import micro.SColor;
import micro.Micro.*;

typedef Ship = {
	x:Float,
	y:Float,
	f:Int,
	shots: Array<Shot>	
};

typedef Shot = {
	x:Float,
	y:Float,
	f:Int
};

class Game
{	
	var ship:Ship;
	var t:Int;

	public function new() {}
	
	public function init()
	{	
		setSprite(kha.Assets.images.sprites);

		ship = {
			x: 60,
			y: 110,
			f: 0,
			shots: new Array<Shot>()
		};
	}			
	
	public function update() 
	{	
		t++;

		if (btn(0)) ship.x -= 2;
		if (btn(1)) ship.x += 2;
		if (btnp(4)) createShot();

		ship.f = t % 2;

		updateShots();
	}

	function createShot()
	{
		var shot:Shot = {
			x: ship.x,
			y: ship.y,
			f: 0
		};

		ship.shots.push(shot);
	}

	function updateShots()
	{
		for (shot in ship.shots)
		{
			shot.y -= 2;
			shot.f = t % 2;

			if (shot.y < -8)
				ship.shots.remove(shot);
		}
	}

	public function draw()
	{
		cls();		

		for (shot in ship.shots)
			spr(2 + shot.f, shot.x, shot.y);

		spr(0 + ship.f, ship.x, ship.y);		
	}
}