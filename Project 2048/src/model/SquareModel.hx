package src.model;

import flash.geom.Point;
import controller.EventStream;
import controller.EventType;
import model.ISquareModel;
import flash.events.Event;

class SquareModel implements ISquareModel {

	@:isVar public var position(get, set):Point;
	@:isVar public var level(get, set):Int;
	@:isVar public var changed(get, set):Bool;
	@:isVar public var destroyed(get, set):Bool;
	
	public function new() {
		
	}
	
	public function initialize(position:Point, level = 2) {
		this.position = position;
		this.level = level;
		changed = false;
		
		EventStream.addEventListener(EventType.UPDATE, updateHandler);
		
		EventStream.dispatchEvent(EventType.SQUARE_CREATED, this);
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
		EventStream.removeEventListener(EventType.UPDATE, updateHandler);
		destroyed = true;
	}
	
	public function levelUp():Void {
		level = this.level * 2;
		changed = true;
	}
	
	private function updateHandler(event:Event) {
		update();
	}
	
	private function update() {
		this.changed = false;
	}
}