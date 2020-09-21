package controller;

import openfl.events.EventDispatcher;
import controller.ExtendedEvent;
import flash.events.Event;

class EventStream {

	private static var _eventDispatcher:EventDispatcher = new EventDispatcher();
	
	private var _data:Dynamic;
	
	public function new() {
		
	}
	
	static public function addEventListener(type:String, listener:Dynamic) {
		_eventDispatcher.addEventListener(type, listener);
	}
	
	static public function removeEventListener(type:String, listener:Dynamic) {
		_eventDispatcher.removeEventListener(type, listener);
	}
	
	static public function hasEventListener(type:String) {
		return _eventDispatcher.hasEventListener(type);
	}
	
	static public function dispatchEvent(type:String, data:Dynamic = null):Bool {
		return _eventDispatcher.dispatchEvent(new ExtendedEvent(type, data));
	}
}