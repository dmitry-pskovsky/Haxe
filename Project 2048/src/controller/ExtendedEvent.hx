package controller;

import flash.events.Event;

class ExtendedEvent extends Event {
	
	@:isVar public var data(get, set):Dynamic;
	
	public function new(type:String, data:Dynamic) {	
		super(type, false, false);
		this.data = data;
	}
	
	function get_data():Dynamic {
		return data;
	}
	
	function set_data(value):Dynamic {
		return data = value;
	}
	
}