//package;
//
//
//import models.Player;
////import views.AbilitiesView;
////import views.SpellBookView;
//
//import haxe.Json;
//
//
//
//
////import haxe.ui.toolkit.containers.HBox;
////import haxe.ui.toolkit.controls.Progress;
////import haxe.ui.toolkit.core.Root;
////import haxe.ui.toolkit.core.RootManager;
////import haxe.ui.toolkit.core.Toolkit;
////import haxe.ui.toolkit.controls.Text;
////import haxe.ui.toolkit.core.Macros;
////import haxe.ui.toolkit.core.XMLController;
////import haxe.ui.toolkit.events.MenuEvent;
////import haxe.ui.toolkit.events.UIEvent;
//
//
//
////@:build(haxe.ui.toolkit.core.Macros.buildController("ui/assistant.xml"))
//class DDAssistant //extends XMLController
//{
	//
	//
//
	//
	//
//
	//
	//
	//
	//
	//
	//public static function console(text: String) {
		////ddAssistant.consoleOutput.text += "\n" + text;
		////trace(text);
	//}
	//
	//private function addControlsListeners() {
		////btn1.addEventListener(UIEvent.CLICK, btn1Clicked);
		////btn2.addEventListener(UIEvent.CLICK, btn2Clicked);
		////btn3.addEventListener(UIEvent.CLICK, btn3Clicked);
		////
		////attachEvent("newMenu", MenuEvent.SELECT, addModel);
		////attachEvent("joinMenu", MenuEvent.SELECT, join);
		////attachEvent("viewsMenu", MenuEvent.SELECT, addView);
	//}
	//
	////private function btn1Clicked(e:UIEvent) : Void {
		////player.Charisma = "45";
	////}
	////
	////private function btn2Clicked(e:UIEvent) : Void {
		////player.Charisma = "12";
		////player.Strength = "15";
	////}
	////
	////private function btn3Clicked(e:UIEvent) : Void {
		//////var panel = new HBox();
		//////var newText = new Text();
		//////newText.text = "Ceci est un nouveau text";
		//////panel.addChild(newText);
		//////mainLayout.addChild(panel);
	////}
	//
	//public static function addCompoTest(str:String) {
		////var panel = new HBox();
		////var newText = new Text();
		////newText.text = str;
		////panel.addChild(newText);
		////ddAssistant.mainLayout.addChild(panel);
	//}
	//
	//var player: Player; //tmp test variable
	//
	////private function addView(e:MenuEvent) {
		////switch(e.menuItem.id) {
			//////case "abilities":
				//////var viewController = new AbilitiesView(player);
				//////mainLayout.addChild(viewController.view);
			//////case "spells":
				//////var viewController = new SpellBookView(player);
				//////mainLayout.addChild(viewController.view);
			////default:
		////}
	////}
	//
	////private function addModel(e:MenuEvent) {
		////switch(e.menuItem.id) {
			////case "newPlayer":
				////player = new Player();
				//////DDAssistant.console(Json.stringify(player));
			////default:
		////}
	////}
	//
	////private function join(e:MenuEvent) {
	////}
//}