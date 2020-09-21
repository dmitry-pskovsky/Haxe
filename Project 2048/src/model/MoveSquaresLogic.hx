package model;
import openfl.geom.Point;

class MoveSquaresLogic {

	public function new() {
		
	}
	
	public function moveDown(grid:Grid) {
		var changes:Int;
		var j:Int;
		
		for (i in 0...4) {
			changes = 1;
			while (changes > 0) {
				changes = 0;
				j = 3;
				while (j > 0) {
					//trace(i, j - 1);
					changes += makeAction(grid.getSquare(i, j), grid.getSquare(i, j - 1), grid);
					j--;
				}	
			}
			
		}
	}
	
	public function moveUp(grid:Grid) {
		var changes:Int;
		var j:Int;
		
		for (i in 0...4) {
			changes = 1;
			while (changes > 0) {
				changes = 0;
				j = 1;
				while (j < 4) {
					//trace(i, j - 1);
					changes += makeAction(grid.getSquare(i, j - 1), grid.getSquare(i, j), grid);
					j++;
				}	
			}
			
		}
	}
	
	public function moveRight(grid:Grid) {
		var changes:Int;
		var j:Int;
		
		for (i in 0...4) {
			changes = 1;
			while (changes > 0) {
				changes = 0;
				j = 1;
				while (j < 4) {
					//trace(i, j - 1);
					changes += makeAction(grid.getSquare(j, i), grid.getSquare(j - 1, i), grid);
					j++;
				}	
			}
		}
	}
	
	public function moveLeft(grid:Grid) {
		var changes:Int;
		var j:Int;
		
		for (i in 0...4) {
			changes = 1;
			while (changes > 0) {
				changes = 0;
				j = 1;
				while (j < 4) {
					//trace(i, j - 1);
					changes += makeAction(grid.getSquare(j - 1, i), grid.getSquare(j, i), grid);
					j++;
				}	
			}
		}
	}
	
	private function makeAction(square1:ISquareModel, square2:ISquareModel, grid:Grid):Int {
		if (Std.is(square1, SquareEmpty) && !Std.is(square2, SquareEmpty)) {
			grid.destroySquare(square2.position);
			square2.moveTo(square1.position);
			grid.addSquare(square1.position, square2);
			return 1;
		} else if (!Std.is(square1, SquareEmpty) && !Std.is(square2, SquareEmpty)) {
			if (square1.level == square2.level) {
				if (square1.changed || square2.changed) {
					return 0;
				} else {
					grid.destroySquare(square2.position);
					square2.moveTo(square1.position);
					square2.destroy();
					square1.levelUp();
					return 1;
				}
			}
		}
		
		return 0;
	}
	
}