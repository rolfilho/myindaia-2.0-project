<%
path=left(Request.ServerVariables("PATH_INFO"),InstrRev(Request.ServerVariables("PATH_INFO"),"/"))
path=right(path,len(path)-1)
if InStr(path,"/") then
	path=left(path,len(path)-1)
end if

Dim catnom(), valor(), caminho
caminho="/"&path

With Server.CreateObject("OWC10.ChartSpace")
	set c = .constants
	With .charts.add
		.HasTitle=True
		if .HasTitle then
			.Title.Caption = "Frutas Hoje"
			.Title.Font.Size = 10
			.Title.Font.Name = "Tahoma"
			.Title.Font.Bold = True
			.Title.Font.Italic = False
			.Title.Font.Underline = False
		end if
		
		.HasLegend = True
		if .HasLegend then
			.Legend.Font.Size = 10
			.Legend.Font.Name = "Tahoma"
			.Legend.Font.Bold = False
			.Legend.Font.Italic = False
			.Legend.Font.Underline = False
		end if

		tipo=11
		Select Case tipo
		Case 1
			.Type = c.chChartTypeArea
		Case 2
			.Type = c.chChartTypeAreaStacked
		Case 3
			.Type = c.chChartTypeBarClustered
		Case 4
			.Type = c.chChartTypeBarStacked
		Case 5
			.Type = c.chChartTypeBubble
		Case 6
			.Type = c.chChartTypeColumnClustered
		Case 7
			.Type = c.chChartTypeColumnStacked
		Case 8
			.Type = c.chChartTypeLine
		Case 9
			.Type = c.chChartTypeLineMarkers
		Case 10
			.Type = c.chChartTypeLineStacked
		Case 11
			.Type = c.chChartTypePie
		Case Default
			'.Type = c.chChartTypeArea3D
			'.Type = c.chChartTypeBar3D
			'.Type = c.chChartTypeColumn3D
			'.Type = c.chChartTypeColumnStacked3D
			'.Type = c.chChartTypeCombo
			'.Type = c.chChartTypeCombo3D
		End Select

		x=5
		ReDim catnom(x), valor(x)
		
		catnom(0) = "Pera"
		valor(0) = 10
		catnom(1) = "Maça"
		valor(1) = 20
		catnom(2) = "Uva"
		valor(2) = 10
		catnom(3) = "Banana"
		valor(3) = 20
		catnom(4) = "Kiwi"
		valor(4) = 30
		catnom(5) = "Laranja"
		valor(5) = 20

		With .seriescollection.add
			.caption = "Frutas"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		End With
	End With		

	.border.color = c.chColorNone

	'Set arquivo=Server.CreateObject("Scripting.FileSystemObject")
	'arquivo=arquivo.GetTempname & ".gif"
	'.ExportPicture Server.MapPath(caminho) &"/"& arquivo, "gif", 200, 200
	'Response.Write "<img src="""&arquivo&""">"
End With

' -------------------------------------------------------------------------------------------

With Server.CreateObject("OWC10.ChartSpace")
	set c = .constants

	With .charts.add
		.HasTitle=True
		if .HasTitle then
			.Title.Caption = "Frutas"
			.Title.Font.Size = 10
			.Title.Font.Name = "Tahoma"
			.Title.Font.Bold = True
			.Title.Font.Italic = False
			.Title.Font.Underline = False
		end if
		
		.HasLegend = True
		if .HasLegend then
			.Legend.Font.Size = 10
			.Legend.Font.Name = "Tahoma"
			.Legend.Font.Bold = False
			.Legend.Font.Italic = False
			.Legend.Font.Underline = False
			.Legend.Position = c.chLegendPositionLeft
		end if

		tipo=8
		Select Case tipo
		Case 1
			.Type = c.chChartTypeArea
		Case 2
			.Type = c.chChartTypeAreaStacked
		Case 3
			.Type = c.chChartTypeBarClustered
		Case 4
			.Type = c.chChartTypeBarStacked
		Case 5
			.Type = c.chChartTypeBubble
		Case 6
			.Type = c.chChartTypeColumnClustered
		Case 7
			.Type = c.chChartTypeColumnStacked
		Case 8
			.Type = c.chChartTypeLine
		Case 9
			.Type = c.chChartTypeLineMarkers
		Case 10
			.Type = c.chChartTypeLineStacked
		Case 11
			.Type = c.chChartTypePie
		Case Default
			'.Type = c.chChartTypeArea3D
			'.Type = c.chChartTypeBar3D
			'.Type = c.chChartTypeColumn3D
			'.Type = c.chChartTypeColumnStacked3D
			'.Type = c.chChartTypeCombo
			'.Type = c.chChartTypeCombo3D
		End Select

		x=3
		ReDim catnom(x), valor(x)
		
		catnom(0) = "31/07/2002"
		valor(0) = 10
		catnom(1) = "01/08/2002"
		valor(1) = 20
		catnom(2) = "02/08/2002"
		valor(2) = 10
		catnom(3) = "03/08/2002"
		valor(3) = 15

		With .seriescollection.add
		
			.caption = "Pera"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 15
		catnom(1) = "01/08/2002"
		valor(1) = 10
		catnom(2) = "02/08/2002"
		valor(2) = 15
		catnom(3) = "03/08/2002"
		valor(3) = 30

		With .seriescollection.add
		
			.caption = "Maçã"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 40
		catnom(1) = "01/08/2002"
		valor(1) = 50
		catnom(2) = "02/08/2002"
		valor(2) = 45
		catnom(3) = "03/08/2002"
		valor(3) = 90

		With .seriescollection.add
		
			.caption = "Uva"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 11
		catnom(1) = "01/08/2002"
		valor(1) = 80
		catnom(2) = "02/08/2002"
		valor(2) = 77
		catnom(3) = "03/08/2002"
		valor(3) = 86

		With .seriescollection.add
		
			.caption = "Banana"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 2
		catnom(1) = "01/08/2002"
		valor(1) = 23
		catnom(2) = "02/08/2002"
		valor(2) = 69
		catnom(3) = "03/08/2002"
		valor(3) = 81

		With .seriescollection.add
		
			.caption = "Kiwi"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 14
		catnom(1) = "01/08/2002"
		valor(1) = 16
		catnom(2) = "02/08/2002"
		valor(2) = 15
		catnom(3) = "03/08/2002"
		valor(3) = 14

		With .seriescollection.add
		
			.caption = "Laranja"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

	End With

	.border.color = c.chColorNone

	Set arquivo=Server.CreateObject("Scripting.FileSystemObject")
	arquivo=arquivo.GetTempname & ".gif"
	.ExportPicture Server.MapPath(caminho) &"/"& arquivo, "gif", 400, 200
	Response.Write "<img src="""&arquivo&""">"
End With

' -------------------------------------------------------------------------------------------

With Server.CreateObject("OWC10.ChartSpace")
	set c = .constants

	With .charts.add
		.HasTitle=True
		if .HasTitle then
			.Title.Caption = "Frutas"
			.Title.Font.Size = 10
			.Title.Font.Name = "Tahoma"
			.Title.Font.Bold = True
			.Title.Font.Italic = False
			.Title.Font.Underline = False
		end if
		
		.HasLegend = True
		if .HasLegend then
			.Legend.Font.Size = 10
			.Legend.Font.Name = "Tahoma"
			.Legend.Font.Bold = False
			.Legend.Font.Italic = False
			.Legend.Font.Underline = False
		end if

		tipo=6
		Select Case tipo
		Case 1
			.Type = c.chChartTypeArea
		Case 2
			.Type = c.chChartTypeAreaStacked
		Case 3
			.Type = c.chChartTypeBarClustered
		Case 4
			.Type = c.chChartTypeBarStacked
		Case 5
			.Type = c.chChartTypeBubble
		Case 6
			.Type = c.chChartTypeColumnClustered
		Case 7
			.Type = c.chChartTypeColumnStacked
		Case 8
			.Type = c.chChartTypeLine
		Case 9
			.Type = c.chChartTypeLineMarkers
		Case 10
			.Type = c.chChartTypeLineStacked
		Case 11
			.Type = c.chChartTypePie
		Case Default
			'.Type = c.chChartTypeArea3D
			'.Type = c.chChartTypeBar3D
			'.Type = c.chChartTypeColumn3D
			'.Type = c.chChartTypeColumnStacked3D
			'.Type = c.chChartTypeCombo
			'.Type = c.chChartTypeCombo3D
		End Select

		x=3
		ReDim catnom(x), valor(x)
		
		catnom(0) = "31/07/2002"
		valor(0) = 10
		catnom(1) = "01/08/2002"
		valor(1) = 20
		catnom(2) = "02/08/2002"
		valor(2) = 10
		catnom(3) = "03/08/2002"
		valor(3) = 15

		With .seriescollection.add
		
			.caption = "Pera"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 15
		catnom(1) = "01/08/2002"
		valor(1) = 10
		catnom(2) = "02/08/2002"
		valor(2) = 15
		catnom(3) = "03/08/2002"
		valor(3) = 30

		With .seriescollection.add
		
			.caption = "Maçã"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 40
		catnom(1) = "01/08/2002"
		valor(1) = 50
		catnom(2) = "02/08/2002"
		valor(2) = 45
		catnom(3) = "03/08/2002"
		valor(3) = 90

		With .seriescollection.add
		
			.caption = "Uva"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 11
		catnom(1) = "01/08/2002"
		valor(1) = 80
		catnom(2) = "02/08/2002"
		valor(2) = 77
		catnom(3) = "03/08/2002"
		valor(3) = 86

		With .seriescollection.add
		
			.caption = "Banana"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 2
		catnom(1) = "01/08/2002"
		valor(1) = 23
		catnom(2) = "02/08/2002"
		valor(2) = 69
		catnom(3) = "03/08/2002"
		valor(3) = 81

		With .seriescollection.add
		
			.caption = "Kiwi"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 14
		catnom(1) = "01/08/2002"
		valor(1) = 16
		catnom(2) = "02/08/2002"
		valor(2) = 15
		catnom(3) = "03/08/2002"
		valor(3) = 14

		With .seriescollection.add
		
			.caption = "Laranja"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

	End With

	.border.color = c.chColorNone

	Set arquivo=Server.CreateObject("Scripting.FileSystemObject")
	arquivo=arquivo.GetTempname & ".gif"
	.ExportPicture Server.MapPath(caminho) &"/"& arquivo, "gif", 375, 200
	Response.Write "<img src="""&arquivo&""">"
End With

' -------------------------------------------------------------------------------------------

With Server.CreateObject("OWC10.ChartSpace")
	set c = .constants

	With .charts.add
		.HasTitle=True
		if .HasTitle then
			.Title.Caption = "Estoque total de Frutas"
			.Title.Font.Size = 10
			.Title.Font.Name = "Tahoma"
			.Title.Font.Bold = True
			.Title.Font.Italic = False
			.Title.Font.Underline = False
		end if
		
		.HasLegend = True
		if .HasLegend then
			.Legend.Font.Size = 10
			.Legend.Font.Name = "Tahoma"
			.Legend.Font.Bold = False
			.Legend.Font.Italic = False
			.Legend.Font.Underline = False
		end if

		tipo=2
		Select Case tipo
		Case 1
			.Type = c.chChartTypeArea
		Case 2
			.Type = c.chChartTypeAreaStacked
		Case 3
			.Type = c.chChartTypeBarClustered
		Case 4
			.Type = c.chChartTypeBarStacked
		Case 5
			.Type = c.chChartTypeBubble
		Case 6
			.Type = c.chChartTypeColumnClustered
		Case 7
			.Type = c.chChartTypeColumnStacked
		Case 8
			.Type = c.chChartTypeLine
		Case 9
			.Type = c.chChartTypeLineMarkers
		Case 10
			.Type = c.chChartTypeLineStacked
		Case 11
			.Type = c.chChartTypePie
		Case Default
			'.Type = c.chChartTypeArea3D
			'.Type = c.chChartTypeBar3D
			'.Type = c.chChartTypeColumn3D
			'.Type = c.chChartTypeColumnStacked3D
			'.Type = c.chChartTypeCombo
			'.Type = c.chChartTypeCombo3D
		End Select

		x=3
		ReDim catnom(x), valor(x)
		
		catnom(0) = "31/07/2002"
		valor(0) = 10
		catnom(1) = "01/08/2002"
		valor(1) = 20
		catnom(2) = "02/08/2002"
		valor(2) = 10
		catnom(3) = "03/08/2002"
		valor(3) = 15

		With .seriescollection.add
		
			.caption = "Pera"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 15
		catnom(1) = "01/08/2002"
		valor(1) = 10
		catnom(2) = "02/08/2002"
		valor(2) = 15
		catnom(3) = "03/08/2002"
		valor(3) = 30

		With .seriescollection.add
		
			.caption = "Maçã"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 40
		catnom(1) = "01/08/2002"
		valor(1) = 50
		catnom(2) = "02/08/2002"
		valor(2) = 45
		catnom(3) = "03/08/2002"
		valor(3) = 90

		With .seriescollection.add
		
			.caption = "Uva"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 11
		catnom(1) = "01/08/2002"
		valor(1) = 80
		catnom(2) = "02/08/2002"
		valor(2) = 77
		catnom(3) = "03/08/2002"
		valor(3) = 86

		With .seriescollection.add
		
			.caption = "Banana"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 2
		catnom(1) = "01/08/2002"
		valor(1) = 23
		catnom(2) = "02/08/2002"
		valor(2) = 69
		catnom(3) = "03/08/2002"
		valor(3) = 81

		With .seriescollection.add
		
			.caption = "Kiwi"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

		catnom(0) = "31/07/2002"
		valor(0) = 14
		catnom(1) = "01/08/2002"
		valor(1) = 16
		catnom(2) = "02/08/2002"
		valor(2) = 15
		catnom(3) = "03/08/2002"
		valor(3) = 14

		With .seriescollection.add
		
			.caption = "Laranja"
			.setdata c.chdimcategories,c.chdataliteral, catnom
			.setdata c.chdimvalues,c.chdataliteral, valor
		
		End With

	End With

	.border.color = c.chColorNone

	Set arquivo=Server.CreateObject("Scripting.FileSystemObject")
	arquivo=arquivo.GetTempname & ".gif"
	.ExportPicture Server.MapPath(caminho) &"/"& arquivo, "gif", 375, 200
	Response.Write "<img src="""&arquivo&""">"
End With
%></center>