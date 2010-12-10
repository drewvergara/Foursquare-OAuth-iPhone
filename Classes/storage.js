if('localStorage' in window && window['localStorage'] !== null){
  var store = window.localStorage;
  store.setItem('cow','moo');
	
	var getter = store.getItem('cow');
	
	return getter;
}
