package;


import haxe.Resource;
import haxe.Timer;
import haxe.Unserializer;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.AssetType;
import lime.utils.Bytes;
import lime.utils.Log;

#if sys
import haxe.io.Path;
import sys.FileSystem;
#end


@:keep @:dox(hide) class DefaultAssetLibrary extends AssetLibrary {
	
	
	private var lastModified:Float;
	private var rootPath:String;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		classTypes.set ("fonts/ClearSans-Bold.ttf", __ASSET__fonts_clearsans_bold_ttf);
		types.set ("fonts/ClearSans-Bold.ttf", AssetType.FONT);
		
		#else
		
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			
			rootPath = Reflect.field (ApplicationMain.config, "assetsPrefix");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos)
			rootPath = "assets/";
			#elseif (windows && !cs)
			rootPath = FileSystem.absolutePath (Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		#if (openfl && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_clearsans_bold_ttf);
		
		#end
		
		var useManifest = #if html5 true #else false #end;
		var id;
		id = "fonts/ClearSans-Bold.ttf";
		classTypes.set (id, __ASSET__fonts_clearsans_bold_ttf);
		types.set (id, AssetType.FONT); 
		
		if (useManifest) {
			
			loadManifest ();
			
			#if sys
			if (false && Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath (rootPath + "manifest");
				
				if (FileSystem.exists (path)) {
					
					lastModified = FileSystem.stat (path).mtime.getTime ();
					
					timer = new Timer (2000);
					timer.run = function () {
						
						var modified = FileSystem.stat (path).mtime.getTime ();
						
						if (modified > lastModified) {
							
							lastModified = modified;
							loadManifest ();
							
							onChange.dispatch ();
							
						}
						
					}
					
				}
				
			}
			#end
			
		}
		
		#end
		
	}
	
	
	private function loadManifest ():Void {
		
		var bytes = Resource.getBytes ("__ASSET_MANIFEST__");
		var manifest;
		
		if (bytes != null) {
			
			__fromManifest (AssetManifest.fromBytes (bytes));
			
		} else {
			
			// TODO: Make asynchronous
			
			var manifest = AssetManifest.fromFile (rootPath + "manifest");
			
			if (manifest != null) {
				
				__fromManifest (manifest);
				
			} else {
				
				Log.warn ("Could not load asset manifest (bytes was null)");
				
			}
			
			//AssetManifest.loadFromFile (rootPath + "manifest").onComplete (function (manifest:AssetManifest) {
				//
				//if (manifest != null) {
					//
					//__fromManifest (manifest);
					//
				//} else {
					//
					//Log.warn ("Could not load asset manifest (bytes was null)");
					//
				//}
				//
				//__fromManifest (manifest);
				//
			//}).onError (function (e:Dynamic) {
				//
				//Log.warn ('Could not load asset manifest (${e})');
				//
			//});
			
		}
		
	}
	
	
	private override function __fromManifest (manifest:AssetManifest):Void {
		
		super.__fromManifest (manifest);
		
		if (rootPath != "") {
			
			for (asset in manifest.assets) {
				
				paths.set (asset.id, rootPath + asset.path);
				
			}
			
		}
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__fonts_clearsans_bold_ttf extends null { }


#elseif (desktop || cpp)

@:font("assets/fonts/ClearSans-Bold.ttf") #if display private #end class __ASSET__fonts_clearsans_bold_ttf extends lime.text.Font {}




#else

@:keep #if display private #end class __ASSET__fonts_clearsans_bold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "fonts/ClearSans-Bold"; #end name = "Clear Sans Bold"; super (); }}


#end

#if (openfl && !flash)

@:keep #if display private #end class __ASSET__OPENFL__fonts_clearsans_bold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_clearsans_bold_ttf (); src = font.src; name = font.name; super (); }}


#end
#end