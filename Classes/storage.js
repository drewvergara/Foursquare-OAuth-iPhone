function saveTokenOnLocalStorage(fParam){
	if('localStorage' in window && window['localStorage'] !== null){
	  var store = window.localStorage;
	  store.setItem('token', fParam);
		
		var fsToken = store.getItem('token');
		
		return fsToken;
	}
}

