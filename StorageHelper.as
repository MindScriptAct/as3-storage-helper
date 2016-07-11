/*
* AS3 Storage Helper provides 3 functions to make maintaining game storage simple.
* It uses dot notation to add object nesting even in sharedObjects that don't
* behave as expected when using objects. This makes consistency from online to
* offline saves easier to manage.
*/

package {

	public class StorageHelper {
		
		public var data = {};

		public function StorageHelper():void {
			
		}
		
		public function setData(key, value) {
			return this.setObjByString(this.data, key, value);
		}
		
		public function getData(key) {
			return this.getObjByString(this.data, key);
		}
		
		public function clearData(key) {
			return this.getObjByString(this.data, key);
		}

		private function setObjByString(obj, str, val):* {
			var keys; 
			var key:String;
			//make sure str is a string with length
			if (!str || !str.length || typeof(str) !== "string") {
				return false;
			}
			if (obj !== Object(obj)) {
				//if it's not an object, make it one
				obj = {};
			}
			keys = str.split(".");
			while (keys.length > 1) {
				key = keys.shift();
				if (obj !== Object(obj)) {
					//if it's not an object, make it one
					obj = {};
				}
				if (! (key in obj)) {
					//if obj doesn't contain the key, add it and set it to an empty object
					obj[key] = {};
				}
				obj = obj[key];
			}
			return obj[keys[0]] = val;
		}

		private function getObjByString(obj, str):* {
			str = str.split(".");
			for (var i:int = 0; i < str.length; i++) {
				obj = obj[str[i]];
			}
			return obj;
		}

		private function clearObjByString(obj, str):void {
			str = str.split(".");
			for (var i:int = 0; i < str.length; i++) {
				if(i + 1 == str.length){
					delete obj[str[i]];
				}else{
					obj = obj[str[i]];
				}
			}
		}
	}
}