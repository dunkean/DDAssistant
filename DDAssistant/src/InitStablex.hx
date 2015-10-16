import ru.stablex.ui.UIBuilder;
class InitStablex{
    /**
    * Function called with `--macro` compiler flag
    *
    */
    macro static public function init () : Void{
        //create xml-based classes for custom widgets
	//	UIBuilder.regClass("SpellItemView");
//		UIBuilder.regClass("SpellItemView");
		UIBuilder.buildClass("ui/magic/spellitem.xml", "SpellItemView");
        UIBuilder.buildClass("ui/magic/spelldb.xml", "SpellDBView");
    }//function init()
}//class Init