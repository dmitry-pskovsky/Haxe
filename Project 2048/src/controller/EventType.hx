package controller;

class EventType {

	static public var MOVE_UP:String = "MoveUp";
	static public var MOVE_DOWN:String = "MoveDown";
	static public var MOVE_LEFT:String = "MoveLeft";
	static public var MOVE_RIGHT:String = "MoveRight";
	
	static public var GAME_OVER:String = "GameOver";
	static public var UPDATE:String = "Update";
	static public var UPDATE_COMPLETE:String = "UpdateComplete";
	static public var SQUARES_UPDATE_COMPLETE:String = "SquaresUpdateComplete";
	
	static public var SQUARE_CREATED:String = "SquareCreated";
	static public var SQUARE_DESTROY:String = "SquareDestroy";
	static public var SQUARE_VIEW_DESTROY:String = "SquareViewDestroy";
	
	
	public function new() {
		
	}
	
}