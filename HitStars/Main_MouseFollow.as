package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Main_MouseFollow extends MovieClip
	{
		
		//Declare constants
		private const EASING:Number = 0.1;

		//Declare variables
		private var _targetX:Number;
		private var _targetY:Number;
		private var _vx:Number;
		private var _vy:Number;
		var heartArray:Array;
		var heartNumber:uint;
		var gameStatus:String;
		var secondPage_2:Main_MouseFollow_2;
		//var fourthPage:Main_MouseKey777;
		//var secondPage:Main_MouseFollow;

		public function Main_MouseFollow()
		{
			//Initialize variables
			_targetX = mouseX;
			_targetY = mouseY;
			_vx = 0;
			_vy = 0;
			
			player.x += 683.65;
			player.y += 336.8;
			
			secondPage_2=new Main_MouseFollow_2;
			//thirdPage=new Main_MouseWall;
			//secondPage=new Main_MouseFollow;

			//Add event listeners
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		private function onEnterFrame(event:Event):void
		{
			heartArray=[love_heart0,love_heart1,love_heart2,love_heart3,love_heart4,love_heart5];
			_targetX = mouseX;
			_targetY = mouseY;

			//Calculate the distance from the player to the mouse
			var dx:Number = _targetX - player.x;
			var dy:Number = _targetY - player.y;
			var distance = Math.sqrt(dx * dx + dy * dy);

			//Apply easing if the player is more than 1 pixel away from the mouse
			if (distance >= 1)
			{
				_vx = (_targetX - player.x) * EASING;
				_vy = (_targetY - player.y) * EASING;
			}
			
			//Move player
			player.x += _vx;
			player.y += _vy;
			
			
			heartNumber=6;
			for(var i=0;i<6;i++){
			if(player.hitTestObject(heartArray[i]))
			{
				heartNumber--;
				gameStatus=heartNumber+"个";
				output.text=gameStatus;
				player.addChild(heartArray[i]);
				heartArray[i].x = 0;
				heartArray[i].y = 0;
				heartArray[i].rotation = 500;
				if(heartNumber==0){
					//removeChild(stage);
					parent.addChild(secondPage_2);
					//parent.addChild(fourthPage);
					parent.removeChild(this);
					}
				}
			}
			
			
		}
	}
}