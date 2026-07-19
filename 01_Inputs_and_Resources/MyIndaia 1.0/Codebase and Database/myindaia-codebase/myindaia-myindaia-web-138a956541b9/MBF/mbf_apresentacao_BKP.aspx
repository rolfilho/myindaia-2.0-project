<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Import Namespace="System.Web.UI.WebControls.FontInfo" %>
<%@ Page Language="VB" Debug="true"%>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<%      Response.CacheControl = "no-cache"%>
<%      Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">   
    Dim SqlAux As String
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim vCdGrupo, vCdMBF As String
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
    End Sub
    
    Sub VoltarMenu(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("usuario") = ""
        Session("nm_usuario") = ""
        Session("cd_menu") = ""
        Response.Redirect("/default.asp")
    End Sub
    
    Protected Sub ConfiguraGrafico(ByVal sender As Object, ByVal e As System.EventArgs)
        
    End Sub
    
    Protected Sub CriaGrafico(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim CnnAux, CnnAux2 As SqlConnection
        Dim CmdAux, CmdAux2 As SqlCommand
        Dim RsAux, RsAux2 As SqlDataReader
        Dim SqlAux2, NmCompleto, TpAgrupamento, CdKpi, NrProcesso As String
        Dim NewFont As New Drawing.Font("Tahoma", 7, Drawing.FontStyle.Bold)
        Dim NewFont2 As New Drawing.Font("Tahoma", 7)
        Dim I, NrMeta, TotalMes As Integer
               
        SqlAux = "  SELECT R.NM_COMPLETO, R.NM_KPI, R.CD_KPI, R.NM_QUEBRAS, I.IN_DECIMAL, I.IN_DESVIOS, ISNULL(R.NR_META, 0) AS NR_META, ISNULL(TP_AGRUPAMENTO, '1') AS TP_AGRUPAMENTO, " & _
        " (SELECT TOP 1 NR_PROCESSO " & _
        "  FROM TMBF_RESULTADO R1 " & _
        "  WHERE R1.CD_MBF = R.CD_MBF " & _
        "  AND R1.CD_USUARIO = R.CD_USUARIO " & _
        "  AND R1.NM_COMPLETO = R.NM_COMPLETO) AS PROCESSO" & _
        "  FROM TMBF_RESULTADO R                  " & _
        "    INNER JOIN TMBF_INFO I (NOLOCK) ON I.CD_MBF = R.CD_MBF AND I.CD_USUARIO = R.CD_USUARIO " & _
        "  WHERE R.CD_MBF = " & Request("codigo") & " " & _
        "    AND R.CD_USUARIO = '" & Request("usuario") & "' " & _
        "    AND R.NR_PROCESSO <> '9999XX-9999-99' " & _
        "  GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.NM_KPI, R.CD_KPI, R.NM_QUEBRAS, IN_DECIMAL, I.IN_DESVIOS, R.NR_META, I.TP_AGRUPAMENTO " & _
        "  ORDER BY R.NM_COMPLETO "
        
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        Do While RsAux.Read()
            Dim SqlGrafico As SqlDataSource = New SqlDataSource
            SqlGrafico.ConnectionString = Cnn
            NmCompleto = RsAux("NM_COMPLETO")
            NrProcesso = RsAux("PROCESSO")
            CdKpi = RsAux("CD_KPI")
            NrMeta = RsAux("NR_META")
            TpAgrupamento = RsAux("TP_AGRUPAMENTO")
            
            Select Case TpAgrupamento
                Case "1"
                    SqlAux2 = "  SELECT COUNT(MES_SELECIONADO) AS TOTAL" & _
                       " FROM TMBF_SELECIONADO " & _
                       " WHERE CD_MBF = " & Request("codigo") & " " & _
                       " AND CD_USUARIO = '" & Request("usuario") & "' " & _
                       " AND IN_GERADO = 1"
                    CnnAux2 = New SqlConnection(Cnn)
                    CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                    CnnAux2.Open()
                    RsAux2 = CmdAux2.ExecuteReader
                    RsAux2.Read()
                    TotalMes = RsAux2("TOTAL")
                    RsAux2.Close()
                    CmdAux2.Dispose()
                    CnnAux2.Close()
                    
                    SqlGrafico.SelectCommand = "  SELECT DISTINCT MASTER.DBO.FN_MONTHNAME_2(S.MES_SELECIONADO) + ' ('+  CONVERT(VARCHAR, S.ANO_SELECIONADO) + ')' AS MES, R.CD_KPI, R.NM_COMPLETO, S.ANO_SELECIONADO," & _
                    "  S.MES_SELECIONADO, (SUM(R.DIAS_KPI)/(SELECT COUNT(R1.NR_PROCESSO) " & _
                    "                                FROM TMBF_RESULTADO R1" & _
                    "                                WHERE R1.CD_MBF = R.CD_MBF" & _
                    "                                  AND R1.CD_USUARIO = R.CD_USUARIO" & _
                    "                                  AND R1.MES_RESULTADO = S.MES_SELECIONADO" & _
                    "                                  AND R1.ANO_RESULTADO = S.ANO_SELECIONADO" & _
                    "                                  AND R1.NM_COMPLETO = R.NM_COMPLETO)) AS TOTAL," & _
                    "                                  (SUM(M1.DIAS_KPI)/(SELECT COUNT(R1.NR_PROCESSO) " & _
                    "                                FROM TMBF_RESULTADO R1" & _
                    "                                WHERE R1.CD_MBF = R.CD_MBF" & _
                    "                                  AND R1.CD_USUARIO = R.CD_USUARIO" & _
                    "                                  AND R1.MES_RESULTADO = S.MES_SELECIONADO" & _
                    "                                  AND R1.ANO_RESULTADO = S.ANO_SELECIONADO" & _
                    "                                  AND R1.NM_COMPLETO = R.NM_COMPLETO)) AS TOTAL1 " & _
                    "                    FROM TMBF_SELECIONADO S " & _
                    "                      LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO " & _
                    "                                                         AND R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                    "                                                         AND R.CD_MBF = S.CD_MBF " & _
                    "                                                         AND R.CD_USUARIO = S.CD_USUARIO " & _
                    "                                                         AND R.NM_COMPLETO = '" & NmCompleto & "'" & _
                    "                                                         AND R.MES_RESULTADO IS NOT NULL " & _
                    "                      LEFT JOIN (SELECT M1.NM_COMPLETO, M1.DIAS_KPI, M1.NR_PROCESSO, M1.CD_KPI " & _
                    "                                 FROM TMBF_RESULTADO M1 " & _
                    "                                 WHERE M1.CD_MBF = " & Request("codigo") & "" & _
                    "                                   AND M1.IN_SELECIONADO = '1'" & _
                    "                                   AND M1.CD_USUARIO = '" & Request("usuario") & "') M1 ON M1.NM_COMPLETO = R.NM_COMPLETO " & _
                    "                                                                 AND M1.NR_PROCESSO = R.NR_PROCESSO " & _
                    "                                                                 AND M1.CD_KPI = R.CD_KPI " & _
                    "                    WHERE S.CD_USUARIO = '" & Request("usuario") & "' " & _
                    "                      AND S.CD_MBF = " & Request("codigo") & "" & _
                    "                    GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.CD_KPI, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO " & _
                    "                    ORDER BY S.ANO_SELECIONADO, S.MES_SELECIONADO, R.NM_COMPLETO "
                    
                Case "2"
                    SqlAux2 = " SELECT COUNT(DISTINCT " & _
                    " CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
                    " ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '2' " & _
                    "     ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '3'" & _
                    "          ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '4' " & _
                    "               END          " & _
                    "          END" & _
                    "     END " & _
                    " END + '/' + CONVERT(VARCHAR, ANO_SELECIONADO)) AS TOTAL" & _
                    " FROM TMBF_SELECIONADO S" & _
                    " WHERE CD_MBF = " & Request("codigo") & "" & _
                    " AND CD_USUARIO = '" & Request("usuario") & "'" & _
                    " AND IN_GERADO = 1"                    
                    CnnAux2 = New SqlConnection(Cnn)
                    CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                    CnnAux2.Open()
                    RsAux2 = CmdAux2.ExecuteReader
                    RsAux2.Read()
                    TotalMes = RsAux2("TOTAL")
                    RsAux2.Close()
                    CmdAux2.Dispose()
                    CnnAux2.Close()
                                        
                    SqlGrafico.SelectCommand = " SELECT MES, MES_AUX, CD_KPI, NM_COMPLETO, ANO_SELECIONADO, SUM(TOTAL) AS TOTAL, SUM(TOTAL1) AS TOTAL1 " & _
                    " FROM (SELECT DISTINCT " & _
                    " CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN 'Jan/Mar' " & _
                    " ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN 'Mai/Jun' " & _
                    "      ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN 'Jul/Set'" & _
                    "           ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN 'Out/Dez' " & _
                    "                END          " & _
                    "           END" & _
                    "      END " & _
                    " END + ' ('+ CONVERT(VARCHAR, S.ANO_SELECIONADO) + ')' AS MES, " & _
                    "                    CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
                    " ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '2' " & _
                    "     ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '3'" & _
                    "          ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '4' " & _
                    "                    END" & _
                    "                    END" & _
                    "                    END" & _
                    " END MES_AUX," & _
                    " ISNULL(R.CD_KPI,'" & CdKpi & "') AS CD_KPI, ISNULL(R.NM_COMPLETO, '" & NmCompleto & "') AS NM_COMPLETO, S.ANO_SELECIONADO, S.MES_SELECIONADO, " & _
                    " (SUM(R.DIAS_KPI)/(SELECT COUNT(R1.NR_PROCESSO) " & _
                    "                  FROM TMBF_RESULTADO R1 " & _
                    "                  WHERE R1.CD_MBF = R.CD_MBF " & _
                    "                    AND R1.CD_USUARIO = R.CD_USUARIO " & _
                    "                    AND R1.MES_RESULTADO = S.MES_SELECIONADO " & _
                    "                    AND R1.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                    "                    AND R1.NM_COMPLETO = R.NM_COMPLETO)) AS TOTAL, " & _
                    " (SUM(M1.DIAS_KPI)/(SELECT COUNT(R1.NR_PROCESSO) " & _
                    "                   FROM TMBF_RESULTADO R1 " & _
                    "                   WHERE R1.CD_MBF = R.CD_MBF " & _
                    "                     AND R1.CD_USUARIO = R.CD_USUARIO " & _
                    "                     AND R1.MES_RESULTADO = S.MES_SELECIONADO " & _
                    "                     AND R1.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                    "                     AND R1.NM_COMPLETO = R.NM_COMPLETO)) AS TOTAL1 " & _
                    " FROM TMBF_SELECIONADO S " & _
                    "  LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO " & _
                    "                                     AND R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                    "                                     AND R.CD_MBF = S.CD_MBF " & _
                    "                                     AND R.CD_USUARIO = S.CD_USUARIO " & _
                    "                                     AND R.NM_COMPLETO = '" & NmCompleto & "' " & _
                    "                                     AND R.MES_RESULTADO IS NOT NULL " & _
                    " LEFT JOIN (SELECT M1.NM_COMPLETO, M1.DIAS_KPI, M1.NR_PROCESSO, M1.CD_KPI " & _
                    "            FROM TMBF_RESULTADO M1 " & _
                    "            WHERE M1.CD_MBF = " & Request("codigo") & " " & _
                    "              AND M1.IN_SELECIONADO = '1' " & _
                    "              AND M1.CD_USUARIO = '" & Request("usuario") & "') M1 ON M1.NM_COMPLETO = R.NM_COMPLETO " & _
                    "                                                            AND M1.NR_PROCESSO = R.NR_PROCESSO " & _
                    "                                                            AND M1.CD_KPI = R.CD_KPI " & _
                    " WHERE S.CD_USUARIO = '" & Request("usuario") & "' " & _
                    "    AND S.CD_MBF = " & Request("codigo") & " " & _
                    " GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.CD_KPI, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA " & _
                    " GROUP BY MES, MES_AUX, CD_KPI, NM_COMPLETO, ANO_SELECIONADO" & _
                    " ORDER BY ANO_SELECIONADO, MES_AUX, NM_COMPLETO "
                Case "3"
                    SqlAux2 = " SELECT COUNT(DISTINCT " & _
                   " CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
                   " ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '1' " & _
                   "     ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '2'" & _
                   "          ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '2' " & _
                   "               END          " & _
                   "          END" & _
                   "     END " & _
                   " END + '/' + CONVERT(VARCHAR, ANO_SELECIONADO)) AS TOTAL" & _
                   " FROM TMBF_SELECIONADO S" & _
                   " WHERE CD_MBF = " & Request("codigo") & "" & _
                   " AND CD_USUARIO = '" & Request("usuario") & "'" & _
                   " AND IN_GERADO = 1"
                    CnnAux2 = New SqlConnection(Cnn)
                    CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                    CnnAux2.Open()
                    RsAux2 = CmdAux2.ExecuteReader
                    RsAux2.Read()
                    TotalMes = RsAux2("TOTAL")
                    RsAux2.Close()
                    CmdAux2.Dispose()
                    CnnAux2.Close()
                    
                    SqlGrafico.SelectCommand = " SELECT MES, MES_AUX, CD_KPI, NM_COMPLETO, ANO_SELECIONADO, SUM(TOTAL) AS TOTAL, SUM(TOTAL1) AS TOTAL1 " & _
                    " FROM (SELECT DISTINCT " & _
                    " CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN 'Jan/Jun' " & _
                    " ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN 'Jan/Jun' " & _
                    "      ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN 'Jul/Dez'" & _
                    "           ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN 'Jul/Dez' " & _
                    "                END          " & _
                    "           END" & _
                    "      END " & _
                    " END + ' ('+ CONVERT(VARCHAR, S.ANO_SELECIONADO) + ')' AS MES, " & _
                    "                    CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
                    " ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '1' " & _
                    "     ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '2'" & _
                    "          ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '2' " & _
                    "                    END" & _
                    "                    END" & _
                    "                    END" & _
                    " END MES_AUX," & _
                    " ISNULL(R.CD_KPI,'" & CdKpi & "') AS CD_KPI, ISNULL(R.NM_COMPLETO, '" & NmCompleto & "') AS NM_COMPLETO, S.ANO_SELECIONADO, S.MES_SELECIONADO, " & _
                    " (SUM(R.DIAS_KPI)/(SELECT COUNT(R1.NR_PROCESSO) " & _
                    "                  FROM TMBF_RESULTADO R1 " & _
                    "                  WHERE R1.CD_MBF = R.CD_MBF " & _
                    "                    AND R1.CD_USUARIO = R.CD_USUARIO " & _
                    "                    AND R1.MES_RESULTADO = S.MES_SELECIONADO " & _
                    "                    AND R1.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                    "                    AND R1.NM_COMPLETO = R.NM_COMPLETO)) AS TOTAL, " & _
                    " (SUM(M1.DIAS_KPI)/(SELECT COUNT(R1.NR_PROCESSO) " & _
                    "                   FROM TMBF_RESULTADO R1 " & _
                    "                   WHERE R1.CD_MBF = R.CD_MBF " & _
                    "                     AND R1.CD_USUARIO = R.CD_USUARIO " & _
                    "                     AND R1.MES_RESULTADO = S.MES_SELECIONADO " & _
                    "                     AND R1.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                    "                     AND R1.NM_COMPLETO = R.NM_COMPLETO)) AS TOTAL1 " & _
                    " FROM TMBF_SELECIONADO S " & _
                    "  LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO " & _
                    "                                     AND R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                    "                                     AND R.CD_MBF = S.CD_MBF " & _
                    "                                     AND R.CD_USUARIO = S.CD_USUARIO " & _
                    "                                     AND R.NM_COMPLETO = '" & NmCompleto & "' " & _
                    "                                     AND R.MES_RESULTADO IS NOT NULL " & _
                    " LEFT JOIN (SELECT M1.NM_COMPLETO, M1.DIAS_KPI, M1.NR_PROCESSO, M1.CD_KPI " & _
                    "            FROM TMBF_RESULTADO M1 " & _
                    "            WHERE M1.CD_MBF = " & Request("codigo") & " " & _
                    "              AND M1.IN_SELECIONADO = '1' " & _
                    "              AND M1.CD_USUARIO = '" & Request("usuario") & "') M1 ON M1.NM_COMPLETO = R.NM_COMPLETO " & _
                    "                                                            AND M1.NR_PROCESSO = R.NR_PROCESSO " & _
                    "                                                            AND M1.CD_KPI = R.CD_KPI " & _
                    " WHERE S.CD_USUARIO = '" & Request("usuario") & "' " & _
                    "    AND S.CD_MBF = " & Request("codigo") & " " & _
                    " GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.CD_KPI, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA " & _
                    " GROUP BY MES, MES_AUX, CD_KPI, NM_COMPLETO, ANO_SELECIONADO" & _
                    " ORDER BY ANO_SELECIONADO, MES_AUX, NM_COMPLETO "
                Case "0"
                    SqlAux2 = "  SELECT COUNT(DISTINCT ANO_SELECIONADO) AS TOTAL" & _
                      " FROM TMBF_SELECIONADO " & _
                      " WHERE CD_MBF = " & Request("codigo") & " " & _
                      " AND CD_USUARIO = '" & Request("usuario") & "' " & _
                      " AND IN_GERADO = 1"                    
                    CnnAux2 = New SqlConnection(Cnn)
                    CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                    CnnAux2.Open()
                    RsAux2 = CmdAux2.ExecuteReader
                    RsAux2.Read()
                    TotalMes = RsAux2("TOTAL")
                    RsAux2.Close()
                    CmdAux2.Dispose()
                    CnnAux2.Close()
                                        
                    SqlGrafico.SelectCommand = "  SELECT DISTINCT CONVERT(VARCHAR, S.ANO_SELECIONADO) AS MES, R.CD_KPI, R.NM_COMPLETO, S.ANO_SELECIONADO," & _
                    "  (SUM(R.DIAS_KPI)/(SELECT COUNT(R1.NR_PROCESSO) " & _
                    "                                FROM TMBF_RESULTADO R1" & _
                    "                                WHERE R1.CD_MBF = R.CD_MBF" & _
                    "                                  AND R1.CD_USUARIO = R.CD_USUARIO" & _
                    "                                  AND R1.ANO_RESULTADO = S.ANO_SELECIONADO" & _
                    "                                  AND R1.NM_COMPLETO = R.NM_COMPLETO)) AS TOTAL," & _
                    "                                  (SUM(M1.DIAS_KPI)/(SELECT COUNT(R1.NR_PROCESSO) " & _
                    "                                FROM TMBF_RESULTADO R1" & _
                    "                                WHERE R1.CD_MBF = R.CD_MBF" & _
                    "                                  AND R1.CD_USUARIO = R.CD_USUARIO" & _
                    "                                  AND R1.ANO_RESULTADO = S.ANO_SELECIONADO" & _
                    "                                  AND R1.NM_COMPLETO = R.NM_COMPLETO)) AS TOTAL1 " & _
                    "                    FROM TMBF_SELECIONADO S " & _
                    "                      LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                    "                                                         AND R.CD_MBF = S.CD_MBF " & _
                    "                                                         AND R.CD_USUARIO = S.CD_USUARIO " & _
                    "                                                         AND R.NM_COMPLETO = '" & NmCompleto & "'" & _
                    "                                                         AND R.MES_RESULTADO IS NOT NULL " & _
                    "                      LEFT JOIN (SELECT M1.NM_COMPLETO, M1.DIAS_KPI, M1.NR_PROCESSO, M1.CD_KPI " & _
                    "                                 FROM TMBF_RESULTADO M1 " & _
                    "                                 WHERE M1.CD_MBF = " & Request("codigo") & "" & _
                    "                                   AND M1.IN_SELECIONADO = '1'" & _
                    "                                   AND M1.CD_USUARIO = '" & Request("usuario") & "') M1 ON M1.NM_COMPLETO = R.NM_COMPLETO " & _
                    "                                                                 AND M1.NR_PROCESSO = R.NR_PROCESSO " & _
                    "                                                                 AND M1.CD_KPI = R.CD_KPI " & _
                    "                    WHERE S.CD_USUARIO = '" & Request("usuario") & "' " & _
                    "                      AND S.CD_MBF = " & Request("codigo") & "" & _
                    "                    GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.CD_KPI, R.NM_KPI, S.ANO_SELECIONADO " & _
                    "                    ORDER BY S.ANO_SELECIONADO, R.NM_COMPLETO "
            End Select
            'Response.Write(SqlGrafico.SelectCommand)
            'Response.End()
            
            Dim chtGrafico1 As Chart = New Chart
            chtGrafico1.Height = 300
            chtGrafico1.Width = 315
            chtGrafico1.Palette = ChartColorPalette.None
            chtGrafico1.DataSource = SqlGrafico
                      
            'AREA DO GRAFICO
            chtGrafico1.ChartAreas.Add("caGrafico" + CStr(I))
            chtGrafico1.ChartAreas.Item(0).AxisX.Interval = 1
            chtGrafico1.ChartAreas.Item(0).AxisX.Title = ""
            chtGrafico1.ChartAreas.Item(0).AxisX.IsLabelAutoFit = False
            chtGrafico1.ChartAreas.Item(0).AxisX.MajorGrid.Enabled = True
            chtGrafico1.ChartAreas.Item(0).AxisX.MajorGrid.Interval = 100
            chtGrafico1.ChartAreas.Item(0).AxisX.MajorTickMark.Enabled = True
            chtGrafico1.ChartAreas.Item(0).AxisX.MajorTickMark.Interval = 1
            chtGrafico1.ChartAreas.Item(0).AxisX.LabelStyle.Angle = "-30"
            chtGrafico1.ChartAreas.Item(0).AxisX.LabelStyle.Font = NewFont2
            
            'chtGrafico1.ChartAreas.Item(0).AxisY.Interval = 2
            chtGrafico1.ChartAreas.Item(0).AxisY.Minimum = 0
            chtGrafico1.ChartAreas.Item(0).AxisY.IsMarksNextToAxis = False
            chtGrafico1.ChartAreas.Item(0).AxisY.LineColor = Drawing.Color.Transparent
            chtGrafico1.ChartAreas.Item(0).AxisY.LineDashStyle = ChartDashStyle.NotSet
            chtGrafico1.ChartAreas.Item(0).AxisY.LineWidth = 0
            chtGrafico1.ChartAreas.Item(0).AxisY.IsLabelAutoFit = True
            chtGrafico1.ChartAreas.Item(0).AxisY.LabelStyle.Font = NewFont2
            
            'COLUNAS
            chtGrafico1.Series.Add("seGrafico" + CStr(I))
            chtGrafico1.Series.Item(0).XValueMember = "MES"
            chtGrafico1.Series.Item(0).YValueMembers = "TOTAL"
            chtGrafico1.Series.Item(0).IsValueShownAsLabel = True
            'chtGrafico1.Series.Item(0).Legend = "legenda_apresentacao" + CStr(I)
            'chtGrafico1.Series.Item(0).LegendText = "Com desvios"
            chtGrafico1.Series.Item(0)("PointWidth") = "0.4"
            chtGrafico1.Series.Item(0)("BarLabelStyle") = "Outside"
            chtGrafico1.Series.Item(0).LabelBackColor = Drawing.Color.White
            chtGrafico1.Series.Item(0).LabelBorderColor = Drawing.Color.DarkBlue
            chtGrafico1.Series.Item(0).LabelToolTip = "#VALY"
            chtGrafico1.Series.Item(0).Palette = ChartColorPalette.None
            chtGrafico1.Series.Item(0).Color = Drawing.Color.DarkBlue
            chtGrafico1.Series.Item(0).Font = NewFont2
            chtGrafico1.Series.Item(0).Url = "javascript:ExibeDesvios('" + "#INDEX" + "', '" + CdKpi + "', 1, '" + TpAgrupamento + "', '" + NrProcesso + "');"
            
            
            If RsAux("IN_DESVIOS") = "1" Then
                chtGrafico1.Series.Add("seGrafico2" + CStr(I))
                chtGrafico1.Series.Item(1).XValueMember = "MES"
                chtGrafico1.Series.Item(1).YValueMembers = "TOTAL1"
                chtGrafico1.Series.Item(1).IsValueShownAsLabel = True
                'chtGrafico1.Series.Item(1).Legend = "legenda_apresentacao" + CStr(I)
                'chtGrafico1.Series.Item(1).LegendText = "Sem desvios"
                chtGrafico1.Series.Item(1)("PointWidth") = "0.4"
                chtGrafico1.Series.Item(1)("BarLabelStyle") = "Outside"
                chtGrafico1.Series.Item(1).LabelBackColor = Drawing.Color.White
                chtGrafico1.Series.Item(1).LabelBorderColor = Drawing.Color.PaleGreen
                chtGrafico1.Series.Item(1).LabelToolTip = "#VALY"
                chtGrafico1.Series.Item(1).Palette = ChartColorPalette.None
                chtGrafico1.Series.Item(1).Color = Drawing.Color.PaleGreen
                chtGrafico1.Series.Item(1).Font = NewFont2
                chtGrafico1.Series("seGrafico2" + CStr(I)).Url = "javascript:ExibeDesvios('" + "#INDEX" + "', '" + CdKpi + "', 0, '" + TpAgrupamento + "', '" + NrProcesso +"');"
            End If
            
            If RsAux("IN_DECIMAL") = "1" Then
                chtGrafico1.Series.Item(0).LabelFormat = "0.0"
                If RsAux("IN_DESVIOS") = "1" Then
                    chtGrafico1.Series.Item(1).LabelFormat = "0.0"
                End If
            Else
                chtGrafico1.Series.Item(0).LabelFormat = "0"
                If RsAux("IN_DESVIOS") = "1" Then
                    chtGrafico1.Series.Item(1).LabelFormat = "0"
                End If
            End If
            
            'META
            If NrMeta <> 0 Then
                Dim hla As HorizontalLineAnnotation = New HorizontalLineAnnotation
                hla.AxisX = chtGrafico1.ChartAreas.Item(0).AxisX
                hla.AxisY = chtGrafico1.ChartAreas.Item(0).AxisY
                hla.ClipToChartArea = chtGrafico1.ChartAreas.Item(0).Name
                hla.IsInfinitive = True
                hla.AnchorY = NrMeta
                hla.LineWidth = 3
                hla.LineColor = Drawing.Color.Red
                hla.LineDashStyle = ChartDashStyle.Dot
                chtGrafico1.Annotations.Add(hla)
                
                Dim ta As TextAnnotation = New TextAnnotation
                ta.AxisX = chtGrafico1.ChartAreas.Item(0).AxisX
                ta.AxisY = chtGrafico1.ChartAreas.Item(0).AxisY
                ta.ClipToChartArea = chtGrafico1.ChartAreas.Item(0).Name
                ta.AnchorY = NrMeta
                ta.AnchorX = TotalMes
                ta.AnchorAlignment = Drawing.ContentAlignment.TopLeft
                ta.Text = NrMeta
                ta.Font = NewFont
                ta.ForeColor = Drawing.Color.Red
                chtGrafico1.Annotations.Add(ta)
            End If
            
            'TITULO
            chtGrafico1.Titles.Add("ttGrafico" + CStr(I))
            chtGrafico1.Titles.Item(0).Text = RsAux("NM_KPI") & Environment.NewLine & RsAux("NM_QUEBRAS")
            pnlGrafico.Controls.Add(chtGrafico1)
            I = I + 1
        Loop
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>MyIndaiá Web System - Version 3.00.00</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script language="JavaScript" type="text/javascript">
//<![CDATA[
        var tl_loc0 = (window.location.protocol == "https:") ? "https://secure.comodo.net/trustlogo/javascript/trustlogo.js" :
"http://www.trustlogo.com/trustlogo/javascript/trustlogo.js";
        document.writeln('<scr' + 'ipt language="JavaScript" src="' + tl_loc0 + '" type="text\/javascript">' + '<\/scr' + 'ipt>');
//]]>
</script>
<style type="text/css">
.gridtit {
	color: #FFFFFF;
	text-align: center;
	background: #cd1414;
	border:0;
    Font-size:10px;
}

.divInfo {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	display: none;
	z-index: 3;
	overflow: auto;
	border: solid 2px #4fcc4f;
	background-color: #FFFFFF;
	scrollbar-face-color: #FFFFFF;
	scrollbar-track-color: #e6e9ec;
	scrollbar-arrow-color: #4fcc4f;
	scrollbar-shadow-color: #f0f1f6;
	scrollbar-3dlight-color: #f0f1f6;
	scrollbar-highlight-color: #f0f1f6;
	scrollbar-darkshadow-color: #f0f1f6;
}

.divInfo2 {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	display: none;
	z-index: 3;
	overflow: auto;
	border: solid 2px #000081;
	background-color: #FFFFFF;
	scrollbar-face-color: #FFFFFF;
	scrollbar-track-color: #e6e9ec;
	scrollbar-arrow-color: #000081;
	scrollbar-shadow-color: #f0f1f6;
	scrollbar-3dlight-color: #f0f1f6;
	scrollbar-highlight-color: #f0f1f6;
	scrollbar-darkshadow-color: #f0f1f6;
}
.divDetalhes {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	z-index: 3;
	overflow: auto;
	border-width:0px 2px 2px 2px;
	border-style:solid;
	border-color:#808080;
	background-color: #e6e9ec;
	margin: 0 auto;
}

.divDetalhes3 {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	z-index: 3;
	overflow: auto;
	border-width:2px 2px 2px 2px;
	border-style:solid;
	border-color:#374BAE;
	background-color: #f0f1f6;
	margin: 0 auto;
}

.divDetalhes2 {
	background-color:#f0f1f6;
	width:350px;
	height:90px;
	position:absolute;
	border-width:1px;
	border-color:#b4c7db;
	border-style:solid;
	display:none;
	z-index:3;
	margin: 0 auto;
}

.body
{
	scrollbar-face-color: #FFFFFF;
	scrollbar-track-color: #e6e9ec;
	scrollbar-arrow-color: #cd1414;
	scrollbar-shadow-color: #f0f1f6;
	scrollbar-3dlight-color: #f0f1f6;
	scrollbar-highlight-color: #f0f1f6;
	scrollbar-darkshadow-color: #f0f1f6;
	overflow:hidden;	
}

.textbox{ 
Font-size:10px; 
Font-family:Verdana; 
border-color:#808080;
border-style:solid;
border-width:1px;
overflow:hidden;
text-transform:uppercase;
}

.lbl
{
	text-align:left;
	vertical-align:top;
	font-family:Verdana;
}

.btn{
Font-size:10px; 
height:16px;
width:17px;
Font-family:verdana; 
background-color:#FFFFFF;
border-color:#000000;
border-style:solid;
border-width:1px;
}

.nounderline a:link
{
text-decoration:none;
}

.divDados{
width:600px;
height:14px;
font-size:11px;
font-weight:bold;
text-align:center;
color:#7089A2;
}

 .th  {
 position : relative;
}

</style> 
<script type="text/javascript">
    var NS4 = (document.layers);
    var IE4 = (document.all);
    var win = this;
    var n = 0;

    function Trim(str) { return str.replace(/^\s+|\s+$/g, ""); }

    function validarData(campo, valor) {
        var date = valor;
        if (Trim(date) != '') {
            var ardt = new Array;
            var ExpReg = new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
            ardt = date.split("/");
            erro = false;
            if (date.search(ExpReg) == -1) {
                erro = true;
            }
            else if (((ardt[1] == 4) || (ardt[1] == 6) || (ardt[1] == 9) || (ardt[1] == 11)) && (ardt[0] > 30))
                erro = true;
            else if (ardt[1] == 2) {
                if ((ardt[0] > 28) && ((ardt[2] % 4) != 0))
                    erro = true;
                if ((ardt[0] > 29) && ((ardt[2] % 4) == 0))
                    erro = true;
            }
            if (erro) {
                alert("ATENÇÃO: Data inválida!");
                campo.focus();
                campo.value = "";
                return false;
            }
            return true;
        }
    }


    function findInPage(str) {
        var txt, i, found;

        if (str == "") return false;

        if (NS4) {
            if (!win.find(str))
                while (win.find(str, false, true)) n++;
            else
                n++;
            if (n == 0) alert(str + " não está nesta página.");
        }

        if (IE4) {
            txt = win.document.body.createTextRange();
            for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
                txt.moveStart("character", 1);
                txt.moveEnd("textedit");
            }
            if (found) {
                txt.moveStart("character", -1);
                txt.findText(str);
                txt.select();
                txt.scrollIntoView();
                n++;
            }
            else {
                if (n > 0) {
                    n = 0;
                    findInPage(str);
                }
                else
                    alert(str + " não foi encontrado nesta página.");
            }
        }
        return false;
    }

    function Left(str, n) {
        if (n <= 0)
            return "";
        else if (n > String(str).length)
            return str;
        else
            return String(str).substring(0, n);
    }

    function Right(str, n) {
        if (n <= 0)
            return "";
        else if (n > String(str).length)
            return str;
        else {
            var iLen = String(str).length;
            return String(str).substring(iLen, iLen - n);
        }
    }

    function openAjax() {
        var ajax;
        try {
            ajax = new XMLHttpRequest(); // XMLHttpRequest para browsers decentes, como: Firefox, Safari, dentre outros.
        }
        catch (ee) {
            try {
                ajax = new ActiveXObject("Msxml2.XMLHTTP"); // Para o IE da MS
            }
            catch (e) {
                try {
                    ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Para o IE da MS
                }
                catch (E) {
                    ajax = false;
                }
            }
        }
        return ajax;
    }

    function enviaValor(valor, tabela) {        
        if (tabela == 'TGRUPO') {
            document.getElementById('txtCdGrupo').value = valor;
            document.getElementById('txtCdGrupo').focus();
            document.getElementById('txtCdGrupo').blur();
        }
        FechaDetalhes('divInfoCorpo', 'divInfo');
    }

    function preencheNome(vTabela, vCampos, vReturn, vCodigo, vEdit) {
        if (document.getElementById) {
            var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
            var vCod = vCodigo.value; //código que iremos pesquisar na tabela
            vDesc.value = "";
            //alert(Left(vCod, 1));
            if (Left(vCod, 1) != ' ' && vCod != '' && vCod != undefined) {
                vCod = vCod.replace(" ", "");
                if (vCod.length > 0 && vCod != 0) {
                    for (i = vCod.length; i < vCodigo.maxLength; i++)
                        vCod = '0' + String(vCod);
                    vCodigo.value = vCod;
                    //iniciamos a busca através do ajax
                    var ajax = openAjax();
                    //alert("/popup/fast_lookup.asp?vTabela=" + vTabela + "&vCampos=" + vCampos + "&vReturn=" + vReturn + "&vCodigo=" + vCod);
                    ajax.open("GET", "/popup/fast_lookup.asp?vTabela=" + vTabela + "&vCampos=" + vCampos + "&vReturn=" + vReturn + "&vCodigo=" + vCod, true);
                    ajax.onreadystatechange = function () {
                        if (ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
                            vDesc.value = "processando...";
                        }
                        if (ajax.readyState == 4) { //agora exibe o que interessa
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText; //resultado da busca
                                if (vResult.indexOf('erro') != 0) {
                                    vResult = vResult.replace(/\+/g, " "); //resolve problemas de acentos
                                    vResult = unescape(vResult); //continua resolvendo problemas de acento                                    
                                    vCodigo.style.background = 'white';
                                    vDesc.value = vResult.toUpperCase();
                                } else {
                                    alert('ATENÇÃO: Código Inválido!\nUtilize a consulta para encontrar o código correto.');
                                    vCodigo.style.background = 'red';
                                    vDesc.value = "";
                                }
                            } else {
                                alert('Ocorreu um erro desconhecido, entre em contato com suporte@myindaia.com.br!');
                                vDesc.value = "";
                            }
                        }
                    }
                    ajax.send(null); // submete
                }
                else if (vCod != '') {
                    alert('Ocorreu um erro de envio de dados, entre em contato com suporte@myindaia.com.br!');
                    vDesc.value = ""
                }
            }
        }
    }

    function ExibeDetalhes(titulo, vDiv, vDiv2, vDiv3, vFeatures, arquivo, width, height, posicao) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = width;
            var z = height;

            var vCorpo = document.getElementById(vDiv);
            var vInfo = document.getElementById(vDiv2);
            var vTitulo = document.getElementById('divTitulo');
            var vInfoRodape = document.getElementById(vDiv3);
            var vPesquisa = document.getElementById('divPesquisa');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vInfo.style.width = w;
            vInfo.style.height = 50;
            vInfo.style.left = (x2) + 54;
            vInfo.style.top = ((y4) / 2) - 20 + 118;
            vInfo.style.display = "block";
            vInfo.style.filter = "alpha(opacity=95)";
            vTitulo.style.width = w - 25;
            vTitulo.innerHTML = "&nbsp;" + titulo;

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2) + 54;
            vCorpo.style.top = ((y4) / 2) + 140;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";


            var ajax = openAjax();
            ajax.open('POST', arquivo + '.aspx?' + vFeatures + '&usuario=<%=Session("usuario") %>', true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/30/loading3.gif'></center></div>";
                }
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        vCorpo.innerHTML = vResult;
                        var scripts = vCorpo.getElementsByTagName("script");
                        for (i = 0; i < scripts.length; i++) {
                            s = scripts[i].innerHTML;
                            eval(s);
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
        document.getElementById('txtPesquisa').value = '';
        document.getElementById('txtPesquisa').focus();
    }

    function FechaDetalhes(vDiv1, vDiv2) {
        n = 0;
        if (document.getElementById) {
            var div = document.getElementById(vDiv1);
            var div2 = document.getElementById(vDiv2);
            div.style.display = "none";
            div2.style.display = "none";
        }
    }


    function carrega_pagina() {
        var altura = screen.height;
        var divGrafico = document.getElementById("divGraficoMBF")
        divGrafico.style.height = altura - 270;            
    }

    function carregaTelaCheia(objeto) {
        var altura = screen.height;
        var divGrafico = document.getElementById("divGraficoMBF")
        if (objeto.checked) {
            divGrafico.style.height = altura - 120;
        } else {
            divGrafico.style.height = altura - 270;      
        }
    }

    function ExibeDesvios(posicao, kpi, tipo, tp_agrupamento, processo) {
        if (document.getElementById) {
            fechaDesvios();
            var usuario = '<%=Request.QueryString("usuario") %>'
            var cd_mbf = '<%=Request.QueryString("codigo") %>'
            var vCorpo
            var vTitulo
            var gif

            var x = screen.width;
            var y = screen.height;
            var w = 400;
            var z = 250;

            if (tipo == 0) {
                vCorpo = document.getElementById('divDesvios');
                vTitulo = document.getElementById('divDesviosTitulo');
                gif = 'verde';
            } else {
                vCorpo = document.getElementById('divProcessos');
                vTitulo = document.getElementById('divProcessosTitulo');
                gif = 'azul';
            }

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vTitulo.style.width = w;
            vTitulo.style.height = 16;
            vTitulo.style.left = (x2);
            vTitulo.style.top = ((y4) / 2) - 2 - 16 + 100;
            vTitulo.style.display = "block";
            vTitulo.style.filter = "alpha(opacity=95)";

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2);
            vCorpo.style.top = ((y4) / 2) - 2 + 100;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open('POST', 'mbf_desvios.aspx?cd_mbf=' + cd_mbf + '&usuario=' + usuario + '&processo=' + processo + '&contador=' + posicao + '&tipo=' + tipo + '&agrupamento=' + tp_agrupamento + '&cd_kpi=' + kpi , true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/30/loading_" + gif +".gif'></center></div>";
                }
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        vCorpo.innerHTML = vResult;
                        var scripts = vCorpo.getElementsByTagName("script");
                        for (i = 0; i < scripts.length; i++) {
                            s = scripts[i].innerHTML;
                            eval(s);
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
    }

    function fechaDesvios() {
        if (document.getElementById("divDesvios").style.display == 'block') {
            document.getElementById("divDesviosTitulo").style.display = 'none';
            document.getElementById("divDesvios").style.display = 'none';
        } else {
            if (document.getElementById("divProcessos").style.display == 'block') {
              document.getElementById("divProcessosTitulo").style.display = 'none';
              document.getElementById("divProcessos").style.display = 'none';
            }
        }
    }
</script> 
</head>
<body class="body" style="text-align:center;background-color:#f0f1f6;margin:0px 0px 0px 0px;width:100%;" onload="carrega_pagina();">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td height="66" background="/imagens/fundo_logo_site2.jpg"><img src="/imagens/logo_site2.jpg"  border="0"/></td><td style="text-align:right;" background="/imagens/fundo_logo_site2.jpg"><img src="../../imagens/cabec_logos_mbf2.gif"/>&nbsp;&nbsp;&nbsp;</td></tr>	
    <tr><td colspan="2" background="/imagens/fundo_logo_site8.jpg" height="6px"></td></tr>
  </table>
  <form id="frmGraficoMBF" runat="server" style="background-color:#f0f1f6;text-align:left;width:100%;text-align:center;margin-left:-99%;">
  <asp:ScriptManager ID="smMBF" runat="server"/>
    <div id="divDesviosTitulo" style="background-color:#aeffae;color:#FFFFFF;position:absolute;display:none;padding-left:5px;font-family:Verdana;font-size:8pt;font-weight:bold;border-color:#4fcc4f;border-width:2px;border-style:solid;border-bottom-width:0px;z-index:5;">&nbsp;<div style="right:3px;position:absolute;"><img src="/imagens/30/btn_fechar_verde.gif" style="cursor:pointer;vertical-align:middle;" onclick="fechaDesvios();" alt="Fechar"/></div></div>
    <div id="divDesvios" class="divInfo" style="background-color:#aeffae;text-align:center;border-top-width:0px;vertical-align:top;"></div>                           
    <div id="divProcessosTitulo" style="background-color:#c6c6ff;color:#FFFFFF;position:absolute;display:none;padding-left:5px;font-family:Verdana;font-size:8pt;font-weight:bold;border-color:#000081;border-width:2px;border-style:solid;border-bottom-width:0px;z-index:5;">&nbsp;<div style="right:3px;position:absolute;"><img src="/imagens/30/btn_fechar_azul.gif" style="cursor:pointer;vertical-align:middle;" onclick="fechaDesvios();" alt="Fechar"/></div></div>
    <div id="divProcessos" class="divInfo2" style="background-color:#c6c6ff;text-align:center;border-top-width:0px;vertical-align:top;"></div>                               
    <div id="divGrafico" style="border-width:0px;position:absolute;top:75px;text-align:left;">
    <div id="divGraficoMBFCabec" style="background-color:#cd1414;border-color:#cd1414;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divCriaMBFLink" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;">Gráficos MBF</a></center></div>    
    <div id="divGraficoMBF" style="background-color:#FFFFFF;border-color:#cd1414;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:99%;text-align:left;overflow-y:scroll;">
      <span style="font-family:Verdana;font-size:9pt;right:10;position:absolute;">
      <input id="cbTelaCheia" type="checkbox" onclick="javascript:carregaTelaCheia(this);" style="text-align:right;vertical-align:absmiddle;"/>Tela cheia
      </span>
      <span style="font-family:Verdana;font-size:9pt;">      
      <img src="/imagens/30/com_desvios.gif"/>&nbsp;Com desvios&nbsp;&nbsp;
      <img src="/imagens/30/sem_desvios.gif"/>&nbsp;Sem desvios&nbsp;&nbsp;
      <img src="/imagens/30/meta.gif"/>&nbsp;Meta</span>
      <br />
      <asp:Panel runat="server" ID="pnlGrafico" OnLoad="CriaGrafico"></asp:Panel>
    </div>
  </div>
  </form>
</body>
</html>
