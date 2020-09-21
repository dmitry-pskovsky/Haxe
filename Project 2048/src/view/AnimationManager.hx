package view;

import flash.geom.Point;
import motion.Actuate;
import haxe.Constraints.Function;

class AnimationManager implements IAnimationManager {

	public function new() {
		
	}
	
	public function moveSquare(object:Dynamic, position:Point, onComplete:Function):Void {
		Actuate.tween (object, 0.2, { x: position.x }).onComplete(onComplete);
		Actuate.tween (object, 0.2, { y: position.y }).onComplete(onComplete);
	}
	
	public function createSquare(object:Dynamic):Void {
		object.scaleX = object.scaleY = 0.0;
		Actuate.tween(object, 0.2, {scaleX:1.0, scaleY:1.0});
		Actuate.tween(object, 0.2, {x:object.x - GraphicConstants.SQUARE_SIZE / 2, y:object.y - GraphicConstants.SQUARE_SIZE / 2});
	}

}