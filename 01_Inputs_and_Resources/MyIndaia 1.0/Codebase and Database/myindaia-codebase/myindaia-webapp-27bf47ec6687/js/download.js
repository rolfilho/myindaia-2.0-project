    function download(dataurl, filename) {
      var a = document.createElement("a");
      a.href = dataurl;
      a.setAttribute("download", filename);
      a.setAttribute("target", "_blank");
      a.setAttribute("type", "application/octet-stream");
  //a.setAttribute("class", "force-download");
  a.classList.add("force-download");
  var b = document.createEvent("MouseEvents");
  b.initEvent("click", false, true);
  a.dispatchEvent(b);
  return false;
}


$(function () {		

//var object = "<object data=\"{FileName}\" type=\"application/pdf\" width=\"100%\" height=\"100%\">";
//object += "	<p>Este browser não suporta PDFs. Por favor, faça o download do PDF: <a href=\"{FileName}\">Download PDF</a>.</p>";
//object += "	<p>This browser does not support PDFs. Please download the PDF to view it: <a href=\"{FileName}\">Download PDF</a>.</p>";
//object += "</object>";	

$(document).on('click', '.linkpdf', function(e){			
  var object = "<object data=\"{FileName}\" type=\"{TypeFile}\" width=\"100%\" height=\"100%\"></object>";	
  var wHeight = $(window).height();
  var fileName = $(this).attr("fileName");
  var filePath = $(this).attr("path");
  var extFile = fileName.split('.').pop().toUpperCase();		
  var opt = {
   autoOpen: false,
   modal: true,
   width: $(window).width(),
   height: $(window).height(),
   title: fileName,
   position: 'top',
			/*buttons: [
					{
					  text: "Download",
					  //id: "checkout-d-btn"
					  click: function() {						
						if (extFile==='PDF')
							download(filePath.substring(0, filePath.length - 10), fileName);
						else
							download(filePath, fileName);
						return false;
					  }
					}
          ]*/
        };
        console.log(extFile)
        if (extFile==='PDF')
         object = object.replace(/{TypeFile}/g,  'application/pdf');
       else if ((extFile==='TXT') || (extFile==='CSV'))
         object = object.replace(/{TypeFile}/g,  'text/plain');
       else if (extFile==='XML')
         object = object.replace(/{TypeFile}/g,  'text/xml');
       else if (extFile==='PNG')
         object = object.replace(/{TypeFile}/g,  'image/png');
       else if (extFile==='GIF')
         object = object.replace(/{TypeFile}/g,  'image/gif');	
       else if (extFile==='BMP')
         object = object.replace(/{TypeFile}/g,  'image/bmp');	
       else if (extFile==='JPG')
         object = object.replace(/{TypeFile}/g,  'image/jpeg');	
       else if (extFile==='MPEG')
         object = object.replace(/{TypeFile}/g,  'application/mpeg');

       object = object.replace(/{FileName}/g,  filePath);
       $("#dialogPDF").empty();
       $("#dialogPDF").html(object);
       $("#dialogPDF").dialog(opt).dialog("open");
     });
});