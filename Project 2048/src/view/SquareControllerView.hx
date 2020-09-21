package view;
import controller.EventStream;
import controller.EventType;
import flash.display.Sprite;
import controller.ExtendedEvent;

class SquareControllerView extends Sprite {

	var _background:BackgroundView;
	var _squares:Array<SquareView>;
	var _updatedSquares:Int;
	var _animationManager:IAnimationManager;
	
	public function new() {
		super();
		
		initializeListeners();
		
		_squares = new Array();
		
		_background = new BackgroundView();
		_background.x = _background.y = 10;
		addChild(_background);
	}
	
	private function initializeListeners() {
		EventStream.addEventListener(EventType.SQUARE_CREATED, squareCreatedHandler);
		EventStream.addEventListener(EventType.UPDATE_COMPLETE, updateCompleteHandler);
		EventStream.addEventListener(EventType.SQUARE_VIEW_DESTROY, squareViewDestroyHandler);
	}
	
	private function createSquare(data:Dynamic) {
		var _animationManager = new AnimationManager();
		
		var squareView = new SquareView();
		squareView.initialize(data, _animationManager);
		
		_background.addChild(squareView);
		
		_squares.push(squareView);
	}
	
	private function updateCompleteHandler(event:ExtendedEvent) {
		_updatedSquares++;
		if (_updatedSquares == _squares.length) {
			_updatedSquares = 0;
			EventStream.dispatchEvent(EventType.SQUARES_UPDATE_COMPLETE);
		} else if (_updatedSquares > _squares.length) {
			_updatedSquares = 0;
		}
	}
	
	private function squareViewDestroyHandler(event:ExtendedEvent) {
		_squares.pop();
	}
	
	private function squareCreatedHandler(event:ExtendedEvent) {
		createSquare(event.data);
	}
}