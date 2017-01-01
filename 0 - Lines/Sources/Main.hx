package;

import micro.Micro;

class Main 
{
	public static function main() 
	{
		var game = new Game();

		new Micro({			 
			init: game.init, 
			update: game.update, 
			draw: game.draw
		});		
	}	
}