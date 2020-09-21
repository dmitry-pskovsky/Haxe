package;

import controller.ActionController;
import haxe.DynamicAccess;
import openfl.display.Sprite;
import openfl.Lib;
import flash.events.Event;
import src.model.SquareModel;
import view.SquareControllerView;
import flash.geom.Point;
import src.model.SquaresControllerModel;

class Main extends Sprite 
{
	var _suareControllerView:SquareControllerView;
	var _suareControllerModel:SquaresControllerModel;
	var _actionController:ActionController;
	
	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, init);
		
	}
	
	private function init(e) {
		_suareControllerView = new SquareControllerView();
		addChild(_suareControllerView);
		
		_suareControllerModel = new SquaresControllerModel();
		_suareControllerModel.initialize();
		
		_actionController = new ActionController(stage);
	}
	
	static function main() {
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.application.window.resizable = false;
		Lib.current.addChild(new Main());
	}
}
