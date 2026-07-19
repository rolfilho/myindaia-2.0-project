function mascaraValor(valor) {
    valor = valor.toString().replace(/\D/g,"");
    valor = valor.toString().replace(/(\d)(\d{8})$/,"$1.$2");
    valor = valor.toString().replace(/(\d)(\d{5})$/,"$1.$2");
    valor = valor.toString().replace(/(\d)(\d{2})$/,"$1,$2");
    return valor                    
}

function DateWithHour(pdate) {
	if (typeof pdate !== 'undefined'){
		if (pdate.length < 11) pdate = pdate + "T00:01:00";
		return pdate;
	} else return 0;
}

function redirect (url) {
    var ua        = navigator.userAgent.toLowerCase(),
        isIE      = ua.indexOf('msie') !== -1,
        version   = parseInt(ua.substr(4, 2), 10);

    // Internet Explorer 8 and lower
    if (isIE && version < 9) {
        var link = document.createElement('a');
        link.href = url;
        document.body.appendChild(link);
        link.click();
    }

    // All other browsers can use the standard window.location.href (they don't lose HTTP_REFERER like Internet Explorer 8 & lower does)
    else { 
        window.location.href = url; 
    }
}

function dateStringLang(tempDate){
    if ((tempDate <= 0) || isNaN(tempDate)){    
        return "";    
    } else {
        if (localStorage._lang){
            switch(localStorage._lang) {
                case "0":
                    return (tempDate).toLocaleDateString("pt-BR", {year: '2-digit', month: '2-digit', day: '2-digit' });
                    break;
                case "1":
                    return (tempDate).toLocaleDateString("en-US", {year: '2-digit', month: '2-digit', day: '2-digit' });
                    break;
                case "2":
                    return (tempDate).toLocaleDateString("es-ES", {year: '2-digit', month: '2-digit', day: '2-digit' });
                    break;
                default:
                    return (tempDate).toLocaleDateString("pt-BR", {year: '2-digit', month: '2-digit', day: '2-digit' });
            }           
        } else {
            return (tempDate).toLocaleDateString("pt-BR", {year: '2-digit', month: '2-digit', day: '2-digit' });
        }  

    }
 
}

function dateStringLangWithHour(tempDate){
    if (localStorage._lang){
        switch(localStorage._lang) {
            case "0":
                return (tempDate).toLocaleDateString("pt-BR", {year: '2-digit', month: '2-digit', day: '2-digit' }) + ' ' +  
                         tempDate.toLocaleTimeString("pt-BR", {hour: '2-digit', minute:'2-digit'});    ;
                break;
            case "1":
                return (tempDate).toLocaleDateString("en-US", {year: '2-digit', month: '2-digit', day: '2-digit' }) + ' ' +  
                         tempDate.toLocaleTimeString("en-US", {hour: '2-digit', minute:'2-digit'});    ;
                break;
            case "2":
                return (tempDate).toLocaleDateString("es-ES", {year: '2-digit', month: '2-digit', day: '2-digit' }) + ' ' +  
                         tempDate.toLocaleTimeString("es-ES", {hour: '2-digit', minute:'2-digit'});    ;
                break;
            default:
                return (tempDate).toLocaleDateString("pt-BR", {year: '2-digit', month: '2-digit', day: '2-digit' }) + ' ' +  
                         tempDate.toLocaleTimeString("pt-BR", {hour: '2-digit', minute:'2-digit'});    ;
        }           
    } else {
        return (tempDate).toLocaleDateString("pt-BR", {year: '2-digit', month: '2-digit', day: '2-digit' }) + ' ' +  
                 tempDate.toLocaleTimeString("pt-BR", {hour: '2-digit', minute:'2-digit'});    ;
    }   

}

function compareDates(date1, date2){
    if (date1 == "") {
        return false
    } else {

       let partsdate1 = date1.split('/') // separa a data pelo caracter '/'
       let partsdate2 = date2.split('/')      // pega a data atual
       
       date1 = new Date(partsdate1[2], partsdate1[1] - 1, partsdate1[0]) // formata 'date'
       date2 = new Date(partsdate2[2], partsdate2[1] - 1, partsdate2[0]) // formata 'date'   

      
       // compara se a data informada é maior que a data atual
       // e retorna true ou false
       return (date1 <= date2); //? true : false
    }
}


