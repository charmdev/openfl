package openfl._legacy.events; #if openfl_legacy


import openfl.events.EventPhase;

@:allow(openfl._legacy.display.DisplayObjectContainer)


class Event {
	
	
	public static inline var ACTIVATE = "activate";
	public static inline var ADDED = "added";
	public static inline var ADDED_TO_STAGE = "addedToStage";
	public static inline var CANCEL = "cancel";
	public static inline var CHANGE = "change";
	public static inline var CLOSE = "close";
	public static inline var COMPLETE = "complete";
	public static inline var CONNECT = "connect";
	public static inline var CONTEXT3D_CREATE = "context3DCreate";
	public static inline var DEACTIVATE = "deactivate";
	public static inline var ENTER_FRAME = "enterFrame";
	public static inline var ID3 = "id3";
	public static inline var INIT = "init";
	public static inline var MOUSE_LEAVE = "mouseLeave";
	public static inline var OPEN = "open";
	public static inline var REMOVED = "removed";
	public static inline var REMOVED_FROM_STAGE = "removedFromStage";
	public static inline var RENDER = "render";
	public static inline var RESIZE = "resize";
	public static inline var SCROLL = "scroll";
	public static inline var SELECT = "select";
	public static inline var SOUND_COMPLETE = "soundComplete";
	public static inline var TAB_CHILDREN_CHANGE = "tabChildrenChange";
	public static inline var TAB_ENABLED_CHANGE = "tabEnabledChange";
	public static inline var TAB_INDEX_CHANGE = "tabIndexChange";
	public static inline var UNLOAD = "unload";
	
	public var bubbles (get, never):Bool;
	public var cancelable (get, never):Bool;
	public var currentTarget (get, set):Dynamic;
	public var eventPhase (get, never):EventPhase;
	public var target (get, set):Dynamic;
	public var type (get, never):String;

	@:noCompletion private var __bubbles:Bool;
	@:noCompletion private var __cancelable:Bool;
	@:noCompletion private var __currentTarget:Dynamic;
	@:noCompletion private var __eventPhase:EventPhase;
	@:noCompletion private var __isCancelled:Bool;
	@:noCompletion private var __isCancelledNow:Bool;
	@:noCompletion private var __target:Dynamic;
	@:noCompletion private var __type:String;
	
	
	public function new (type:String, bubbles:Bool = false, cancelable:Bool = false) {
		
		__type = type;
		__bubbles = bubbles;
		__cancelable = cancelable;
		__isCancelled = false;
		__isCancelledNow = false;
		__target = null;
		__currentTarget = null;
		__eventPhase = EventPhase.AT_TARGET;
		
	}
	
	
	public function clone ():Event {
		
		return new Event (type, bubbles, cancelable);
		
	}
	
	
	public function isDefaultPrevented ():Bool {
		
		return (__isCancelled || __isCancelledNow);
		
	}
	
	
	public function stopImmediatePropagation ():Void {
		
		if (cancelable) {
			
			__isCancelled = true;
			__isCancelledNow = true;
			
		}
		
	}
	
	
	public function stopPropagation ():Void {
		
		if (cancelable) {
			
			__isCancelled = true;
			
		}
		
	}
	
	
	public function toString ():String {
		
		return "[Event type=" + type + " bubbles=" + bubbles + " cancelable=" + cancelable + "]";
		
	}
	
	
	private function __formatToString (className:String, parameters:Array<String>):String {
		
		// TODO: Make this a macro function, and handle at compile-time, with rest parameters?
		
		var output = '[$className';
		var arg:Dynamic = null;
		
		for (param in parameters) {
			
			arg = Reflect.field (this, param);
			
			if (Std.is (arg, String)) {
				
				output += ' $param="$arg"';
				
			} else {
				
				output += ' $param=$arg';
				
			}
			
		}
		
		output += "]";
		return output;
		
	}
	
	
	@:noCompletion public function __getIsCancelled ():Bool {
		
		return __isCancelled;
		
	}
	
	
	@:noCompletion public function __getIsCancelledNow ():Bool {
		
		return __isCancelledNow;
		
	}
	
	
	@:noCompletion public function __setPhase (value:EventPhase):Void {
		
		__eventPhase = value;
		
	}
	
	
	
	
	// Getters & Setters
	
	
	
	
	private function get_bubbles ():Bool { return __bubbles; }
	private function get_cancelable ():Bool { return __cancelable; }
	private function get_currentTarget ():Dynamic { return __currentTarget; }
	private function set_currentTarget (value:Dynamic):Dynamic { return __currentTarget = value; }
	private function get_eventPhase ():EventPhase { return __eventPhase; }
	private function get_target ():Dynamic { return __target; }
	private function set_target (value:Dynamic):Dynamic { return __target = value; }
	private function get_type ():String { return __type; }
	
	
}


#end