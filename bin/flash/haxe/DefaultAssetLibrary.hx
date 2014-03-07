package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("img/background.png", __ASSET__img_background_png);
		type.set ("img/background.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/easy.png", __ASSET__img_easy_png);
		type.set ("img/easy.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Hangman_-1.png", __ASSET__img_hangman__1_png);
		type.set ("img/Hangman_-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Hangman_0.png", __ASSET__img_hangman_0_png);
		type.set ("img/Hangman_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Hangman_1.png", __ASSET__img_hangman_1_png);
		type.set ("img/Hangman_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Hangman_2.png", __ASSET__img_hangman_2_png);
		type.set ("img/Hangman_2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Hangman_3.png", __ASSET__img_hangman_3_png);
		type.set ("img/Hangman_3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Hangman_4.png", __ASSET__img_hangman_4_png);
		type.set ("img/Hangman_4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Hangman_5.png", __ASSET__img_hangman_5_png);
		type.set ("img/Hangman_5.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Hangman_6.png", __ASSET__img_hangman_6_png);
		type.set ("img/Hangman_6.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/hard.png", __ASSET__img_hard_png);
		type.set ("img/hard.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/keyboard.png", __ASSET__img_keyboard_png);
		type.set ("img/keyboard.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/L1button.png", __ASSET__img_l1button_png);
		type.set ("img/L1button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/L2button.png", __ASSET__img_l2button_png);
		type.set ("img/L2button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/L3button.png", __ASSET__img_l3button_png);
		type.set ("img/L3button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/LevelSelect.png", __ASSET__img_levelselect_png);
		type.set ("img/LevelSelect.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/logo2.png", __ASSET__img_logo2_png);
		type.set ("img/logo2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/normal.png", __ASSET__img_normal_png);
		type.set ("img/normal.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/pitchfork.png", __ASSET__img_pitchfork_png);
		type.set ("img/pitchfork.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/play2.png", __ASSET__img_play2_png);
		type.set ("img/play2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/Playbutton.png", __ASSET__img_playbutton_png);
		type.set ("img/Playbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/restart.png", __ASSET__img_restart_png);
		type.set ("img/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/YouLose.png", __ASSET__img_youlose_png);
		type.set ("img/YouLose.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/YouWon.png", __ASSET__img_youwon_png);
		type.set ("img/YouWon.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/zombie.gif", __ASSET__img_zombie_gif);
		type.set ("img/zombie.gif", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/zombie.png", __ASSET__img_zombie_png);
		type.set ("img/zombie.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/zombiepitchfork.png", __ASSET__img_zombiepitchfork_png);
		type.set ("img/zombiepitchfork.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("txt/load1.txt", __ASSET__txt_load1_txt);
		type.set ("txt/load1.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("txt/load2.txt", __ASSET__txt_load2_txt);
		type.set ("txt/load2.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("txt/load3.txt", __ASSET__txt_load3_txt);
		type.set ("txt/load3.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("audio/Megatone_-_01_-_First_Space_Voyage.mp3", __ASSET__audio_megatone___01___first_space_voyage_mp3);
		type.set ("audio/Megatone_-_01_-_First_Space_Voyage.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("audio/NearMusic.mp3", __ASSET__audio_nearmusic_mp3);
		type.set ("audio/NearMusic.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("img/background.png", "img/background.png");
		type.set ("img/background.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/easy.png", "img/easy.png");
		type.set ("img/easy.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Hangman_-1.png", "img/Hangman_-1.png");
		type.set ("img/Hangman_-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Hangman_0.png", "img/Hangman_0.png");
		type.set ("img/Hangman_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Hangman_1.png", "img/Hangman_1.png");
		type.set ("img/Hangman_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Hangman_2.png", "img/Hangman_2.png");
		type.set ("img/Hangman_2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Hangman_3.png", "img/Hangman_3.png");
		type.set ("img/Hangman_3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Hangman_4.png", "img/Hangman_4.png");
		type.set ("img/Hangman_4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Hangman_5.png", "img/Hangman_5.png");
		type.set ("img/Hangman_5.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Hangman_6.png", "img/Hangman_6.png");
		type.set ("img/Hangman_6.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/hard.png", "img/hard.png");
		type.set ("img/hard.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/keyboard.png", "img/keyboard.png");
		type.set ("img/keyboard.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/L1button.png", "img/L1button.png");
		type.set ("img/L1button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/L2button.png", "img/L2button.png");
		type.set ("img/L2button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/L3button.png", "img/L3button.png");
		type.set ("img/L3button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/LevelSelect.png", "img/LevelSelect.png");
		type.set ("img/LevelSelect.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/logo2.png", "img/logo2.png");
		type.set ("img/logo2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/normal.png", "img/normal.png");
		type.set ("img/normal.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/pitchfork.png", "img/pitchfork.png");
		type.set ("img/pitchfork.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/play2.png", "img/play2.png");
		type.set ("img/play2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/Playbutton.png", "img/Playbutton.png");
		type.set ("img/Playbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/restart.png", "img/restart.png");
		type.set ("img/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/YouLose.png", "img/YouLose.png");
		type.set ("img/YouLose.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/YouWon.png", "img/YouWon.png");
		type.set ("img/YouWon.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/zombie.gif", "img/zombie.gif");
		type.set ("img/zombie.gif", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/zombie.png", "img/zombie.png");
		type.set ("img/zombie.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/zombiepitchfork.png", "img/zombiepitchfork.png");
		type.set ("img/zombiepitchfork.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("txt/load1.txt", "txt/load1.txt");
		type.set ("txt/load1.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("txt/load2.txt", "txt/load2.txt");
		type.set ("txt/load2.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("txt/load3.txt", "txt/load3.txt");
		type.set ("txt/load3.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("audio/Megatone_-_01_-_First_Space_Voyage.mp3", "audio/Megatone_-_01_-_First_Space_Voyage.mp3");
		type.set ("audio/Megatone_-_01_-_First_Space_Voyage.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("audio/NearMusic.mp3", "audio/NearMusic.mp3");
		type.set ("audio/NearMusic.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		//return null;		
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__img_background_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_easy_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hangman__1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hangman_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hangman_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hangman_2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hangman_3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hangman_4_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hangman_5_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hangman_6_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_hard_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_keyboard_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_l1button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_l2button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_l3button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_levelselect_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_logo2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_normal_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_pitchfork_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_play2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_playbutton_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_youlose_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_youwon_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_zombie_gif extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_zombie_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_zombiepitchfork_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__txt_load1_txt extends flash.utils.ByteArray { }
class __ASSET__txt_load2_txt extends flash.utils.ByteArray { }
class __ASSET__txt_load3_txt extends flash.utils.ByteArray { }
class __ASSET__audio_megatone___01___first_space_voyage_mp3 extends flash.media.Sound { }
class __ASSET__audio_nearmusic_mp3 extends flash.media.Sound { }


#elseif html5

































<<<<<<< HEAD
=======

>>>>>>> 0833e2d5c1f31e83aadae94917cd251fea468ce5
#end