package;

import kha.math.Vector2;
import kha.math.Vector2i;
import micro.Micro.*;
import micro.SColor;
import micro.Rect;

class Game
{
	var walls:Array<Rect>;
	var coins:Array<Vector2i>;
	var player:Rect;
	var delta:Vector2;		

	public function new() 
	{
			player = new Rect(4, 90, 8, 8);
			delta = new Vector2();			

			walls = new Array<Rect>();
			walls.push(new Rect(-18, 113, 8, 47));		walls[0].id = SColor.picoColor3; 
			walls.push(new Rect(21, 113, 85, 8));		walls[1].id = SColor.picoColor4;
			walls.push(new Rect(138, 113, 8, 47));		walls[2].id = SColor.picoColor3;
			walls.push(new Rect(-45, 62, 65, 8));		walls[3].id = SColor.picoColor4;
			walls.push(new Rect(59, 40, 8, 47));		walls[4].id = SColor.picoColor3;
			walls.push(new Rect(107, 63, 65, 8));		walls[5].id = SColor.picoColor4;
			walls.push(new Rect(-18, -31, 8, 47));		walls[6].id = SColor.picoColor3;
			walls.push(new Rect(21, 7, 85, 8));			walls[7].id = SColor.picoColor4;
			walls.push(new Rect(138, -31, 8, 47));		walls[8].id = SColor.picoColor3;

			walls.push(new Rect(-53, -39, 8, 207));		walls[9].id = SColor.picoColor3;
			walls.push(new Rect(172, -39, 8, 207));		walls[10].id = SColor.picoColor3;
			walls.push(new Rect(-45, 160, 217, 8));		walls[11].id = SColor.picoColor4;
			walls.push(new Rect(-45, -39, 217, 8));		walls[12].id = SColor.picoColor4;

			coins = new Array<Vector2i>();
			coins.push(new Vector2i(-27, 134));
			coins.push(new Vector2i(38, 136));
			coins.push(new Vector2i(106, 138));
			coins.push(new Vector2i(160, 107));
			coins.push(new Vector2i(94, 89));
			coins.push(new Vector2i(-33, -2));
			coins.push(new Vector2i(2, 37));
			coins.push(new Vector2i(76, -4));
			coins.push(new Vector2i(125, 36));
			coins.push(new Vector2i(163, 23));
	}	

	public function update()
	{
		delta.x = 0;
		delta.y = 0;

		if (btn(0)) 
			delta.x = -1;
		else if (btn(1))
			delta.x = 1;
		if (btn(2)) 
			delta.y = -1;
		else if (btn(3)) 
			delta.y = 1;
		
		moveBy(player.x, player.y, player.width, player.height, delta, walls);		
		player.x += delta.x;
		player.y += delta.y;				

		// pick the coins
		for (coin in coins)
		{
			if (player.pointInside(coin.x + 2.5, coin.y + 2.5))
				coins.remove(coin);
		}

		// move the camera with the player in the center of the screen
		camera.x = player.x + 5 - 64;
		camera.y = player.y + 5 - 64;

		// keep the camera inside the world
		if (camera.x < -52)
			camera.x = -52;
		else if (camera.x + camera.width > 180)
			camera.x = 180 - camera.width;

		if (camera.y < -39)
			camera.y = -39;
		else if (camera.y + camera.height > 167)
			camera.y = 167 - camera.height;
	}

	public function draw()
	{
		cls();

		for (coin in coins)
			rectfill(coin.x, coin.y, 5, 5, SColor.picoColor10);

		rectfill(player.x, player.y, player.width, player.height, SColor.picoColor12);

		for (wall in walls)
			rectfill(wall.x, wall.y, wall.width, wall.height, wall.id);		
	}
}