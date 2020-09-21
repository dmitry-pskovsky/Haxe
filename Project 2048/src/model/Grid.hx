package model;

import openfl.geom.Point;

class Grid {

	public var _grid:Array<Array<ISquareModel>>;
	
	public function new() {
		
	}
	
	public function initialize() {
		_grid = new Array();
		for (i in 0...4) {
			_grid[i] = new Array();
			for (j in 0...4) {
				var emptySqure:SquareEmpty = new SquareEmpty();
				emptySqure.initialize(new Point(i, j));
				_grid[i][j] = emptySqure;
			}
		}
	}
	
	public function getFreeSquares():Array<Point> {
		var _freeSquares:Array<Point> = new Array();
		
		for (i in 0...4) {
			for (j in 0...4) {
				if (Std.is(_grid[i][j], SquareEmpty)) {
					_freeSquares.push(new Point(i, j));
				}
			}
		}
		
		return _freeSquares;
	}
	
	public function destroySquare(position:Point):Void {
		var square = new SquareEmpty();
		square.initialize(position);
		_grid[Std.int(position.x)][Std.int(position.y)] = square;
	}
	
	public function getSquare(x:Int, y:Int):ISquareModel {
		return _grid[x][y];
	}
	
	public function addSquare(position:Point, square:ISquareModel) {
		_grid[Std.int(position.x)][Std.int(position.y)] = square;
	}
	
}