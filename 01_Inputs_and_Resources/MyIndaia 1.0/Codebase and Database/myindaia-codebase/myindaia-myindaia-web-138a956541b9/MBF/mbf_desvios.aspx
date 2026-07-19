<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
    
    
</script>
  <%  
             Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
             Dim SqlAux, SqlAux2, SqlAux3 As String
      Dim bgcolor, contador, contador2, tipo, tipo2, usuario, cd_mbf, cd_kpi, agrupamento, NrProcesso, NmCompleto As String
             Dim mes, mes_aux, ano, cor_fundo, cor_fundo2, cor_kpi, txLinkProcesso, cd_produto, cd_tp_kpi, id_kpi, pagina, pagina_max As String
             Dim I, MaxContador, QtdeMeses As Integer

             cd_kpi = Request.QueryString("cd_kpi")
             cd_tp_kpi = Request.QueryString("cd_tp_kpi")
             id_kpi = Request.QueryString("id_kpi")
             cd_mbf = Request.QueryString("cd_mbf")
             usuario = Request.QueryString("usuario")
      contador = Request.QueryString("contador")
      contador2 = Request.QueryString("contador")
      tipo = Request.QueryString("tipo")
      tipo2 = Request.QueryString("tipo2")
             agrupamento = Request.QueryString("agrupamento")
             NrProcesso = Trim(Request.QueryString("processo"))
             NmCompleto = ""
             cd_produto = Request.QueryString("produto")
             pagina = Request.QueryString("pagina")
             QtdeMeses = Request.QueryString("qtde_meses")
                  
             bgcolor = "#ffcccc"
             I = 0
             
      If tipo = "2" Then
          cor_fundo2 = "#a5d4e3"
          cor_fundo = "#24acd8"
      Else                    
          cor_fundo = "#000081"
          cor_fundo2 = "#d6d6fc"
      End If
             
      Select Case agrupamento
          Case "1"
              If Left(NrProcesso, 1) = "#" Then                 
                  SqlAux3 = " SELECT TOP 1 ISNULL(NM_COMPLETO,'') NM_COMPLETO, CONTADOR  " & _
                       " FROM (SELECT DISTINCT '" & Right(NrProcesso, Len(NrProcesso) - 1) & "' NM_COMPLETO, S.ANO_SELECIONADO, S.MES_SELECIONADO, " & _
                       " DENSE_RANK() OVER(ORDER BY CASE ISNULL(R.NM_COMPLETO, '') WHEN '' THEN 0 ELSE 1 END, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS CONTADOR" & _
                       " FROM TMBF_SELECIONADO S (NOLOCK) " & _
                       " LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO " & _
                       "                                   AND R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                       "                                   AND R.CD_MBF = S.CD_MBF " & _
                       "                                   AND R.CD_USUARIO = S.CD_USUARIO " & _
                       "                                   AND R.NM_COMPLETO IN ('" & Right(NrProcesso, Len(NrProcesso) - 1) & "')" & _
                       "                                   AND R.MES_RESULTADO IS NOT NULL " & _
                       " WHERE S.CD_USUARIO = '" & usuario & "'  " & _
                       "  AND S.CD_MBF = " & cd_mbf & " " & _
                       "  AND S.IN_GERADO = 1 " & _
                       " GROUP BY R.NM_COMPLETO, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA" & _
                       " ORDER BY CONTADOR DESC, ANO_SELECIONADO, MES_SELECIONADO"
              Else
                  SqlAux3 = " SELECT TOP 1 ISNULL(NM_COMPLETO,'') NM_COMPLETO, CONTADOR  " & _
                        " FROM (SELECT DISTINCT R.NM_COMPLETO, S.ANO_SELECIONADO, S.MES_SELECIONADO, " & _
                        " DENSE_RANK() OVER(ORDER BY CASE ISNULL(R.NM_COMPLETO, '') WHEN '' THEN 0 ELSE 1 END, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS CONTADOR" & _
                        " FROM TMBF_SELECIONADO S (NOLOCK) " & _
                        " LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO " & _
                        "                                   AND R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                        "                                   AND R.CD_MBF = S.CD_MBF " & _
                        "                                   AND R.CD_USUARIO = S.CD_USUARIO " & _
                        "                                   AND R.NM_COMPLETO IN (SELECT NM_COMPLETO " & _
                        "                                                         FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                        "                                                         WHERE R1.CD_MBF = R.CD_MBF " & _
                        "                                                           AND R1.CD_USUARIO = R.CD_USUARIO " & _
                        "                                                           AND R1.ANO_RESULTADO = R.ANO_RESULTADO " & _
                        "                                                           AND R1.MES_RESULTADO = R.MES_RESULTADO " & _
                        "                                                           AND R1.NR_PROCESSO = '" & NrProcesso & "' " & _
                        "                                                           AND R1.CD_KPI = '" & cd_kpi & "'" & _
                        "                                                           AND R1.ID_KPI = '" & id_kpi & "'" & _
                        "                                                           AND R1.CD_TP_KPI = '" & cd_tp_kpi & "')" & _
                        "                                   AND R.MES_RESULTADO IS NOT NULL " & _
                        " WHERE S.CD_USUARIO = '" & usuario & "'  " & _
                        "  AND S.CD_MBF = " & cd_mbf & " " & _
                        "  AND S.IN_GERADO = 1 " & _
                        " GROUP BY R.NM_COMPLETO, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA" & _
                        " ORDER BY CONTADOR DESC, ANO_SELECIONADO, MES_SELECIONADO"
              End If
          Case "2"
              If Left(NrProcesso, 1) = "#" Then
                  SqlAux3 = "SELECT TOP 1 ISNULL(NM_COMPLETO,'') NM_COMPLETO, CONTADOR  FROM (NOLOCK) " & _
                    "             (SELECT DISTINCT MES_AUX AS MES_SELECIONADO, ANO_SELECIONADO, " & _
                    "              DENSE_RANK() OVER(ORDER BY ANO_SELECIONADO, MES_AUX) CONTADOR, NM_COMPLETO " & _
                    "              FROM (SELECT DISTINCT " & _
                    "              CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '2'" & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '3'" & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '4' " & _
                    "              END END END END MES_AUX," & _
                    "              '" & Right(NrProcesso, Len(NrProcesso) - 1) & "' AS NM_COMPLETO, S.ANO_SELECIONADO" & _
                    "              FROM TMBF_SELECIONADO S (NOLOCK) " & _
                    "              LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO" & _
                    "                                                 AND R.ANO_RESULTADO = S.ANO_SELECIONADO" & _
                    "                                                 AND R.CD_MBF = S.CD_MBF" & _
                    "                                                 AND R.CD_USUARIO = S.CD_USUARIO" & _
                    "                                                 AND R.NM_COMPLETO IN ('" & Right(NrProcesso, Len(NrProcesso) - 1) & "')" & _
                    "                                                  AND R.MES_RESULTADO IS NOT NULL" & _
                    "              WHERE S.CD_USUARIO = '" & usuario & "' " & _
                    "                AND S.CD_MBF = " & cd_mbf & "" & _
                    "              GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA" & _
                    "              GROUP BY MES_AUX, NM_COMPLETO, ANO_SELECIONADO) AS TABELA2" & _
                    "              ORDER BY CONTADOR DESC, ANO_SELECIONADO, MES_SELECIONADO"
              Else
                  SqlAux3 = "SELECT TOP 1 ISNULL(NM_COMPLETO,'') NM_COMPLETO, CONTADOR  FROM " & _
                    "             (SELECT DISTINCT MES_AUX AS MES_SELECIONADO, ANO_SELECIONADO, " & _
                    "              DENSE_RANK() OVER(ORDER BY ANO_SELECIONADO, MES_AUX) CONTADOR, NM_COMPLETO " & _
                    "              FROM (SELECT DISTINCT " & _
                    "              CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '2'" & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '3'" & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '4' " & _
                    "              END END END END MES_AUX," & _
                    "              ISNULL(R.NM_COMPLETO, '') AS NM_COMPLETO, S.ANO_SELECIONADO" & _
                    "              FROM TMBF_SELECIONADO S (NOLOCK) " & _
                    "              LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO" & _
                    "                                                 AND R.ANO_RESULTADO = S.ANO_SELECIONADO" & _
                    "                                                 AND R.CD_MBF = S.CD_MBF" & _
                    "                                                 AND R.CD_USUARIO = S.CD_USUARIO" & _
                    "                                                 AND R.NM_COMPLETO IN (SELECT NM_COMPLETO " & _
                    "                                                                   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                    "                                                                   WHERE R1.CD_MBF = R.CD_MBF " & _
                    "                                                                     AND R1.CD_USUARIO = R.CD_USUARIO " & _
                    "                                                                     AND R1.ANO_RESULTADO = R.ANO_RESULTADO " & _
                    "                                                                     AND R1.MES_RESULTADO = R.MES_RESULTADO " & _
                    "                                                                     AND R1.NR_PROCESSO = '" & NrProcesso & "' " & _
                    "                                                                     AND R1.CD_KPI = '" & cd_kpi & "'" & _
                    "                                                                     AND R1.ID_KPI = '" & id_kpi & "'" & _
                    "                                                                     AND R1.CD_TP_KPI = '" & cd_tp_kpi & "')" & _
                    "                                                  AND R.MES_RESULTADO IS NOT NULL" & _
                    "              WHERE S.CD_USUARIO = '" & usuario & "' " & _
                    "                AND S.CD_MBF = " & cd_mbf & "" & _
                    "              GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA" & _
                    "              GROUP BY MES_AUX, NM_COMPLETO, ANO_SELECIONADO) AS TABELA2" & _
                    "              ORDER BY CONTADOR DESC, ANO_SELECIONADO, MES_SELECIONADO"
              End If
          Case "3"
              If Left(NrProcesso, 1) = "#" Then
                  SqlAux3 = "SELECT TOP 1 ISNULL(NM_COMPLETO,'') NM_COMPLETO, CONTADOR  FROM " & _
                    "             (SELECT DISTINCT MES_AUX AS MES_SELECIONADO, ANO_SELECIONADO, " & _
                    "              DENSE_RANK() OVER(ORDER BY ANO_SELECIONADO, MES_AUX) CONTADOR, NM_COMPLETO " & _
                    "              FROM (SELECT DISTINCT " & _
                    "              CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '1'" & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '2'" & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '2' " & _
                    "              END END END END MES_AUX," & _
                    "              '" & Right(NrProcesso, Len(NrProcesso) - 1) & "' AS NM_COMPLETO, S.ANO_SELECIONADO" & _
                    "              FROM TMBF_SELECIONADO S (NOLOCK) " & _
                    "              LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO" & _
                    "                                                 AND R.ANO_RESULTADO = S.ANO_SELECIONADO" & _
                    "                                                 AND R.CD_MBF = S.CD_MBF" & _
                    "                                                 AND R.CD_USUARIO = S.CD_USUARIO" & _
                    "                                                 AND R.NM_COMPLETO IN ('" & Right(NrProcesso, Len(NrProcesso) - 1) & "')" & _
                    "                                                  AND R.MES_RESULTADO IS NOT NULL" & _
                    "              WHERE S.CD_USUARIO = '" & usuario & "' " & _
                    "                AND S.CD_MBF = " & cd_mbf & "" & _
                    "              GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA" & _
                    "              GROUP BY MES_AUX, NM_COMPLETO, ANO_SELECIONADO) AS TABELA2" & _
                    "              ORDER BY CONTADOR DESC, ANO_SELECIONADO, MES_SELECIONADO"
              Else
                  SqlAux3 = "SELECT TOP 1 ISNULL(NM_COMPLETO,'') NM_COMPLETO, CONTADOR  FROM " & _
                    "             (SELECT DISTINCT MES_AUX AS MES_SELECIONADO, ANO_SELECIONADO, " & _
                    "              DENSE_RANK() OVER(ORDER BY ANO_SELECIONADO, MES_AUX) CONTADOR, NM_COMPLETO " & _
                    "              FROM (SELECT DISTINCT " & _
                    "              CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '1'" & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '2'" & _
                    "              ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '2' " & _
                    "              END END END END MES_AUX," & _
                    "              ISNULL(R.NM_COMPLETO, '') AS NM_COMPLETO, S.ANO_SELECIONADO" & _
                    "              FROM TMBF_SELECIONADO S (NOLOCK) " & _
                    "              LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO" & _
                    "                                                 AND R.ANO_RESULTADO = S.ANO_SELECIONADO" & _
                    "                                                 AND R.CD_MBF = S.CD_MBF" & _
                    "                                                 AND R.CD_USUARIO = S.CD_USUARIO" & _
                    "                                                 AND R.NM_COMPLETO IN (SELECT NM_COMPLETO " & _
                    "                                                                   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                    "                                                                   WHERE R1.CD_MBF = R.CD_MBF " & _
                    "                                                                     AND R1.CD_USUARIO = R.CD_USUARIO " & _
                    "                                                                     AND R1.ANO_RESULTADO = R.ANO_RESULTADO " & _
                    "                                                                     AND R1.MES_RESULTADO = R.MES_RESULTADO " & _
                    "                                                                     AND R1.NR_PROCESSO = '" & NrProcesso & "' " & _
                    "                                                                     AND R1.CD_KPI = '" & cd_kpi & "'" & _
                    "                                                                     AND R1.ID_KPI = '" & id_kpi & "'" & _
                    "                                                                     AND R1.CD_TP_KPI = '" & cd_tp_kpi & "')" & _
                    "                                                  AND R.MES_RESULTADO IS NOT NULL" & _
                    "              WHERE S.CD_USUARIO = '" & usuario & "' " & _
                    "                AND S.CD_MBF = " & cd_mbf & "" & _
                    "              GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA" & _
                    "              GROUP BY MES_AUX, NM_COMPLETO, ANO_SELECIONADO) AS TABELA2" & _
                    "              ORDER BY CONTADOR DESC, ANO_SELECIONADO, MES_SELECIONADO"
              End If
          Case "0"
              If Left(NrProcesso, 1) = "#" Then
                  SqlAux3 = " SELECT TOP 1 ISNULL(NM_COMPLETO,'') NM_COMPLETO, CONTADOR " & _
                         " FROM (SELECT DISTINCT '" & Right(NrProcesso, Len(NrProcesso) - 1) & "' NM_COMPLETO, S.ANO_SELECIONADO, " & _
                         " DENSE_RANK() OVER(ORDER BY CASE ISNULL(R.NM_COMPLETO, '') WHEN '' THEN 0 ELSE 1 END, S.ANO_SELECIONADO) AS CONTADOR" & _
                         " FROM TMBF_SELECIONADO S (NOLOCK) " & _
                         " LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                         "                                   AND R.CD_MBF = S.CD_MBF " & _
                         "                                   AND R.CD_USUARIO = S.CD_USUARIO " & _
                         "                                   AND R.NM_COMPLETO IN ('" & Right(NrProcesso, Len(NrProcesso) - 1) & "')" & _
                         "                                   AND R.MES_RESULTADO IS NOT NULL " & _
                         " WHERE S.CD_USUARIO = '" & usuario & "'  " & _
                         "  AND S.CD_MBF = " & cd_mbf & " " & _
                         "  AND S.IN_GERADO = 1 " & _
                         " GROUP BY R.NM_COMPLETO, S.ANO_SELECIONADO) AS TABELA" & _
                         " ORDER BY CONTADOR DESC, ANO_SELECIONADO"
              Else
                  SqlAux3 = " SELECT TOP 1 ISNULL(NM_COMPLETO,'') NM_COMPLETO, CONTADOR " & _
                        " FROM (SELECT DISTINCT R.NM_COMPLETO, S.ANO_SELECIONADO, " & _
                        " DENSE_RANK() OVER(ORDER BY CASE ISNULL(R.NM_COMPLETO, '') WHEN '' THEN 0 ELSE 1 END, S.ANO_SELECIONADO) AS CONTADOR" & _
                        " FROM TMBF_SELECIONADO S (NOLOCK) " & _
                        " LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
                        "                                   AND R.CD_MBF = S.CD_MBF " & _
                        "                                   AND R.CD_USUARIO = S.CD_USUARIO " & _
                        "                                   AND R.NM_COMPLETO IN (SELECT NM_COMPLETO " & _
                        "                                                         FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                        "                                                         WHERE R1.CD_MBF = R.CD_MBF " & _
                        "                                                           AND R1.CD_USUARIO = R.CD_USUARIO " & _
                        "                                                           AND R1.ANO_RESULTADO = R.ANO_RESULTADO " & _
                        "                                                           AND R1.NR_PROCESSO = '" & NrProcesso & "' " & _
                        "                                                           AND R1.CD_KPI = '" & cd_kpi & "'" & _
                        "                                                           AND R1.ID_KPI = '" & id_kpi & "'" & _
                        "                                                           AND R1.CD_TP_KPI = '" & cd_tp_kpi & "')" & _
                        "                                   AND R.MES_RESULTADO IS NOT NULL " & _
                        " WHERE S.CD_USUARIO = '" & usuario & "'  " & _
                        "  AND S.CD_MBF = " & cd_mbf & " " & _
                        "  AND S.IN_GERADO = 1 " & _
                        " GROUP BY R.NM_COMPLETO, S.ANO_SELECIONADO) AS TABELA" & _
                        " ORDER BY CONTADOR DESC, ANO_SELECIONADO"
              End If
      End Select
      'Response.Write(SqlAux3)
      'Response.End()
             
      Dim CnnAux3 As SqlConnection = New SqlConnection(Cnn)
      Dim CmdAux3 As SqlCommand = New SqlCommand(SqlAux3, CnnAux3)
      CnnAux3.Open()
      Dim RsAux3 As SqlDataReader = CmdAux3.ExecuteReader
      RsAux3.Read()
      NmCompleto = RsAux3("NM_COMPLETO")
      MaxContador = RsAux3("CONTADOR")
      RsAux3.Close()
      CmdAux3.Dispose()
      CnnAux3.Close()
            
      If Trim(NmCompleto) = "" Then
          SqlAux3 = " SELECT NM_COMPLETO " & _
                    " FROM TMBF_RESULTADO (NOLOCK) " & _
                    " WHERE CD_MBF = " & cd_mbf & " " & _
                    " AND CD_USUARIO = '" & usuario & "'" & _
                    " AND NR_PROCESSO = '" & NrProcesso & "' " & _
                    " AND CD_KPI = '" & cd_kpi & "'" & _
                    " AND ID_KPI = '" & id_kpi & "'" & _
                    " AND CD_TP_KPI = '" & cd_tp_kpi & "' "
          'Response.Write(SqlAux3)
          'Response.end
          CnnAux3 = New SqlConnection(Cnn)
          CmdAux3 = New SqlCommand(SqlAux3, CnnAux3)
          CnnAux3.Open()
          RsAux3 = CmdAux3.ExecuteReader
          RsAux3.Read()
          NmCompleto = RsAux3("NM_COMPLETO")
          RsAux3.Close()
          CmdAux3.Dispose()
          CnnAux3.Close()
      End If
               
      pagina_max = 1
      If MaxContador > QtdeMeses Then pagina_max = Int(MaxContador / QtdeMeses) + 1
      If pagina_max = pagina Then
          Select Case contador
              Case "0"
                  contador = MaxContador
              Case "1"
                  contador = MaxContador - 1
              Case "2"
                  contador = MaxContador - 2
              Case "3"
                  contador = MaxContador - 3
              Case "4"
                  contador = MaxContador - 4
              Case "5"
                  contador = MaxContador - 5
              Case "6"
                  contador = MaxContador - 6
              Case "7"
                  contador = MaxContador - 7
              Case "8"
                  contador = MaxContador - 8
              Case "9"
                  contador = MaxContador - 9
              Case "10"
                  contador = MaxContador - 10
              Case "11"
                  contador = MaxContador - 11
          End Select
      Else
          Select Case contador
              Case "0"
                  contador = QtdeMeses * pagina
              Case "1"
                  contador = (QtdeMeses * pagina) - 1
              Case "2"
                  contador = (QtdeMeses * pagina) - 2
              Case "3"
                  contador = (QtdeMeses * pagina) - 3
              Case "4"
                  contador = (QtdeMeses * pagina) - 4
              Case "5"
                  contador = (QtdeMeses * pagina) - 5
              Case "6"
                  contador = (QtdeMeses * pagina) - 6
              Case "7"
                  contador = (QtdeMeses * pagina) - 7
              Case "8"
                  contador = (QtdeMeses * pagina) - 8
              Case "9"
                  contador = (QtdeMeses * pagina) - 9
              Case "10"
                  contador = (QtdeMeses * pagina) - 10
              Case "11"
                  contador = (QtdeMeses * pagina) - 11
          End Select
      End If
           
      
      Select Case agrupamento
          Case "1"
              SqlAux2 = " SELECT * " & _
             " FROM (SELECT DISTINCT S.ANO_SELECIONADO, S.MES_SELECIONADO, DENSE_RANK() OVER(ORDER BY S.ANO_SELECIONADO DESC, S.MES_SELECIONADO DESC) AS CONTADOR" & _
             " FROM TMBF_SELECIONADO S (NOLOCK) " & _
             " LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO " & _
             "                                   AND R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
             "                                   AND R.CD_MBF = S.CD_MBF " & _
             "                                   AND R.CD_USUARIO = S.CD_USUARIO " & _
             "                                   AND R.NM_COMPLETO = '" & NmCompleto & "' " & _
             "                                   AND R.MES_RESULTADO IS NOT NULL " & _
             " WHERE S.CD_USUARIO = '" & usuario & "'  " & _
             "  AND S.CD_MBF = " & cd_mbf & " " & _
             "  AND S.IN_GERADO = 1 " & _
             " GROUP BY S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA" & _
             " WHERE CONTADOR = '" & contador & "'" & _
             " ORDER BY ANO_SELECIONADO, MES_SELECIONADO"
  
              'Response.Write(SqlAux2)
              'Response.end
              
              Dim CnnAux2 As SqlConnection = New SqlConnection(Cnn)
              Dim CmdAux2 As SqlCommand = New SqlCommand(SqlAux2, CnnAux2)
              CnnAux2.Open()
              Dim RsAux2 As SqlDataReader = CmdAux2.ExecuteReader              
              
              RsAux2.Read()
              mes = RsAux2("MES_SELECIONADO")
              ano = RsAux2("ANO_SELECIONADO")              
              RsAux2.Close()
              CmdAux2.Dispose()
              CnnAux2.Close()
                     
              If tipo = "1" Then
                  SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, ISNULL(M.DIAS_KPI, '') DIAS_KPI, ISNULL(M.DIAS_KPI_CORRIDOS, '') DIAS_KPI_CORRIDOS, ISNULL(CONVERT(VARCHAR, M.NR_META),'') AS NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
                  " FROM TMBF_RESULTADO M (NOLOCK) " & _
                  " WHERE M.CD_MBF = " & cd_mbf & _
                  "   AND M.CD_USUARIO = '" & usuario & "'" & _
                  "   AND M.MES_RESULTADO = " & mes & _
                  "   AND M.ANO_RESULTADO = " & ano & _
                  "   AND M.NM_COMPLETO = '" & NmCompleto & "'" & _
                  " ORDER BY M.DIAS_KPI DESC "
              Else
                  If tipo = "3" Then
                      SqlAux = "SELECT DISTINCT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, '' TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO " & _
                      " FROM TMBF_RESULTADO M (NOLOCK) " & _
                      " WHERE M.CD_MBF = " & cd_mbf & _
                      "   AND M.CD_USUARIO = '" & usuario & "'" & _
                      "   AND M.MES_RESULTADO = " & mes & _
                      "   AND M.ANO_RESULTADO = " & ano & _
                      "  "
                  Else
                      SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, ISNULL(M.DIAS_KPI, '') DIAS_KPI, ISNULL(M.DIAS_KPI_CORRIDOS, '') DIAS_KPI_CORRIDOS, ISNULL(CONVERT(VARCHAR, M.NR_META),'') AS NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
                      " FROM TMBF_RESULTADO M (NOLOCK) " & _
                      " WHERE M.CD_MBF = " & cd_mbf & _
                      "   AND M.CD_USUARIO = '" & usuario & "'" & _
                      "   AND M.MES_RESULTADO = " & mes & _
                      "   AND M.ANO_RESULTADO = " & ano & _
                      "   AND M.IN_SELECIONADO = '1' " & _
                      "   AND M.NM_COMPLETO = '" & NmCompleto & "'" & _
                      " ORDER BY M.DIAS_KPI DESC "
                  End If
              End If
          Case "2"
              SqlAux2 = " SELECT * FROM " & _
             "(SELECT MES_AUX AS MES_SELECIONADO, ANO_SELECIONADO, DENSE_RANK() OVER(ORDER BY ANO_SELECIONADO, MES_AUX DESC) CONTADOR " & _
             " FROM (SELECT DISTINCT " & _
             " CASE WHEN S.MES_SELECIONADO IN (1, 2, 3) THEN '1' " & _
             " ELSE CASE WHEN S.MES_SELECIONADO IN (4, 5, 6) THEN '2' " & _
             " ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9) THEN '3' " & _
             " ELSE CASE WHEN S.MES_SELECIONADO IN (10, 11, 12) THEN '4' " & _
             " END END END END MES_AUX, " & _
             " ISNULL(R.NM_COMPLETO, '" & NmCompleto & "') AS NM_COMPLETO, S.ANO_SELECIONADO " & _
             " FROM TMBF_SELECIONADO S (NOLOCK) " & _
             " LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO " & _
             "                                   AND R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
             "                                   AND R.CD_MBF = S.CD_MBF " & _
             "                                   AND R.CD_USUARIO = S.CD_USUARIO " & _
             "                                   AND R.NM_COMPLETO = '" & NmCompleto & "' " & _
             "                                   AND R.MES_RESULTADO IS NOT NULL " & _
             " WHERE S.CD_USUARIO = '" & usuario & "' AND S.CD_MBF = " & cd_mbf & " " & _
             " GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA " & _
             " GROUP BY MES_AUX, NM_COMPLETO, ANO_SELECIONADO) AS TABELA2 " & _
             " WHERE CONTADOR = '" & contador & "' " & _
             " ORDER BY ANO_SELECIONADO, MES_SELECIONADO  "
              'Response.Write(SqlAux2)
              'Response.End()
              
              Dim CnnAux2 As SqlConnection = New SqlConnection(Cnn)
              Dim CmdAux2 As SqlCommand = New SqlCommand(SqlAux2, CnnAux2)
              CnnAux2.Open()
              Dim RsAux2 As SqlDataReader = CmdAux2.ExecuteReader
              RsAux2.Read()
              mes_aux = RsAux2("MES_SELECIONADO")
              ano = RsAux2("ANO_SELECIONADO")
              RsAux2.Close()
              CmdAux2.Dispose()
              CnnAux2.Close()
                     
              mes = "1, 2, 3"
              Select Case mes_aux
                  Case "1"
                      mes = "1, 2, 3"
                  Case "2"
                      mes = "4, 5, 6"
                  Case "3"
                      mes = "7, 8, 9"
                  Case "4"
                      mes = "10, 11, 12"
              End Select
                     
              If tipo = "1" Then
                  SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, ISNULL(M.DIAS_KPI, '') DIAS_KPI, ISNULL(M.DIAS_KPI_CORRIDOS, '') DIAS_KPI_CORRIDOS, ISNULL(CONVERT(VARCHAR, M.NR_META),'') AS NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
                  " FROM TMBF_RESULTADO M (NOLOCK) " & _
                  " WHERE M.CD_MBF = " & cd_mbf & _
                  "   AND M.CD_USUARIO = '" & usuario & "'" & _
                  "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                  "   AND M.ANO_RESULTADO = " & ano & _
                  "   AND M.NM_COMPLETO = '" & NmCompleto & "' " & _
                  " ORDER BY M.DIAS_KPI DESC "
              Else
                  If tipo = "3" Then
                      SqlAux = "SELECT DINSTINCT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, '' TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO " & _
                      " FROM TMBF_RESULTADO M (NOLOCK) " & _
                      " WHERE M.CD_MBF = " & cd_mbf & _
                      "   AND M.CD_USUARIO = '" & usuario & "'" & _
                      "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                      "   AND M.ANO_RESULTADO = " & ano & _
                      "  "
                  Else
                      SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, ISNULL(M.DIAS_KPI, '') DIAS_KPI, ISNULL(M.DIAS_KPI_CORRIDOS, '') DIAS_KPI_CORRIDOS, ISNULL(CONVERT(VARCHAR, M.NR_META),'') AS NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
                      " FROM TMBF_RESULTADO M (NOLOCK) " & _
                      " WHERE M.CD_MBF = " & cd_mbf & _
                      "   AND M.CD_USUARIO = '" & usuario & "'" & _
                      "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                      "   AND M.ANO_RESULTADO = " & ano & _
                      "   AND M.IN_SELECIONADO = '1' " & _
                      "   AND M.NM_COMPLETO = '" & NmCompleto & "' " & _
                      " ORDER BY M.DIAS_KPI DESC "
                  End If
              End If
          Case "3"
              SqlAux2 = " SELECT * FROM " & _
             "(SELECT MES_AUX AS MES_SELECIONADO, ANO_SELECIONADO, DENSE_RANK() OVER(ORDER BY ANO_SELECIONADO, MES_AUX DESC) CONTADOR " & _
             " FROM (SELECT DISTINCT " & _
             " CASE WHEN S.MES_SELECIONADO IN (1, 2, 3, 4, 5, 6) THEN '1' " & _
             " ELSE CASE WHEN S.MES_SELECIONADO IN (7, 8, 9, 10, 11, 12) THEN '2' " & _
             " END END MES_AUX, " & _
             " ISNULL(R.NM_COMPLETO, '" & NmCompleto & "') AS NM_COMPLETO, S.ANO_SELECIONADO " & _
             " FROM TMBF_SELECIONADO S (NOLOCK) " & _
             " LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.MES_RESULTADO = S.MES_SELECIONADO " & _
             "                                   AND R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
             "                                   AND R.CD_MBF = S.CD_MBF " & _
             "                                   AND R.CD_USUARIO = S.CD_USUARIO " & _
             "                                   AND R.NM_COMPLETO = '" & NmCompleto & "' " & _
             "                                   AND R.MES_RESULTADO IS NOT NULL " & _
             " WHERE S.CD_USUARIO = '" & usuario & "' AND S.CD_MBF = " & cd_mbf & " " & _
             " GROUP BY R.CD_MBF, R.CD_USUARIO, R.NM_COMPLETO, R.NM_KPI, S.ANO_SELECIONADO, S.MES_SELECIONADO) AS TABELA " & _
             " GROUP BY MES_AUX, NM_COMPLETO, ANO_SELECIONADO) AS TABELA2 " & _
             " WHERE CONTADOR = '" & contador & "' " & _
             " ORDER BY ANO_SELECIONADO, MES_SELECIONADO  "
              'Response.Write(SqlAux2)
              'Response.End()
              
              Dim CnnAux2 As SqlConnection = New SqlConnection(Cnn)
              Dim CmdAux2 As SqlCommand = New SqlCommand(SqlAux2, CnnAux2)
              CnnAux2.Open()
              Dim RsAux2 As SqlDataReader = CmdAux2.ExecuteReader
              RsAux2.Read()
              mes_aux = RsAux2("MES_SELECIONADO")
              ano = RsAux2("ANO_SELECIONADO")
              RsAux2.Close()
              CmdAux2.Dispose()
              CnnAux2.Close()
                     
              mes = "1, 2, 3, 4, 5 ,6"
              Select Case mes_aux
                  Case "1"
                      mes = "1, 2, 3, 4, 5, 6"
                  Case "2"
                      mes = "7, 8, 9, 10 , 11, 12"
              End Select
                                      
              If tipo = "1" Then
                  SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, ISNULL(M.DIAS_KPI, '') DIAS_KPI, ISNULL(M.DIAS_KPI_CORRIDOS, '') DIAS_KPI_CORRIDOS, ISNULL(CONVERT(VARCHAR, M.NR_META),'') AS NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
                  " FROM TMBF_RESULTADO M (NOLOCK) " & _
                  " WHERE M.CD_MBF = " & cd_mbf & _
                  "   AND M.CD_USUARIO = '" & usuario & "'" & _
                  "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                  "   AND M.ANO_RESULTADO = " & ano & _
                  "   AND M.NM_COMPLETO = '" & NmCompleto & "' " & _
                  " ORDER BY M.DIAS_KPI DESC "
              Else
                  If tipo = "3" Then
                      SqlAux = "SELECT DISTINCT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, '' TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO " & _
                      " FROM TMBF_RESULTADO M (NOLOCK) " & _
                      " WHERE M.CD_MBF = " & cd_mbf & _
                      "   AND M.CD_USUARIO = '" & usuario & "'" & _
                      "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                      "   AND M.ANO_RESULTADO = " & ano & _
                      "  "
                  Else
                      SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, ISNULL(M.DIAS_KPI, '') DIAS_KPI, ISNULL(M.DIAS_KPI_CORRIDOS, '') DIAS_KPI_CORRIDOS, ISNULL(CONVERT(VARCHAR, M.NR_META),'') AS NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
                      " FROM TMBF_RESULTADO M (NOLOCK) " & _
                      " WHERE M.CD_MBF = " & cd_mbf & _
                      "   AND M.CD_USUARIO = '" & usuario & "'" & _
                      "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                      "   AND M.ANO_RESULTADO = " & ano & _
                      "   AND M.IN_SELECIONADO = '1' " & _
                      "   AND M.NM_COMPLETO = '" & NmCompleto & "' " & _
                      " ORDER BY M.DIAS_KPI DESC "
                  End If
              End If
          Case "0"
              SqlAux2 = " SELECT * FROM " & _
              " (SELECT DISTINCT S.ANO_SELECIONADO, DENSE_RANK() OVER(ORDER BY S.ANO_SELECIONADO) AS CONTADOR " & _
              " FROM TMBF_SELECIONADO S (NOLOCK) " & _
              " LEFT JOIN TMBF_RESULTADO R (NOLOCK) ON R.ANO_RESULTADO = S.ANO_SELECIONADO " & _
              "                                    AND R.CD_MBF = S.CD_MBF " & _
              "                                    AND R.CD_USUARIO = S.CD_USUARIO " & _
              "                                    AND R.NM_COMPLETO = '" & NmCompleto & "' " & _
              "                                    AND R.MES_RESULTADO IS NOT NULL " & _
              " WHERE S.CD_USUARIO = '" & usuario & "' " & _
              "   AND S.CD_MBF = " & cd_mbf & " " & _
              " GROUP BY R.CD_MBF, R.CD_USUARIO, S.ANO_SELECIONADO) AS TABELA" & _
              " WHERE CONTADOR = '" & contador & "'" & _
              " ORDER BY ANO_SELECIONADO"
                     
              Dim CnnAux2 As SqlConnection = New SqlConnection(Cnn)
              Dim CmdAux2 As SqlCommand = New SqlCommand(SqlAux2, CnnAux2)
              CnnAux2.Open()
              Dim RsAux2 As SqlDataReader = CmdAux2.ExecuteReader
              RsAux2.Read()
              ano = RsAux2("ANO_SELECIONADO")
              RsAux2.Close()
              CmdAux2.Dispose()
              CnnAux2.Close()
                     
              If tipo = "1" Then
                  SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, ISNULL(M.DIAS_KPI, '') DIAS_KPI, ISNULL(M.DIAS_KPI_CORRIDOS, '') DIAS_KPI_CORRIDOS, ISNULL(CONVERT(VARCHAR, M.NR_META),'') AS NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
                    " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    " WHERE M.CD_MBF = " & cd_mbf & _
                    "   AND M.CD_USUARIO = '" & usuario & "'" & _
                    "   AND M.ANO_RESULTADO = " & ano & _
                    "   AND M.NM_COMPLETO = '" & NmCompleto & "'" & _
                    " ORDER BY M.DIAS_KPI DESC "
              Else
                  If tipo = "3" Then
                      SqlAux = "SELECT DISTINCT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, '' TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO" & _
                        " FROM TMBF_RESULTADO M (NOLOCK) " & _
                        " WHERE M.CD_MBF = " & cd_mbf & _
                        "   AND M.CD_USUARIO = '" & usuario & "'" & _
                        "   AND M.ANO_RESULTADO = " & ano & _
                        "  "
                  Else
                      SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, ISNULL(M.DIAS_KPI, '') DIAS_KPI, ISNULL(M.DIAS_KPI_CORRIDOS, '') DIAS_KPI_CORRIDOS, ISNULL(CONVERT(VARCHAR, M.NR_META),'') AS NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
                        " FROM TMBF_RESULTADO M (NOLOCK) " & _
                        " WHERE M.CD_MBF = " & cd_mbf & _
                        "   AND M.CD_USUARIO = '" & usuario & "'" & _
                        "   AND M.ANO_RESULTADO = " & ano & _
                        "   AND M.IN_SELECIONADO = '1' " & _
                        "   AND M.NM_COMPLETO = '" & NmCompleto & "'" & _
                        " ORDER BY M.DIAS_KPI DESC "
                  End If
              End If
      End Select
      'Response.Write(SqlAux)
      'Response.End()
              
      Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
      Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
      CnnAux.Open()
      Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
             
      If Not RsAux.HasRows Then
          Response.Write("ERRO")
          RsAux.Close()
          CmdAux.Dispose()
          CnnAux.Close()
      Else
          RsAux.Read()
          
          
          If cd_tp_kpi = "3" Then
              If RsAux("NM_QUEBRAS") = "Verde" Then
                  cor_fundo2 = "#85f285"
                  cor_fundo = "#158315"
              End If
            
              If RsAux("NM_QUEBRAS") = "Amarelo" Then
                  cor_fundo2 = "#f3f3aa"
                  cor_fundo = "#e6e633"
              End If
            
              If RsAux("NM_QUEBRAS") = "Vermelho" Then
                  cor_fundo2 = "#f0bbbb"
                  cor_fundo = "#ff0000"
              End If
            
              If RsAux("NM_QUEBRAS") = "Cinza" Then
                  cor_fundo2 = "#dbdce2"
                  cor_fundo = "#000000"
              End If
          End If
          
             %>
             <html>
<head>
<title>Untitled Document</title>
</head>
<body>
<div style="position:absolute;left:350;width:20px;height:20px;"><img src="/imagens/30/btn_excel_inst.gif" style="cursor:pointer;vertical-align:middle;" onclick="javascript:criaExcelProcessos('<%=contador%>', '<%=cd_kpi %>','<%=cd_tp_kpi %>','<%=id_kpi %>','<%=RsAux("NR_PROCESSO") %>','<%=agrupamento %>','6','<%=tipo %>','<%=pagina %>');" alt="Planilha dos processos"/></div>
    <table style="cursor:pointer;font-size:10px;font-family:verdana;color:#000000;height:98%;BORDER-COLLAPSE:collapse;width: 98%;border-width:0px 0px 0px 0px;border-style:solid;border-bottom-color:#000000;" cellspacing="0" cellpadding="0">       
         <tr style="vertical-align:top;" height="20px">         
        <% If tipo = "3" And cd_tp_kpi <> "3" Then%>
        <td colspan="3"><B>Processos</B><br /><br /></td>
        <%Else%>
        <td colspan="3"><B><%=RsAux("NM_KPI") %></B><br /><%= RsAux("NM_QUEBRAS")%><br /><br /></td>
        <%End If%>
        </tr>
        <%  
            RsAux.Close()
            CnnAux.Close()
        %>
        <tr height="12px" style="text-align:left;background-color:<%=cor_fundo%>;color:#FFFFFF;font-weight:bold;">
        <td width="<% If tipo <> "3" and cd_tp_kpi <> "3" Then%>100px<%Else %>400px<%End If %>">&nbsp;Processo&nbsp;</td>
        <% If tipo <> "3" And cd_tp_kpi <> "3" Then%>
        <td width="40px">&nbsp;KPI&nbsp;</td>
        <%If tipo2 < 1 Then%>
        <td width="300px">&nbsp;Explicação&nbsp;</td>
        <%Else%>
        <td width="300px">&nbsp;</td>
        <%End If%>
        <%End If%>
        </tr>
            <% 
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
                Do While RsAux.Read()
                    If cd_produto = "01" Then
                        txLinkProcesso = "/Detalhe/imp_proc_result.asp?RadioGroup1=&StatusMenu=1&cd_menu_rel=01&cd_subm_rel=01&cd_view_rel=1586-0101-02&" & _
                                         "tp_relat=2&filtro=nr_processo&nr_processo=" + RsAux("NR_PROCESSO")
                    Else
                        txLinkProcesso = "/Detalhe/exp_proc_result.asp?cd_menu_rel=02&cd_subm_rel=01&cd_view_rel=1630-0201-03&filtro=nr_processo&nr_processo=" + RsAux("NR_PROCESSO")
                    End If
                    
                    If tipo <> 3 Then
                        If CStr(RsAux("DIAS_KPI")) <> "" And Trim(RsAux("NR_META")) <> "" Then
                            If RsAux("DIAS_KPI") > RsAux("NR_META") Then
                                cor_kpi = "#FF0000"
                            Else
                                cor_kpi = "#0000FF"
                            End If
                        Else
                            cor_kpi = "#000000"
                        End If
                    End If
                    If bgcolor = "#FFFFFF" Then bgcolor = cor_fundo2 Else bgcolor = "#FFFFFF"
               %>
                 <tr bgcolor="<%= bgcolor %>" height="25px" style="text-align:left;">
                 <td width="100px"><nobr>&nbsp;<a href="<%=txLinkProcesso%>" title="Ver informações do processo" target="_blank" style="color:#000000;text-decoration:none;"><%= Trim(RsAux("NR_PROCESSO_REDUZIDO"))%></a></nobr></td>
                 <% If tipo <> "3" and cd_tp_kpi <> "3" Then%>
                 <%If tipo2 < 1 Then%>
                 <td width="40px"><nobr>&nbsp;<span style="color:<%= cor_kpi %>;"><%= RsAux("DIAS_KPI")%></span></nobr></td>                
                 <td width="300px"><nobr>&nbsp;<%=RsAux("TX_OBS_DESVIO")%></nobr></td>   
                 <%  Else
                         If tipo2 = 1 Then
                         %>
                 <td width="40px"><nobr>&nbsp;<span style="color:<%= cor_kpi %>;"><%= RsAux("DIAS_KPI_CORRIDOS")%></span></nobr></td>                
                 <%Else%>
                 <td width="40px"><nobr>&nbsp;<span style="color:<%= cor_kpi %>;"><%= RsAux("DIAS_KPI")%></span></nobr></td>                
                 <%End If %>
                 <td width="300px"><nobr>&nbsp;</nobr></td>   
                 <%End If%>
                  <% End If%>              
                 </tr>
               <%
                   I = I + 1
            Loop
            RsAux.Close()
            CmdAux.Dispose()
               CnnAux.Close()
          %>
           <tr style="vertical-align:top;">
        <td colspan="5">&nbsp;</td>
        </tr>
        </table>
        </body>
        </html>
        <%End If%>
