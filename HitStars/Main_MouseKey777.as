package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Main_MouseKey777 extends MovieClip
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
		var fivePage:FivePage;

		public function Main_MouseKey777()
		{
			//Initialize variables
			_targetX = mouseX;
			_targetY = mouseY;
			_vx = 0;
			_vy = 0;
			
			player.x += 209.25;
			player.y += 597.6;
			
			fivePage=new FivePage;

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
			
			if (player.hitTestObject(doorKey))
			{
				player.hasKey = true;
				player.addChild(doorKey);
				doorKey.x = 0;
				doorKey.y = 0;
				doorKey.rotation = 300;
			}
			if (player.hitTestObject(doorOne))
			{
				if (player.hasKey)
				{
					if(!doorOne.isOpen)
					{
						doorOne.isOpen = true;
						doorKey.visible = false;
						doorOne.visible = false;
					}
				}
				else
				{
					player.x-=_vx;
					player.y-=_vy;
				}
			}
			if (player.hitTestObject(doorTwo))
			{
				if (player.hasKey)
				{
					if(doorOne.isOpen){
					if(!doorTwo.isOpen)
					{
						doorTwo.isOpen = true;
						doorTwo.visible = false;
						parent.addChild(fivePage);
			  			parent.removeChild(this);
					}
					}
				}
				else
				{
					player.x-=_vx;
					player.y-=_vy;
				}
			}

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
				}
			}
			
			if(player.hitTestObject(wall2)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall3)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall4)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall5)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall6)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall7)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall8)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall9)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall10)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall12)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall13)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall14)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall15)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall16)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall17)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall18)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall19)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			if(player.hitTestObject(wall20)){
				player.x-=_vx;
				player.y-=_vy;
				
			}
			
			
		}
	}
}