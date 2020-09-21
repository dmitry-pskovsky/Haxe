package src.model;

import lime.graphics.cairo.CairoFormat;
import model.Grid;
import model.MoveSquaresLogic;
import openfl.geom.Point;
import controller.EventStream;
import controller.EventType;
import controller.ExtendedEvent;


class SquaresControllerModel {

	private var _grid:Grid;
	private var _moveSquaresLogic:MoveSquaresLogic;
	
	public function new() {
		
	}
	
	public function initialize() {
		EventStream.addEventListener(EventType.MOVE_DOWN, keyDownEventHandler);
		EventStream.addEventListener(EventType.MOVE_LEFT, keyLeftEventHandler);
		EventStream.addEventListener(EventType.MOVE_RIGHT, keyRightEventHandler);
		EventStream.addEventListener(EventType.MOVE_UP, keyUpEventHandler);
		
		EventStream.addEventListener(EventType.SQUARES_UPDATE_COMPLETE, squareUpdateCompleteHandler);
		
		_grid = new Grid();
		_grid.initialize();
		
		_moveSquaresLogic = new MoveSquaresLogic();
		
		createSquareOnFreePlace();

	}
	
	public function createSquareOnFreePlace() {
		/*
		var newSquare:SquareModel;
		var pos = new Point(3, 3);
		newSquare = new SquareModel();
		newSquare.initialize(pos, 2);
		
		_grid.addSquare(pos, newSquare);
		*/
		
		var freeSquares = _grid.getFreeSquares();
		var newSquare:SquareModel;
		
		if (freeSquares.length > 0) {
			var rand:Int = Std.int(Math.random() * freeSquares.length);
			var position = freeSquares.splice(rand, 1);
		
			newSquare = new SquareModel();
			newSquare.initialize(position[0], 2);
		
			_grid.addSquare(position[0], newSquare);
		} else {
			EventStream.dispatchEvent(EventType.GAME_OVER);
			trace(EventType.GAME_OVER);
		}
		
	}
	
	public function keyDownEventHandler(event:ExtendedEvent) {
		_moveSquaresLogic.moveDown(_grid);
		EventStream.dispatchEvent(EventType.UPDATE);
	}
	
	public function keyLeftEventHandler(event:ExtendedEvent) {
		_moveSquaresLogic.moveLeft(_grid);
		EventStream.dispatchEvent(EventType.UPDATE);
	}
	
	public function keyUpEventHandler(event:ExtendedEvent) {
		_moveSquaresLogic.moveUp(_grid);
		EventStream.dispatchEvent(EventType.UPDATE);
	}
	
	public function keyRightEventHandler(event:ExtendedEvent) {
		_moveSquaresLogic.moveRight(_grid);
		EventStream.dispatchEvent(EventType.UPDATE);
	}
	
	public function squareUpdateCompleteHandler(event:ExtendedEvent) {
		createSquareOnFreePlace();
	}
	
}