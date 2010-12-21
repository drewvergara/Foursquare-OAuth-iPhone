function init(){
	var test;
	$.ajax({
	   url: 'http://gdata.youtube.com/feeds/api/playlists/1B2BB7221AC9DBAD?v=2&alt=jsonc',
	   success: function(data) {
		   doit(data);
	   }
	});
	
	
	function doit(data){
		test = data;
	}
	
	
	return test;
}