package Screen
{
	import Event.SpawnMonsterEvent;
	
	import GameLogic.Battlefield;
	import GameLogic.EnemySpawner;
	import GameLogic.FlyingObject.DummyEnemy;
	import GameLogic.FlyingObject.FlyingObjTypeEnums;
	import GameLogic.FlyingObject.SpaceShip;
	import GameLogic.ISpace;
	
	import Screen.BasicScreen;
	
	import View.HorizontalView;
	import View.VerticalView;
	
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class GameScreen extends BasicScreen 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_verView:VerticalView = null;
		private var m_horView:HorizontalView = null;
		
		private var m_space:ISpace = null;
		private var m_spaceship:SpaceShip = null;
		
		private var m_enemySpawner:EnemySpawner;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor of this class
		 */
		public function GameScreen( ui:Class )
		{
			super();
			
			this.setUI( ( new ui ) as MovieClip );
			
			//get all the ui elements
			m_verView = new VerticalView( this.Canvas.getChildByName( "mcVerticalView" ) as MovieClip );
			m_horView = new HorizontalView( this.Canvas.getChildByName( "mcHorizontalView" ) as MovieClip );
		}
		
		/**
		 * @desc	callback when show
		 */
		override public function onShow():void
		{
			trace( "[Enter the Game]" );
			
			//create the battlefield
			m_space = new Battlefield( 300, 300, 500 );
			
			//attach space to the views
			m_verView.AttachSpace( m_space );
			m_horView.AttachSpace( m_space );
			
			//create the enemy spawner
			m_enemySpawner = new EnemySpawner(m_space);
			
			//create your spaceship
			m_spaceship = new SpaceShip();
			m_space.AddObject( m_spaceship );
			
			// create the first enemy
			m_enemySpawner.dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy01));
			
			
		}
		
		/**
		 * @desc	frame function
		 */
		override public function onFrame(delta:Number):void
		{
			//run enemy spawning logic
			m_enemySpawner.Update( delta );
			
			//update the space
			m_space.Update( delta );
			
			//render the viewport
			m_verView.Render();
			m_horView.Render();
			
			// focus fix
			if(stage)
				stage.focus = this;
		}
		
		/**
		 * @desc	callback when hide
		 */
		override public function onHide():void
		{
			//TODO: implement function
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
