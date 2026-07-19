function logout(){
	localStorage.removeItem("_cs");
	localStorage.removeItem("_csval");
	localStorage.removeItem("_lang");
	localStorage.removeItem("_int");
	localStorage.removeItem("Nome");
	localStorage.removeItem("_gr155");	
	redirect('./index.html');
}
