package view;

import flash.geom.Point;
import motion.Actuate;
import haxe.Constraints.Function;

interface IAnimationManager {
	public function moveSquare(object:Dynamic, position:Point, onComplete:Function):Void;
	public function createSquare(object:Dynamic):Void;
}