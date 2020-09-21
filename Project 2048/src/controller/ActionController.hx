package controller;
import openfl.display.Stage;
import openfl.events.KeyboardEvent;

class ActionController {

	public function new (stage:Stage) {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		//stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	public function onKeyDown (evt:KeyboardEvent) {
		switch (evt.keyCode) {
			case 38: {
				EventStream.dispatchEvent(EventType.MOVE_UP);
			}
			case 39: {
				EventStream.dispatchEvent(EventType.MOVE_RIGHT);
			}
			case 37: {
				EventStream.dispatchEvent(EventType.MOVE_LEFT);
			}
			case 40: {
				EventStream.dispatchEvent(EventType.MOVE_DOWN);
			}
		}
	}
	
}