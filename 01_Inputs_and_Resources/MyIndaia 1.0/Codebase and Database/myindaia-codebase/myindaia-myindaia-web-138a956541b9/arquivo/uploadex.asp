<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Engine de Upload de Arquivo
'Arquivo de Script e HTML: Arquivo de inclusão
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
dim vFile
dim UploadRequest

set UploadRequest = CreateObject("Scripting.Dictionary")

Sub BuildUploadRequest(RequestBin)
	dim Pos, PosBeg, PosEnd, PosFile, PosBound, boundary, boundaryPos
	'Get the boundary
	PosBeg      = 1
	PosEnd      = InstrB(PosBeg,RequestBin,getByteString(chr(13)))
	boundary    = MidB(RequestBin,PosBeg,PosEnd-PosBeg)
	boundaryPos = InstrB(1,RequestBin,boundary)
	'Get all data inside the boundaries
	do until (boundaryPos=InstrB(RequestBin,boundary & getByteString("--")))
		'Members variable of objects are put in a dictionary object
		dim UploadControl
		set UploadControl = CreateObject("Scripting.Dictionary")
		'Get an object name
		Pos      = InstrB(BoundaryPos,RequestBin,getByteString("Content-Disposition"))
		Pos      = InstrB(Pos,RequestBin,getByteString("name="))
		PosBeg   = Pos+6
		PosEnd   = InstrB(PosBeg,RequestBin,getByteString(chr(34)))
		Name     = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
		PosFile  = InstrB(BoundaryPos,RequestBin,getByteString("filename="))
		PosBound = InstrB(PosEnd,RequestBin,boundary)
		'Test if object is of file type
		if (PosFile<>0) and (PosFile<PosBound) then
			'Get Filename, content-type and content of file
			PosBeg = PosFile + 10
			PosEnd = InstrB(PosBeg,RequestBin,getByteString(chr(34)))
			vFile  = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
			'Add filename to dictionary object
			UploadControl.Add "FileName", vFile
			Pos    = InstrB(PosEnd,RequestBin,getByteString("Content-Type:"))
			PosBeg = Pos+14
			PosEnd = InstrB(PosBeg,RequestBin,getByteString(chr(13)))
			'Add content-type to dictionary object
			ContentType = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
			UploadControl.Add "ContentType",ContentType
			'Get content of object
			PosBeg = PosEnd+4
			PosEnd = InstrB(PosBeg,RequestBin,boundary)-2
			Value  = MidB(RequestBin,PosBeg,PosEnd-PosBeg)
		Else
			'Get content of object
			Pos    = InstrB(Pos,RequestBin,getByteString(chr(13)))
			PosBeg = Pos+4
			PosEnd = InstrB(PosBeg,RequestBin,boundary)-2
			Value  = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
		End If
		'Add content to dictionary object
		UploadControl.Add "Value", Value
		'Add dictionary object to main dictionary
		UploadRequest.Add Name, UploadControl
		'Loop to next object
		BoundaryPos = InstrB(BoundaryPos+LenB(boundary),RequestBin,boundary)
	Loop
End Sub
'String to byte string conversion
Function getByteString(StringStr)
	dim i, char
	for i = 1 to Len(StringStr)
		char = Mid(StringStr,i,1)
		getByteString = getByteString & chrB(AscB(char))
	next
End Function
'Byte string to string conversion
Function getString(StringBin)
	dim i
	getString =""
	for i = 1 to LenB(StringBin)
		getString = getString & chr(AscB(MidB(StringBin,i,1)))
	next
End Function

Function MontaTipo(strPath)
	Dim intpos
	intpos = InStrRev(strPath, "\", Len(strPath) - 1)
	MontaTipo = Mid(strPath, intpos + 1, Len(strPath) - intpos - 1)
End Function
'Preenche o dicionário UploadRequest para que se possa ler os campos através dele.
Function upload_ReadRequest
	Response.Expires =0
	Response.Buffer  = True
	Response.Clear
	byteCount  = Request.TotalBytes
	RequestBin = Request.BinaryRead(byteCount)
	BuildUploadRequest(RequestBin)
End Function
'Salva um arquivo por upload em caminho se for de um dos tipos em ExtensoesPermitidas (string no formato "jpg,jpeg,gif")
'Para salvar com o mesmo nome do envio, passe uma String vazia para nome.
Function upload_SalvaArquivo(Campo,Caminho,Nome,ExtensoesPermitidas)
	'Segurança (bastante óbvio, não?)
	EstensoesProibidas=",exe,asp,php,sql,bat,pif,ocx,dll,aspx,shtml,"
	ExtensoesPermitidas="," & ExtensoesPermitidas & ","
	'Onde salvar
	strPath = Caminho
	if right(strPath,1)<>"\" then strPath=strPath&"\"
	'Caminho original do arquivo.
	filepathname = UploadRequest.Item(Campo).Item("FileName")
	'Obtém a extensão
	for i = Len(filepathname) to 1 step -1
		If Mid(filepathname, i, 1) = "." then exit for
	next
	extensao = Right(filepathname, Len(filepathname) - i)
	'Verifica se a extensão é dos tipos permitidos.
	if ExtensoesPermitidas=",*," then
		pode = (InStr(extensao,EstensoesProibidas)=0)
	else
		pode = (InStr(extensao,EstensoesPermitidas)>0)
	end if
	
	
	
	if pode then
		value = UploadRequest.Item(Campo).Item("Value")
		'Create FileSytemObject Component
		Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
		'Cria a pasta se ela não existir
		if not ScriptObject.FolderExists(strPath) then ScriptObject.CreateFolder(strPath)
		'Obtém o nome do arquivo a salvar
		vFile = Nome
		
		
		
		if vFile="" then
			For i = Len(filepathname) To 1 Step -1
				If Mid(filepathname, i, 1) = "\" Then Exit For
			Next
			vFile = Right(filepathname, Len(filepathname) - i)
		end if
		
		'Create and Write to a File (WARNING: Overwrites existing!)
		pathfilename = strPath & vFile
		
		Set MyFile = ScriptObject.CreateTextFile(pathfilename,true)

		for i = 1 to LenB(value)
			MyFile.Write chr(AscB(MidB(value,i,1)))
		next
		MyFile.Close
		' verificar se o arquivo foi enviado com sucesso.
		if Err.number = 0 then msgEnvio = 0 else msgEnvio = 1
		Err.Clear
  else
    msgEnvio = 2
  end if
  upload_SalvaArquivo=msgEnvio
end function

Function uRequest(n)
	uRequest=""
	if UploadRequest.Exists(n) then uRequest=UploadRequest.Item(n).Item("Value")
End Function
%>