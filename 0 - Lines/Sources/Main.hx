package;

import micro.Micro;

class Main 
{
	public static function main() 
	{
		var game = new Game();

		new Micro({ 
			width: 512, height: 512, 
			backbufferWidth: 128, backbufferHeight: 128, 
			init: game.init, 
			update: game.update, 
			draw: game.draw
		});		
	}	
}