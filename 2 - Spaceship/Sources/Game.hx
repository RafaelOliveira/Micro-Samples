package;

import micro.SColor;
import micro.Micro.*;

typedef Ship = {
	x:Float,
	y:Float,
	frame:Int,
	shots: Array<Shot>,
	maxShots:Int	
};

typedef Shot = {
	x:Float,
	y:Float,
	frame:Int
};

typedef Star = {
	x:Float,
	y:Float,
	dy:Float,
	opacity:Float
};

class Game
{	
	var ship:Ship;
	var stars:Array<Star>;
	var t:Int;

	public function new() 
	{
		setSprite(kha.Assets.images.sprites);

		ship = {
			x: 60,
			y: 110,
			frame: 0,
			shots: new Array<Shot>(),
			maxShots: 5
		};

		stars = new Array<Star>();

		for (i in 0...20)
		{
			stars.push({
				x: rnd(gameWidth),
				y: rnd(gameHeight),
				dy: rnd(0.5) + 0.1,
				opacity: rnd(1) + 0.1
			});
		}
	}				
	
	public function update() 
	{	
		t++;

		if (btn(0)) ship.x -= 2;
		if (btn(1)) ship.x += 2;
		
		if (btnp(4)) 
		{
			if (ship.shots.length < ship.maxShots)
				createShot();
		}

		ship.frame = t % 2;

		updateShots();
		updateStars();
	}

	function createShot()
	{
		var shot:Shot = {
			x: ship.x,
			y: ship.y,
			frame: 0
		};
		
		ship.shots.push(shot);
	}

	function updateShots()
	{
		for (shot in ship.shots)
		{
			shot.y -= 2;
			shot.frame = t % 2;

			if (shot.y < -8)
				ship.shots.remove(shot);
		}
	}

	function updateStars()
	{
		for (star in stars)
		{
			star.y += star.dy;
			
			if (star.y > gameHeight)
			{
				star.x = rnd(gameWidth);
				star.y = 0;
				star.dy = rnd(0.5) + 0.1;
				star.opacity = rnd(1) + 0.1;
			}				
		}
	}

	public function draw()
	{
		cls();

		for (star in stars)
		{
			opacity(star.opacity);
			pset(int(star.x), int(star.y), SColor.picoColor7);
			disableOpacity();
		}		

		for (shot in ship.shots)
			spr(2 + shot.frame, shot.x, shot.y);

		spr(0 + ship.frame, ship.x, ship.y);		
	}
}