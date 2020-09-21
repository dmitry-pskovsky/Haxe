package model;

import flash.geom.Point;

interface ISquareModel {
	public var position(get, set):Point;
	public var level(get, set):Int;
	public var changed(get, set):Bool;
	public var destroyed(get, set):Bool;
	public function moveTo(position:Point):Void;
	public function destroy():Void;
	public function levelUp():Void;
}