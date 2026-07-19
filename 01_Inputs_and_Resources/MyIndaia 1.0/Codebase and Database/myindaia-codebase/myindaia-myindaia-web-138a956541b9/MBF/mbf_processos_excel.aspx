<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>


<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cd_mbf, usuario, cd_kpi, cd_tp_kpi, id_kpi, NrProcesso, agrupamento, mes, ano, NmCompleto, QtdeMeses, pagina, pagina_max, tipo As String
        Dim InArea, InCNPJ, InEstufagem, InLI, InModal, InPaisOrigem, InPrefixo, InTerminal, InCanal, InCdEvento1, InGraficoProcAbertos As String
        Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
        Dim SqlAux, SqlAux2, SqlAux3, SqlAux4, SqlAux5, mes_aux, mes_titulo, ano_titulo As String
        Dim MaxContador, contador As Integer
        
        cd_mbf = Request("cd_mbf")
        usuario = Request("usuario")
        cd_kpi = Request("cd_kpi")
        cd_tp_kpi = Request("cd_tp_kpi")
        id_kpi = Request("id_kpi")
        NrProcesso = Trim(Request("nr_processo"))
        agrupamento = Request("agrupamento")
        contador = Request("contador")
        QtdeMeses = Request("qtde_meses")
        tipo = Request.QueryString("tipo")
        pagina = Request.QueryString("pagina")
                
        Select Case agrupamento
            Case "1"                    
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
            Case "2"
                    
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
            Case "3"
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
            Case "0"
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
        End Select
        
        
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
        'Response.Write(SqlAux3)
        'Response.End()
        
        SqlAux3 = " SELECT ISNULL(IN_AREA,'') CD_AREA, ISNULL(IN_CNPJ,'') CD_CNPJ, " & _
        "ISNULL(IN_ESTUFAGEM,'') CD_ESTUFAGEM, ISNULL(IN_LI,'0') CD_LI, ISNULL(IN_MODAL,'') CD_MODAL, ISNULL(IN_PAIS_ORIGEM,'') CD_PAIS_ORIGEM, " & _
        "ISNULL(IN_PREFIXO,'') CD_PREFIXO, ISNULL(IN_TERMINAL,'') CD_TERMINAL, ISNULL(IN_CANAL,'') CD_CANAL, IN_GRAFICO_PROC_ABERTOS  " & _
        "FROM TMBF_INFO (NOLOCK) WHERE CD_MBF = " & cd_mbf & " AND CD_USUARIO = '" & usuario & "'"
        
        
        CnnAux3 = New SqlConnection(Cnn)
        CmdAux3 = New SqlCommand(SqlAux3, CnnAux3)
        CnnAux3.Open()
        RsAux3 = CmdAux3.ExecuteReader
        RsAux3.Read()
        InArea = Trim(RsAux3("CD_AREA"))
        InCNPJ = Trim(RsAux3("CD_CNPJ"))
        InEstufagem = Trim(RsAux3("CD_ESTUFAGEM"))
        InLI = Trim(RsAux3("CD_LI"))
        InModal = Trim(RsAux3("CD_MODAL"))
        InPaisOrigem = Trim(RsAux3("CD_PAIS_ORIGEM"))
        InPrefixo = Trim(RsAux3("CD_PREFIXO"))
        InTerminal = Trim(RsAux3("CD_TERMINAL"))
        InCanal = Trim(RsAux3("CD_CANAL"))
        InGraficoProcAbertos = Trim(RsAux3("IN_GRAFICO_PROC_ABERTOS"))
        RsAux3.Close()
        CmdAux3.Dispose()
        CnnAux3.Close()
        
        SqlAux5 = ""
        SqlAux4 = ""
        
        If InArea <> "False" Then
            SqlAux5 = SqlAux5 & ", ISNULL(A.NM_AREA,'') AS 'Area'"
            SqlAux4 = SqlAux4 & "  LEFT JOIN TAREA A (NOLOCK) ON A.CD_AREA = P.CD_AREA "
        End If
                    
        If InCNPJ <> "False" Then
            SqlAux5 = SqlAux5 & ", ISNULL(EN.NM_EMPRESA,'') AS 'Cliente'"
            SqlAux4 = SqlAux4 & "  LEFT JOIN TEMPRESA_NAC EN  (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLIENTE "
        End If
                    
        If InEstufagem <> "False" Then
            SqlAux5 = SqlAux5 & ", ISNULL(E.NM_ESTUFAGEM,'') AS 'Estufagem'"
            SqlAux4 = SqlAux4 & "  LEFT JOIN VW_TIPO_ESTUFAGEM E (NOLOCK) ON E.TP_ESTUFAGEM = P.TP_ESTUFAGEM "
        End If
                    
        If InLI <> "False" Then
            SqlAux5 = SqlAux5 & ", ISNULL(L.NR_LI,'') AS 'Nr. LI'"
            SqlAux4 = SqlAux4 & "  LEFT JOIN TPROCESSO_LI L (NOLOCK) ON L.NR_PROCESSO = P.NR_PROCESSO "
        End If
                    
        If InModal <> "False" Then
            SqlAux5 = SqlAux5 & ", ISNULL(V.NM_VIA_TRANSPORTE,'') AS 'Modalidade'"
            SqlAux4 = SqlAux4 & "  LEFT JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO " & _
            " LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON CONVERT(VARCHAR, SN.CD_SERVICO) = P.CD_SERVICO" & _
            " LEFT JOIN TVIA_TRANSPORTE V (NOLOCK) ON V.CD_VIA_TRANSPORTE = ISNULL(S.CD_VIA_TRANSPORTE, SN.CD_VIA_TRANSPORTE) "
        End If
                    
        If InPaisOrigem <> "False" Then
            SqlAux5 = SqlAux5 & ", ISNULL(PB.NM_PAIS,'') AS 'País de Origem'"
            SqlAux4 = SqlAux4 & " LEFT JOIN TPAIS_BROKER PB (NOLOCK) ON PB.CD_PAIS = P.CD_PAIS_ORIGEM"
        End If
                
        If InPrefixo <> "False" Then
            SqlAux5 = SqlAux5 & ", SUBSTRING(P.NR_PROCESSO, 5, 2) AS 'Prefixo'"
        End If
        
        If InTerminal <> "False" Then
            SqlAux5 = SqlAux5 & ", ISNULL(AD.NM_ARMAZEM,'') AS 'Terminal'"
            SqlAux4 = SqlAux4 & " LEFT JOIN TARMAZEM AD (NOLOCK) ON AD.CD_ARMAZEM = P.CD_ARMAZEM_DESCARGA"
        End If
        
        If InCanal <> "False" Then
            SqlAux5 = SqlAux5 & ", CASE WHEN P.CD_CANAL = '0' THEN 'Vermelho' " & _
                                " ELSE CASE WHEN P.CD_CANAL = '1' THEN 'Amarelo'" & _
                                " ELSE CASE WHEN P.CD_CANAL = '2' THEN 'Verde' " & _
                                " ELSE CASE WHEN P.CD_CANAL = '3' THEN 'Cinza' " & _
                                " ELSE CASE WHEN P.CD_CANAL = '4' THEN 'Aguardando' " & _
                                " ELSE CASE WHEN P.CD_CANAL = '5' THEN 'Verde Bloqueado' " & _
                                " ELSE CASE WHEN P.CD_CANAL = '6' THEN 'Todos' END END END END END END END AS 'Canal' "
        End If
        
        If InGraficoProcAbertos <> "False" Then
            SqlAux5 = SqlAux5 & ", CONVERT(VARCHAR, FABERTOS.DT_REALIZACAO, 103) AS 'Abertura'"
            SqlAux4 = SqlAux4 & " LEFT JOIN TFOLLOWUP FABERTOS (NOLOCK) ON FABERTOS.NR_PROCESSO = P.NR_PROCESSO AND FABERTOS.CD_EVENTO = '003'"
        End If
                
        SqlAux3 = "SELECT DISTINCT CD_EVENTO_1 FROM (SELECT DISTINCT R.CD_EVENTO_1 AS CD_EVENTO_1" & _
        " FROM TMBF_KPI K (NOLOCK)" & _
        "  INNER JOIN TMBF_RESULTADO R (NOLOCK) ON R.CD_MBF = K.CD_MBF" & _
        "                                      AND R.CD_USUARIO = K.CD_USUARIO" & _
        "                                      AND R.CD_KPI = K.CD_KPI" & _
        "                                      AND R.ID_KPI = K.ID_KPI" & _
        " WHERE K.CD_MBF = " & cd_mbf & " " & _
        " AND K.CD_USUARIO = '" & usuario & "'" & _
        " AND R.CD_EVENTO_1 IS NOT NULL" & _
        " UNION " & _
        " SELECT DISTINCT R.CD_EVENTO_2 AS CD_EVENTO_1" & _
        " FROM TMBF_KPI K (NOLOCK)" & _
        "  INNER JOIN TMBF_RESULTADO R (NOLOCK) ON R.CD_MBF = K.CD_MBF" & _
        "                                      AND R.CD_USUARIO = K.CD_USUARIO" & _
        "                                      AND R.CD_KPI = K.CD_KPI" & _
        "                                      AND R.ID_KPI = K.ID_KPI" & _
        " WHERE K.CD_MBF = " & cd_mbf & " " & _
        " AND K.CD_USUARIO = '" & usuario & "'" & _
        " AND R.CD_EVENTO_1 IS NOT NULL" & _
        " UNION " & _
        " SELECT DISTINCT CD_EVENTO AS CD_EVENTO_1 " & _
        " FROM TMBF_SELECIONADO (NOLOCK)" & _
        " WHERE CD_MBF = " & cd_mbf & " " & _
        " AND CD_USUARIO = '" & usuario & "'" & _
        ") AS TABELA"
        
        CnnAux3 = New SqlConnection(Cnn)
        CmdAux3 = New SqlCommand(SqlAux3, CnnAux3)
        CnnAux3.Open()
        RsAux3 = CmdAux3.ExecuteReader
        Do While RsAux3.Read()
            InCdEvento1 = Trim(RsAux3("CD_EVENTO_1"))
        
            If InCdEvento1 <> "" Then
                SqlAux5 = SqlAux5 & ", CONVERT(VARCHAR, F" & InCdEvento1 & ".DT_REALIZACAO, 103) AS 'Evento " & InCdEvento1 & "'"
                SqlAux4 = SqlAux4 & " LEFT JOIN TFOLLOWUP F" & InCdEvento1 & " (NOLOCK) ON F" & InCdEvento1 & ".NR_PROCESSO = P.NR_PROCESSO AND F" & InCdEvento1 & ".CD_EVENTO = '" & InCdEvento1 & "'"
            End If
        Loop
        RsAux3.Close()
        CmdAux3.Dispose()
        CnnAux3.Close()
        
        
        
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
                    SqlAux = "SELECT SUBSTRING(M.NR_PROCESSO, 5, 15) 'Processo' " & SqlAux5 & " " & _
                    " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    "   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = M.NR_PROCESSO " & SqlAux4 & ""
                    
                    SqlAux = SqlAux & " WHERE M.CD_MBF = " & cd_mbf & _
                    "   AND M.CD_USUARIO = '" & usuario & "'" & _
                    "   AND M.MES_RESULTADO = " & mes & _
                    "   AND M.ANO_RESULTADO = " & ano & _
                    "   AND M.NM_COMPLETO = '" & NmCompleto & "'" & _
                    " ORDER BY M.DIAS_KPI DESC "
                Else
                    SqlAux = "SELECT SUBSTRING(M.NR_PROCESSO, 5, 15) 'Processo' " & SqlAux5 & " " & _
                    " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    "   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = M.NR_PROCESSO " & SqlAux4 & ""
                    
                    SqlAux = SqlAux & " WHERE M.CD_MBF = " & cd_mbf & _
                    "   AND M.CD_USUARIO = '" & usuario & "'" & _
                    "   AND M.MES_RESULTADO = " & mes & _
                    "   AND M.ANO_RESULTADO = " & ano & _
                    "   AND M.IN_SELECIONADO = '1' " & _
                    "   AND M.NM_COMPLETO = '" & NmCompleto & "'" & _
                    " ORDER BY M.DIAS_KPI DESC "
                End If
                mes_titulo = "" & mes
                ano_titulo = "_" & ano
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
                        mes_titulo = "1trimestre"
                    Case "2"
                        mes = "4, 5, 6"
                        mes_titulo = "2trimestre"
                    Case "3"
                        mes = "7, 8, 9"
                        mes_titulo = "3trimestre"
                    Case "4"
                        mes = "10, 11, 12"
                        mes_titulo = "4trimestre"
                End Select
                     
                If tipo = "1" Then
                    SqlAux = "SELECT SUBSTRING(M.NR_PROCESSO, 5, 15) 'Processo' " & SqlAux5 & " " & _
                    " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    "   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = M.NR_PROCESSO " & SqlAux4 & ""
                    
                    SqlAux = SqlAux & " WHERE M.CD_MBF = " & cd_mbf & _
                    "   AND M.CD_USUARIO = '" & usuario & "'" & _
                    "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                    "   AND M.ANO_RESULTADO = " & ano & _
                    "   AND M.NM_COMPLETO = '" & NmCompleto & "' " & _
                    " ORDER BY M.DIAS_KPI DESC "
                Else
                    SqlAux = "SELECT SUBSTRING(M.NR_PROCESSO, 5, 15) 'Processo' " & SqlAux5 & " " & _
                    " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    "   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = M.NR_PROCESSO " & SqlAux4 & ""
                    
                    SqlAux = SqlAux & " WHERE M.CD_MBF = " & cd_mbf & _
                    "   AND M.CD_USUARIO = '" & usuario & "'" & _
                    "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                    "   AND M.ANO_RESULTADO = " & ano & _
                    "   AND M.IN_SELECIONADO = '1' " & _
                    "   AND M.NM_COMPLETO = '" & NmCompleto & "' " & _
                    " ORDER BY M.DIAS_KPI DESC "
                End If
                ano_titulo = "_" & ano
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
                        mes_titulo = "1semestre"
                    Case "2"
                        mes = "7, 8, 9, 10 , 11, 12"
                        mes_titulo = "2semestre"
                End Select
                                      
                If tipo = "1" Then
                    SqlAux = "SELECT SUBSTRING(M.NR_PROCESSO, 5, 15) 'Processo' " & SqlAux5 & "" & _
                    " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    "   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = M.NR_PROCESSO " & SqlAux4 & " "
                    
                    SqlAux = SqlAux & " WHERE M.CD_MBF = " & cd_mbf & _
                    "   AND M.CD_USUARIO = '" & usuario & "'" & _
                    "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                    "   AND M.ANO_RESULTADO = " & ano & _
                    "   AND M.NM_COMPLETO = '" & NmCompleto & "' " & _
                    " ORDER BY M.DIAS_KPI DESC "
                Else
                    SqlAux = "SELECT SUBSTRING(M.NR_PROCESSO, 5, 15) 'Processo' " & SqlAux5 & "" & _
                    " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    "   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = M.NR_PROCESSO " & SqlAux4 & " "
                    
                    SqlAux = SqlAux & " WHERE M.CD_MBF = " & cd_mbf & _
                    "   AND M.CD_USUARIO = '" & usuario & "'" & _
                    "   AND M.MES_RESULTADO IN (" & mes & ")" & _
                    "   AND M.ANO_RESULTADO = " & ano & _
                    "   AND M.IN_SELECIONADO = '1' " & _
                    "   AND M.NM_COMPLETO = '" & NmCompleto & "' " & _
                    " ORDER BY M.DIAS_KPI DESC "
                End If
                ano_titulo = "_" & ano
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
                    SqlAux = "SELECT SUBSTRING(M.NR_PROCESSO, 5, 15) 'Processo' " & SqlAux5 & "" & _
                      " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    "   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = M.NR_PROCESSO " & SqlAux4 & ""
                    
                    SqlAux = SqlAux & " WHERE M.CD_MBF = " & cd_mbf & _
                      "   AND M.CD_USUARIO = '" & usuario & "'" & _
                      "   AND M.ANO_RESULTADO = " & ano & _
                      "   AND M.NM_COMPLETO = '" & NmCompleto & "'" & _
                      " ORDER BY M.DIAS_KPI DESC "
                Else
                    SqlAux = "SELECT SUBSTRING(M.NR_PROCESSO, 5, 15) 'Processo' " & SqlAux5 & "" & _
                        " FROM TMBF_RESULTADO M (NOLOCK) " & _
                    "   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = M.NR_PROCESSO " & SqlAux4 & ""
                    
                    SqlAux = SqlAux & " WHERE M.CD_MBF = " & cd_mbf & _
                        "   AND M.CD_USUARIO = '" & usuario & "'" & _
                        "   AND M.ANO_RESULTADO = " & ano & _
                        "   AND M.IN_SELECIONADO = '1' " & _
                        "   AND M.NM_COMPLETO = '" & NmCompleto & "'" & _
                        " ORDER BY M.DIAS_KPI DESC "
                End If
                mes_titulo = ""
                ano_titulo = ano
        End Select
        'Response.Write(SqlAux)
        'Response.End()
        
        SqlExcel.ConnectionString = Cnn
        SqlExcel.SelectCommand = SqlAux
        grdExcel.DataBind()
        
        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.ContentType = "application/vnd.ms-excel"
        HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=processos_" & cd_mbf & "_" & usuario & "_" & mes_titulo & ano_titulo & ".xls")
        
        HttpContext.Current.Response.Charset = ""
        grdExcel.EnableViewState = False
        Dim sw As System.IO.StringWriter = New System.IO.StringWriter()
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        grdExcel.RenderControl(htw)
        HttpContext.Current.Response.Write(sw.ToString())
        HttpContext.Current.Response.End()
    End Sub
   
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As System.Web.UI.Control)
        'Controle do FORM
    End Sub
</script>
<%
 
    
     
         %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="frmExcelMBF" runat="server">
  <asp:ScriptManager ID="smExcelMBF" runat="server"/>
    <asp:SqlDataSource runat="server" ID="SqlExcel"></asp:SqlDataSource>
    <asp:GridView runat="server" ID="grdExcel"  DataSourceID="SqlExcel" AutoGenerateColumns="True">
    </asp:GridView>
</form>
</body>
</html>

