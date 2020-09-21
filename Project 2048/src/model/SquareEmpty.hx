package model;

import flash.geom.Point;

class SquareEmpty implements ISquareModel {
	
	@:isVar public var position(get, set):Point;
	@:isVar public var level(get, set):Int;
	@:isVar public var changed(get, set):Bool;
	@:isVar public var destroyed(get, set):Bool;

	public function new() {
		
	}
	
	public function initialize(position:Point) {
		this.position = position;
		this.level = 0;
	}
	
	function get_changed():Bool {
		return changed;
	}
	
	function set_changed(value):Bool {
		return changed = value;
	}
	
	function get_position():Point {
		return position;
	}
	
	function set_position(value):Point {
		return position = value;
	}
	
	function get_level():Int {
		return level;
	}
	
	function set_level(value):Int {
		return level = value;
	}
	
	function get_destroyed():Bool {
		return destroyed;
	}
	
	function set_destroyed(value):Bool {
		return destroyed = value;
	}
	
	public function moveTo(position:Point):Void {
		this.position = position;
	}

	public function destroy():Void {
		throw "Can't be destroyed this is empty square";
	}
	
	public function levelUp():Void {
		throw "Can't be rised this is empty square";
	}
	
}