package view;

import flash.geom.Point;
import lime.Assets;
import motion.Actuate;
import motion.easing.Quad;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import model.ISquareModel;
import controller.EventStream;
import controller.EventType;
import flash.events.Event;

class SquareView extends Sprite {

	var _backgroundColor:UInt;
	var _numberText:TextField;
	var _model:ISquareModel;
	var _completeMovement:Int;
	var _animationManager:IAnimationManager;
	
	public function new() {
		super();
	}
	
	public function initialize(model:ISquareModel, animationManager:IAnimationManager):Void {
		_model = model;
		
		_animationManager = animationManager;
		x = _model.position.x * (GraphicConstants.SQUARE_SIZE + GraphicConstants.SQUARE_SPACE) + GraphicConstants.SQUARE_SIZE / 2;
		y = _model.position.y * (GraphicConstants.SQUARE_SIZE + GraphicConstants.SQUARE_SPACE) + GraphicConstants.SQUARE_SIZE / 2;
		
		EventStream.addEventListener(EventType.UPDATE, updateHandler);
		
		createNumber();
		drawBackground(true);
	}
	
	private function drawBackground(create:Bool) {
		switch (_model.level) {
			case 2: {
				graphics.beginFill(0xeee4da);
			}
			case 2: {
				graphics.beginFill(0xede0c8);
			}
			case 8: {
				graphics.beginFill(0xf2b179);
			}
			case 16: {
				graphics.beginFill(0xf59563);
			}
			case 32: {
				graphics.beginFill(0xf67c5f);
			}
		}
		graphics.drawRoundRect(GraphicConstants.SQUARE_SPACE, GraphicConstants.SQUARE_SPACE, GraphicConstants.SQUARE_SIZE, GraphicConstants.SQUARE_SIZE, 10, 10);
		graphics.endFill();
		
		if (create) {
			//_animationManager.createSquare(this);
			createEffect();
		}
	}
	
	private function createEffect() {
		scaleX = scaleY = 0.0;
		Actuate.tween(this, 0.2, {scaleX:1.0, scaleY:1.0});
		Actuate.tween(this, 0.2, {x:x - GraphicConstants.SQUARE_SIZE / 2, y:y - GraphicConstants.SQUARE_SIZE / 2});
	}
	
	private function createNumber() {
		_numberText = new TextField();
		var textFormat = new TextFormat(Assets.getFont("fonts/ClearSans-Bold.ttf").name, 54, 0x776e65, true);
		_numberText.defaultTextFormat = textFormat;
		_numberText.text = "0";
		addChild(_numberText);
		updateTextPosition();
		
		updateNumber();
	}
	
	private function updateTextPosition() {
		_numberText.x = (GraphicConstants.SQUARE_SIZE - _numberText.textWidth) / 2 + GraphicConstants.SQUARE_SPACE;
		_numberText.y = (GraphicConstants.SQUARE_SIZE - _numberText.textHeight) / 2 + GraphicConstants.SQUARE_SPACE - 4;
	}
	
	private function updateNumber() {
		if (_numberText == null) {
			return;
		}
		_numberText.text = Std.string(_model.level);

		updateTextPosition();
	} 

	private function updatePosition() {
		_animationManager.moveSquare(this, new Point(_model.position.x * (GraphicConstants.SQUARE_SIZE + GraphicConstants.SQUARE_SPACE),
													 _model.position.y * (GraphicConstants.SQUARE_SIZE + GraphicConstants.SQUARE_SPACE)), updateState);
	}
	
	private function updateHandler(event:Event) {
		update();
	}
	
	private function update() {
		updatePosition();
	}
	
	private function completeMovement():Bool {
		if (_completeMovement < 1) {
			_completeMovement++;
			return false;
		}
		else
		{
			_completeMovement = 0;
			return true;
		}
	}
	
	private function updateState() {
		if (!completeMovement())
			return;
		
		if (_model.destroyed) {
			destroy();
			return;
		}
		
		drawBackground(false);
		updateNumber();
		
		EventStream.dispatchEvent(EventType.UPDATE_COMPLETE);
	}
	
	private function destroy() {
		EventStream.dispatchEvent(EventType.SQUARE_VIEW_DESTROY, this);
		parent.removeChild(this);
		EventStream.removeEventListener(EventType.UPDATE, updateHandler);
	}
	
}