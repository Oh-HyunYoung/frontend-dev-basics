var TabBox = {
	_onTabClicked: function(){
		$('.tab-box li.selected').removeClass("selected");
		$(this).addClass("selected");
	},
	_initialize: function() {
		$('.tab-box li').click(TabBox._onTabClicked);
	},
	init: function() {
		$(TabBox._initialize);
	}
}