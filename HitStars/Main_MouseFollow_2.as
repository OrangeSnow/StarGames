package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Main_MouseFollow_2 extends MovieClip
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
		var thirdPage:Main_MouseWall;

		public function Main_MouseFollow_2()
		{
			//Initialize variables
			_targetX = mouseX;
			_targetY = mouseY;
			_vx = 0;
			_vy = 0;
			
			player.x += 683.25;
			player.y += 158.9;
			
			thirdPage=new Main_MouseWall;
			//secondPage=new Main_MouseFollow;

			//Add event listeners
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
			exit3.addEventListener(MouseEvent.CLICK,Exit3Event);
		}
		function Exit3Event(event:MouseEvent ):void{
				parent.addChild(thirdPage);
			    parent.removeChild(this);
			}
		private function onEnterFrame(event:Event):void
		{
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
			
			/*if(player.hitTestObject(exit2))
			{
				parent.addChild(secondPage);
			    parent.removeChild(this);
			}*/
			
			
		}
	}
}