package  {
	import StorageHelper;
	import flash.display.MovieClip;

	public class Main extends MovieClip {
		public var storage:StorageHelper = new StorageHelper();

		public function Main() {
			var exampleSave = {
				name: 'Cheezor',
				money: 120
			};
			
			storage.setData('save1', exampleSave);
			storage.setData('save1.inventory', {right: null, left: 'wallet'});
			
			
			trace(storage.getData('save1.name'));
			trace(JSON.stringify(storage.data));
		}
	}
}
