# W3 — Data-sample rehydration notes

Headerless `;`-delimited dumps re-emitted with schema column names. Values are **unmodified** (padding, `NULL` literals and date formats preserved).

**All six passed the field-count gate**, independently verified twice.


## `TCLIENTE_SERVICO`

- Source: `myindaia-prioridades-csv/Prioridade_3_tcliente_servico.csv`
- Rows: 200 · schema columns: 19 · observed widths: {19: 200} · **PASS**
- Written: `W3_samples_rehydrated/TCLIENTE_SERVICO.csv`

| Column | distinct non-NULL | top values (count) |
|---|--:|---|
| CD_CLIENTE | 168 | `01875`×4; `02039`×3; `01675`×3; `00945`×3; `01679`×3 |
| CD_UNID_NEG | 4 | `01`×136; `07`×42; `02`×20; `04`×1 |
| CD_PRODUTO | 6 | `01`×127; `02`×46; `06`×13; `10`×10; `03`×2 |
| CD_SERVICO | 121 | `147`×9; `927`×7; `11`×6; `106`×5; `334`×5 |
| IN_ATIVO | 2 | `1`×113; `0`×87 |
| NR_DPS | 1 | `1`×159 |
| DT_CAPTACAO | 12 | `3999-12-30 00:00:00.000`×57; `3999-12-31 00:00:00.000`×56; `9999-12-31 00:00:00.000`×31; `9999-01-01 00:00:00.000`×29; `9999-01-31 00:00:00.000`×7 |
| PZ_PROPOSTA | 2 | `999`×186; `99`×1 |
| IN_INCIDE_SDA | 2 | `1`×186; `0`×14 |
| DT_AUTORIZACAO | 13 | `3999-12-31 00:00:00.000`×56; `3999-12-30 00:00:00.000`×55; `9999-12-31 00:00:00.000`×35; `9999-01-01 00:00:00.000`×26; `9999-01-31 00:00:00.000`×7 |
| CD_PREFIXO | 30 | `IM`×59; `IA`×36; `EA`×18; `EM`×16; `FT`×11 |
| CD_BANCO_DEB_CC | 53 | `623`×31; `005`×23; `001`×22; `639`×13; `559`×7 |
| CD_BANCO_COM | 7 | `001`×104; `002`×14; `331`×9; `310`×9; `175`×2 |
| CD_BANCO_DEB_COM | 46 | `001`×38; `623`×31; `005`×18; `639`×13; `559`×7 |
| IN_CPMF_NUM | 1 | `0`×142 |
| CD_TAB_SDA | 0 | *(all NULL/empty)* |
| IN_REL_VOL_MOD2 | 2 | `0`×151; `1`×49 |
| IN_LANCA_SOLIC | 2 | `0`×151; `1`×49 |
| IN_HORA_EVENTOS | 2 | `0`×150; `1`×29 |

## `TFOLLOWUP`

- Source: `myindaia-prioridades-csv/Prioridade_3_tfollowup.csv`
- Rows: 200 · schema columns: 25 · observed widths: {25: 200} · **PASS**
- Written: `W3_samples_rehydrated/TFOLLOWUP.csv`

| Column | distinct non-NULL | top values (count) |
|---|--:|---|
| NR_PROCESSO | 200 | `0102EM-002708-22`×1; `0102ER-000110-16`×1; `0101IM-008012-25`×1; `0102EM-004522-19`×1; `0102EA-000403-22`×1 |
| CD_SERVICO | 53 | `1`×63; `2`×37; `3`×23; `6`×8; `710`×8 |
| CD_EVENTO | 126 | `012`×8; `003`×7; `088`×6; `092`×5; `636`×5 |
| IN_APLICAVEL | 2 | `1`×160; `0`×40 |
| CD_RESP_APLICACAO | 25 | `0715`×2; `3098`×1; `4987`×1; `0087`×1; `1225`×1 |
| CD_RESP_REALIZACAO | 100 | `0707`×23; `2713`×3; `3472`×2; `3052`×2; `2258`×2 |
| CD_RESP_INSPECAO | 18 | `4713`×1; `0759`×1; `4084`×1; `1225`×1; `3582`×1 |
| DT_APLICACAO | 26 | `2026-03-09 10:13:35.163`×1; `2019-07-30 14:22:24.963`×1; `2013-06-14 15:29:55.220`×1; `2019-02-21 08:59:24.763`×1; `2015-12-08 14:11:34.777`×1 |
| DT_REALIZACAO | 134 | `2022-04-06 15:47:00.000`×1; `2019-05-30 00:00:00.000`×1; `2022-03-16 00:00:00.000`×1; `2025-10-20 11:20:21.817`×1; `2019-07-30 16:45:05.000`×1 |
| DT_INSPECAO | 18 | `2019-05-07 13:49:23.060`×1; `2021-02-22 09:36:33.573`×1; `2022-01-07 18:11:11.410`×1; `2012-02-27 00:00:00.000`×1; `2021-07-21 15:32:36.423`×1 |
| CD_RESULT_INSPECAO | 1 | `C`×18 |
| NR_RNC | 0 | *(all NULL/empty)* |
| DT_PREVISTA | 109 | `2019-05-28 00:00:00.000`×1; `2022-03-17 21:15:55.270`×1; `2025-07-26 03:04:00.000`×1; `2019-07-29 12:10:17.873`×1; `2018-07-05 14:55:24.790`×1 |
| DT_LIMITE | 0 | *(all NULL/empty)* |
| NR_ORDEM | 63 | `21`×7; `1`×7; `9`×7; `23`×7; `14`×6 |
| TX_OBS | 3 | `22/02: Abertura  de Registro`×1; `07/04: Abertura  de Registro`×1; `02/03: Abertura de Registro `×1 |
| IN_BLOQUEADO | 1 | `0`×200 |
| IN_ALERTA_ENVIADO | 2 | `0`×183; `1`×13 |
| QT_DIAS_DESVIO | 0 | *(all NULL/empty)* |
| DT_REALIZACAO_EFETIVA | 129 | `2022-07-25 19:34:54.393`×1; `2019-05-30 08:12:56.890`×1; `2022-03-16 21:20:10.750`×1; `2025-10-20 11:20:21.823`×1; `2019-07-30 16:45:42.843`×1 |
| DT_ALERTA_ENVIADO | 9 | `2019-08-02 19:18:52.803`×1; `2018-12-27 10:39:49.100`×1; `2012-02-27 12:03:39.073`×1; `2014-01-16 16:05:50.977`×1; `2022-04-26 18:22:39.663`×1 |
| IN_EDI_ENVIADO | 1 | `0`×1 |
| CD_EV_BASICO | 55 | `161`×14; `021`×11; `162`×10; `088`×9; `132`×7 |
| PZ_DO_EV_BASICO | 18 | `24`×40; `0`×29; `48`×17; `72`×7; `-120`×6 |
| IN_INTEGRADO_CLIENTE | 0 | *(all NULL/empty)* |

## `TPROCESSO_EXP`

- Source: `myindaia-prioridades-csv/Prioridade_3_tprocesso_exp.csv`
- Rows: 200 · schema columns: 124 · observed widths: {124: 200} · **PASS**
- Written: `W3_samples_rehydrated/TPROCESSO_EXP.csv`

| Column | distinct non-NULL | top values (count) |
|---|--:|---|
| NR_PROCESSO | 200 | `0102EM-010064-18`×1; `0102ER-0700-05`×1; `0102ER-005585-21`×1; `0102EM-015921-23`×1; `0102EM-000458-15`×1 |
| NR_OUTRAS_REF | 0 | *(all NULL/empty)* |
| CD_EXPORTADOR | 68 | `01140`×20; `01597`×13; `02362`×10; `00393`×9; `02869`×8 |
| CD_IMPORTADOR | 109 | `10254`×10; `28223`×10; `18805`×9; `27321`×8; `11033`×5 |
| CD_DESPACHANTE | 4 | `003`×64; `031`×55; `001`×3; `028`×1 |
| CD_AGENTE | 50 | `0338`×12; `0036`×11; `0204`×9; `0031`×7; `0023`×7 |
| CD_INCOTERM | 7 | `FCA`×79; `FOB`×42; `CFR`×20; `EXW`×17; `CPT`×15 |
| CD_PAIS_DESTINO | 48 | `063`×35; `249`×26; `097`×11; `589`×11; `158`×10 |
| CD_MOEDA | 3 | `220`×180; `790`×10; `978`×8 |
| CD_VIA_TRANSPORTE | 3 | `01`×62; `07`×34; `04`×32 |
| CD_TRANSPORTADORA | 19 | `0626`×4; `0114`×4; `0523`×3; `1512`×3; `0827`×2 |
| CD_SEGURADORA | 3 | `00718`×1; `07368`×1; `07371`×1 |
| CD_REPRESENTANTE | 3 | `00271`×6; `02232`×2; `02891`×1 |
| CD_LOCAL_ORIGEM | 22 | `0002`×55; `0125`×24; `0111`×18; `0928`×6; `1448`×5 |
| CD_LOCAL_DESTINO | 63 | `0010`×26; `0009`×8; `0091`×7; `0592`×6; `0001`×5 |
| CD_URF_DESPACHO | 22 | `0817800`×84; `0817700`×21; `0817600`×16; `1017500`×11; `0517800`×8 |
| CD_URF_DESTINO | 20 | `0817800`×85; `0817700`×21; `0817600`×16; `1017500`×11; `0517800`×8 |
| CD_TERMO_PAGTO | 31 | `000005`×36; `000203`×25; `000014`×12; `000209`×7; `000011`×6 |
| CD_FORMA_PAGTO | 3 | `1`×2; `0`×2; `3`×1 |
| CD_LINGUA_PEDIDO | 3 | `2`×80; `1`×35; `0`×9 |
| CD_TIPO_FRETE | 2 | `0`×126; `1`×66 |
| CD_USUARIO | 26 | `3837`×5; `1464`×4; `2187`×3; `1736`×3; `4079`×3 |
| CD_CARTA_CREDITO | 0 | *(all NULL/empty)* |
| CD_INST_NEGOC | 8 | `31800`×31; `33500`×6; `33600`×5; `99800`×3; `35900`×3 |
| CD_CONSIGNATARIO | 68 | `10254`×10; `11033`×5; `06107`×4; `06324`×3; `24728`×3 |
| CD_NOTIFY1 | 68 | `10254`×10; `11033`×5; `06107`×4; `06324`×3; `17744`×3 |
| CD_NOTIFY2 | 0 | *(all NULL/empty)* |
| DT_REGISTRO_PEDIDO | 197 | `2021-06-18 00:00:00.000`×2; `2014-07-31 00:00:00.000`×2; `2015-12-15 00:00:00.000`×2; `2018-12-13 00:00:00.000`×1; `2005-07-12 00:00:00.000`×1 |
| DT_FATURA | 76 | `2018-12-19 00:00:00.000`×1; `2005-07-13 00:00:00.000`×1; `2021-12-23 08:00:00.000`×1; `2005-02-14 00:00:00.000`×1; `2021-07-21 00:00:00.000`×1 |
| IN_DRAWBACK | 2 | `0`×144; `1`×56 |
| NR_LI | 0 | *(all NULL/empty)* |
| NR_FATURA | 112 | `NES073673/2018`×1; `2432/05`×1; `NES093404/2021`×1; `70485836`×1; `1456/05`×1 |
| QT_TOTAL_ITENS | 24 | `001`×74; `003`×10; `002`×8; `005`×7; `004`×6 |
| TX_INF_EMBALAGEM | 36 | `01 CAJA DE CARTON`×2; `10 BALDES EN 01 PALLET`×1; `15 TAMBORES ACONDICIONADOS E`×1; `02 TREATED WOODEN PALLETS`×1; `HERRAMIENTAS SUPERABRASIVAS`×1 |
| TX_MARCACAO_VOLUME | 66 | `NESTLE`×2; `Nestle`×2; `NESTLE MIDDLE EAST FZE LDP70`×1; `BRASIL/BASF SÃO PAULO 25/615`×1; `BRASIL BASF, SB CAMPO, 45020`×1 |
| TX_TERMO_PAGTO | 1 | `" DE ALMACEN, CUBRIENDO TODO`×1 |
| TX_DECL_ADICIONAL | 7 | `PINTURA IMOBILIARIA  "ORIGEN`×1; `"MUESTRA SIN VALOR COMERCIAL`×1; `"ORIGEN Y PROCEDENCIA DE LA `×1; `Correspondent Bank: Standard`×1; `The exporter of the products`×1 |
| TX_DECL_EXPORTADOR | 4 | `DECLARAMOS BAJO JURAMENTO QU`×2; `CERTIFICAMOS QUE TODOS LOS D`×1; `Rafael Olivares Sierra - Ger`×1; `CERTIFICAMOS QUE LOS PRECIOS`×1 |
| TP_NOTIFY1 | 1 | `0`×97 |
| TP_NOTIFY2 | 1 | `5`×1 |
| TP_CONSIGNATARIO | 1 | `0`×97 |
| VL_FRETE | 43 | `0`×157; `4000`×2; `35,9`×1; `11374,51`×1; `36,01`×1 |
| VL_SEGURO | 11 | `0`×190; `1,41`×1; `2,38`×1; `76,73`×1; `3,33`×1 |
| VL_PESO_BRUTO | 131 | `0`×66; `12320`×2; `13272`×2; `23116,8`×2; `9954`×2 |
| VL_PESO_LIQUIDO | 126 | `0`×67; `11200`×4; `8400`×3; `25143,48`×2; `19353,6`×2 |
| VL_DESCONTO | 5 | `0`×196; `3634,6`×1; `2415,15`×1; `798,3`×1; `9258,24`×1 |
| VL_COMISSAO_PERCENT | 5 | `0`×129; `5`×2; `10`×1; `6`×1; `4,8`×1 |
| VL_TOT_ORIGEM | 1 | `0`×200 |
| VL_TOT_CUBAGEM | 62 | `0`×133; `84,112`×4; `60,06`×3; `19,483`×2; `26,186`×1 |
| VL_TOT_FOB | 135 | `0`×66; `35962,08`×1; `1162,69`×1; `82671,68`×1; `138422,57`×1 |
| VL_TOT_COM_AGENTE | 6 | `0`×195; `58,13`×1; `2693,9`×1; `8174,02`×1; `172,42`×1 |
| VL_TOT_QTDE_PROD | 116 | `0`×74; `56`×4; `1344`×3; `42`×3; `1271,16`×2 |
| VL_TOT_QTDE_EMBALAGEM | 9 | `0`×190; `200`×2; `3`×2; `2850`×1; `1`×1 |
| VL_TOT_MCV | 128 | `0`×73; `35962,08`×1; `1200`×1; `82671,68`×1; `149797,08`×1 |
| VL_TOT_EXW | 127 | `0`×74; `35962,08`×1; `1200`×1; `82671,68`×1; `149797,08`×1 |
| VL_TX_CAMBIO | 1 | `0`×200 |
| VL_TOT_CONTAINER | 1 | `0`×200 |
| VL_TOT_PALLETS | 1 | `0`×200 |
| VL_TOT_DESPESA | 1 | `0`×166 |
| NR_SD | 3 | `20501843655`×1; `20701672170`×1; `20201707101`×1 |
| NR_CERTIFICADO | 1 | `6206182055`×1 |
| CD_LOCAL_EMISSAO | 1 | `001`×5 |
| CD_ACORDO | 0 | *(all NULL/empty)* |
| CD_NORMAS | 0 | *(all NULL/empty)* |
| TX_OBSERVACAO | 7 | `(ER-0700-05)`×1; `ER-0100-05`×1; `CERTIFICADO N° 62-07-58-0083`×1; `Nº CERT. 62-08-59-00364 - DA`×1; `ER-0561-05`×1 |
| TX_CABECALHO | 0 | *(all NULL/empty)* |
| IN_ACORDO_ITENS | 1 | `0`×200 |
| IN_NORMAS_ITENS | 1 | `0`×200 |
| DT_SD | 3 | `1899-12-30 00:00:00.000`×130; `2005-02-18 00:00:00.000`×1; `2007-02-12 00:00:00.000`×1 |
| IN_FABR_EXPO | 3 | `0`×62; `1`×40; `2`×7 |
| CD_FABRICANTE | 14 | `00781`×22; `01597`×10; `00393`×9; `00785`×5; `01729`×4 |
| CD_PAIS_ORIGEM | 2 | `105`×60; `155`×10 |
| TP_COPIA | 1 | `5`×1 |
| CD_COPIA | 0 | *(all NULL/empty)* |
| TP_DOCUMENTO | 1 | `0`×8 |
| CD_DOCUMENTO | 6 | `00718`×2; `01051`×2; `07228`×1; `06795`×1; `06943`×1 |
| IN_ACORDO2_ITENS | 1 | `0`×200 |
| IN_NORMAS2_ITENS | 1 | `0`×200 |
| CD_ACORDO2 | 0 | *(all NULL/empty)* |
| CD_NORMAS2 | 0 | *(all NULL/empty)* |
| CD_PAIS_ORIG | 1 | `105`×138 |
| IN_VENDA_INCOTERM | 2 | `0`×171; `1`×29 |
| TX_MERCADORIA_BL | 1 | `KERRYLAC 900 - EXPORTACAO`×1 |
| IN_DECL_AD_INSTR_EMB | 1 | `1`×166 |
| IN_DECL_AD_PACKING_LIST | 1 | `1`×166 |
| CD_BANCO_SAQUE_BORDERO | 0 | *(all NULL/empty)* |
| NR_DDE | 3 | `20501843655`×1; `20701672170`×1; `20201707101`×1 |
| IN_REFERENCIA_FAT_INST | 1 | `0`×200 |
| DT_REG_DDE | 3 | `1899-12-30 00:00:00.000`×38; `2005-02-18 00:00:00.000`×1; `2007-02-12 00:00:00.000`×1 |
| IN_ETIQUETA | 1 | `0`×47 |
| CD_ENQUAD_OP | 5 | `80000`×120; `81101`×38; `80380`×15; `80116`×1; `99101`×1 |
| VL_SEM_COBERTURA_CAMBIAL | 1 | `0`×166 |
| TX_DECL_ADIC_INST_EMB | 23 | `PAY TO: CITIBANK, N.A., NEW `×29; `Pay to: Citibank, N.A., New `×6; `ENVIO DE DOCUMENTOS (ORIGINA`×4; `PAY TO: BANCO BRADESCO S A A`×2; `Nº CUIT: 30-51748667-8`×1 |
| TX_CRIT_ORIG_FORM_A | 0 | *(all NULL/empty)* |
| CD_LOCAL_DESPACHO | 1 | `0125`×1 |
| VL_ACRESCIMO | 6 | `0`×195; `6421,33`×1; `3000`×1; `362,32`×1; `3285,67`×1 |
| DT_AVISO_EMBARQUE | 28 | `2005-07-19 00:00:00.000`×1; `2005-02-22 00:00:00.000`×1; `2019-02-19 00:00:00.000`×1; `2007-09-28 00:00:00.000`×1; `2012-10-15 00:00:00.000`×1 |
| TP_POS_AD | 1 | `1`×166 |
| in_num_fat_auto | 2 | `0`×173; `1`×27 |
| IN_MONTADO | 2 | `0`×151; `1`×45 |
| IN_SELECIONADO | 2 | `0`×151; `1`×45 |
| VL_FRETE_INT | 1 | `0`×161 |
| TX_LOGOMARCA | 4 | `logo_sg2.jpg`×13; `logo_sg1.jpg`×2; `logo_sg3.jpg`×1; `logo_sg0.jpg`×1 |
| CD_BANCO_SAQUE | 0 | *(all NULL/empty)* |
| VL_INLAND_FREIGHT | 2 | `0`×45; `880`×1 |
| IN_DUE | 1 | `1`×122 |
| IN_REC_ALFANDEGADO_DESPACHO | 1 | `1`×122 |
| CD_REC_ALFANDEGADO_DESPACHO | 33 | `8931359`×18; `0603201`×11; `8931356`×11; `8921101`×10; `5921302`×8 |
| NM_REF_END_REC_ALFAND_DESPACHO | 0 | *(all NULL/empty)* |
| CD_REC_ALFANDEGADO_EMBARQUE | 22 | `8931359`×26; `8931356`×19; `8931404`×15; `0603201`×11; `8921101`×10 |
| IN_UM_ENQUAD_POR_PROC | 2 | `1`×101; `0`×21 |
| TX_INFORMACOES_ADICIONAIS | 122 | `0102EM-010064-18 DESPACHANTE`×1; `0102ER-005585-21 PRESTADORA `×1; `0102EM-015921-23`×1; `0102EA-001217-21 - CDE-0966-`×1; `0102EM-019023-21`×1 |
| CD_STATUS_DUE | 3 | `200`×110; `422`×10; `500`×1 |
| DT_ENVIO_DUE | 119 | `2018-12-21 09:43:49.000`×1; `2021-12-23 15:46:57.000`×1; `2024-01-03 08:49:57.000`×1; `2021-07-21 15:28:00.000`×1; `2021-11-29 16:28:41.000`×1 |
| CD_CHAVE_ACESSO_DUE | 121 | `18HBQ010242085`×1; `21CHJ067121481`×1; `24VKW111512910`×1; `21OGZ057232337`×1; `21ZHW065449331`×1 |
| TX_MARCACAO_VOLUME_ESP | 38 | `NESTLE`×2; `Nestle`×2; `NESTLE MIDDLE EAST FZE LDP70`×1; `NESTLE CANADA INC. 456008720`×1; `NESTLE ARGENTINA S.A. 456105`×1 |
| IN_TIPO_DOCUMENTO_DUE | 2 | `1`×110; `3`×11 |
| NR_PROCESSSO_ADM_IMP | 0 | *(all NULL/empty)* |
| DT_PRAZO_VALIDADE_EXP_TEMP | 0 | *(all NULL/empty)* |
| TX_MOTIVO_RETIFICACAO | 1 | `Alteracao`×1 |
| QT_DIAS_PRAZO_VALIDADE_EXP_TEMP | 0 | *(all NULL/empty)* |
| IN_REC_ALFANDEGADO_EMBARQUE | 1 | `1`×113 |
| NM_REF_END_REC_ALFAND_EMBARQUE | 0 | *(all NULL/empty)* |
| TIPOACORDOCOEMRCIAL_ID | 0 | *(all NULL/empty)* |

## `TPROCESSO`

- Source: `myindaia-problemas-csv/Problema_3_tprocesso.csv`
- Rows: 200 · schema columns: 316 · observed widths: {316: 200} · **PASS**
- Written: `W3_samples_rehydrated/TPROCESSO.csv`

| Column | distinct non-NULL | top values (count) |
|---|--:|---|
| NR_PROCESSO | 200 | `0106FE-082812-24`×1; `0102EG-001634-23`×1; `0106FE-056879-18`×1; `0102ER-004267-19`×1; `0106FE-018028-23`×1 |
| CD_UNID_NEG | 2 | `01`×196; `07`×4 |
| CD_PRODUTO | 3 | `06`×108; `01`×49; `02`×43 |
| CD_CLIENTE | 59 | `02274`×101; `00005`×12; `00500`×5; `01565`×4; `00782`×4 |
| CD_SERVICO | 38 | `475`×104; `2`×22; `1`×16; `6`×5; `3`×5 |
| CD_USUARIO | 92 | `3520`×42; `6082`×13; `4170`×10; `3319`×7; `2235`×6 |
| DT_ABERTURA | 196 | `2018-08-01 00:00:00.000`×3; `2021-12-30 00:00:00.000`×2; `2022-01-25 00:00:00.000`×2; `2024-11-11 00:00:00.000`×1; `2023-09-13 00:00:00.000`×1 |
| CD_RESTRICAO | 4 | `0`×79; `3`×5; `2`×3; `6`×1 |
| CD_LIBERADOR | 10 | `0029`×2; `5625`×1; `0823`×1; `3411`×1; `0770`×1 |
| DT_LIBERACAO | 11 | `2022-12-14 09:42:57.900`×1; `2006-09-20 11:41:31.513`×1; `2019-05-16 14:58:06.050`×1; `2016-02-24 16:20:41.860`×1; `2007-04-10 15:59:54.850`×1 |
| IN_CANCELADO | 2 | `0`×194; `1`×6 |
| CD_CANCELADOR | 5 | `2330`×1; `0088`×1; `2258`×1; `1781`×1; `4608`×1 |
| DT_CANCELAMENTO | 5 | `2016-02-24 16:45:17.730`×1; `2014-03-20 10:28:55.173`×1; `2017-07-18 09:33:46.430`×1; `2013-01-03 16:47:57.620`×1; `2023-04-03 19:15:09.067`×1 |
| CD_REPRESENTANTE | 11 | `00271`×43; `02891`×2; `02454`×2; `02453`×2; `02232`×1 |
| NR_PROC_RISC | 0 | *(all NULL/empty)* |
| NR_PROC_PARCEIRO | 0 | *(all NULL/empty)* |
| TX_MERCADORIA | 62 | `PNEUS`×4; `REVENDA / PBL`×2; `411083 NESTLE Leite Condensa`×2; `SOJA EM GRAOS`×1; `FOGÕES`×1 |
| IN_MERC_PERIGOSA | 2 | `0`×193; `1`×7 |
| TX_OBSERVACOES | 63 | `REGISTRO ABERTO PARA RECOLHI`×1; `MAPA PRÉ *******************`×1; `27/07: Abertura de Registro `×1; `21/03: Abertura a de Registr`×1; `10/02: Abertura a de Registr`×1 |
| CD_MOEDA_MLE | 3 | `220`×56; `978`×5; `790`×1 |
| VL_MLE_MNEG | 62 | `0`×139; `1300100`×1; `26520`×1; `46746`×1; `44500`×1 |
| VL_MLE_MN | 60 | `0`×141; `13112141,825`×1; `112980,504`×1; `133079,32`×1; `195556,60616`×1 |
| CD_MOEDA_FRETE | 2 | `220`×53; `978`×7 |
| VL_FRETE_PREPAID_MNEG | 26 | `0`×175; `325`×1; `14000`×1; `984`×1; `2250`×1 |
| VL_FRETE_COLLECT_MNEG | 9 | `0`×192; `3000`×1; `1086,12`×1; `1988,72`×1; `2300`×1 |
| VL_FRETE_MN | 26 | `0`×175; `8540,58`×1; `836,43`×1; `24431,4`×1; `4253,28`×1 |
| CD_MOEDA_SEGURO | 3 | `220`×13; `978`×4; `790`×1 |
| VL_SEGURO_MNEG | 21 | `0`×180; `163,61`×1; `53,87`×1; `192,36`×1; `287,78`×1 |
| VL_SEGURO_MN | 25 | `0`×175; `465,77`×1; `115,85`×1; `335,69`×1; `615,48`×1 |
| CD_AGENTE | 35 | `0003`×11; `0031`×6; `0204`×6; `0023`×6; `0338`×3 |
| VL_TAXA_FRETE | 2 | `0`×199; `25`×1 |
| VL_CIF_DOLAR | 20 | `0`×181; `72993,25`×1; `51873,3`×1; `54180,36`×1; `59908,39`×1 |
| VL_CIF_MN | 47 | `0`×154; `157461,03`×1; `3954,29`×1; `76803,61`×1; `111558,71`×1 |
| VL_II_MN | 15 | `0`×186; `31492,21`×1; `17937,65`×1; `23153,43`×1; `38637,69`×1 |
| VL_IPI_MN | 13 | `0`×188; `28342,99`×1; `5577,94`×1; `7303,19`×1; `32011,97`×1 |
| VL_ICMS_MN | 18 | `0`×183; `52298,31`×1; `28793,09`×1; `23343,59`×1; `37294,71`×1 |
| CD_ARMAZEM_ATRACACAO | 28 | `0002`×8; `0200`×7; `0195`×6; `0008`×6; `0057`×4 |
| CD_ARMAZEM_DESCARGA | 17 | `0016`×6; `0007`×3; `0039`×2; `0009`×2; `0053`×2 |
| CD_ARMAZEM_ESTOCAGEM | 9 | `0197`×2; `0299`×2; `0145`×1; `0004`×1; `0009`×1 |
| CD_TRANSP_NAC | 41 | `1576`×4; `0411`×3; `0051`×3; `0780`×3; `0703`×2 |
| CD_EMBARCACAO | 62 | `1952`×2; `3003`×2; `3876`×1; `2937`×1; `6340`×1 |
| NR_VOO | 4 | `L71825`×1; `CLX7602`×1; `KLM0791`×1; `BLC8091`×1 |
| NR_CONHECIMENTO | 77 | `BR480715564`×1; `ANRM66200A1CEJ8U`×1; `1069491124`×1; `5210915336`×1; `MEDUSA364265`×1 |
| NR_CONHECIMENTO_MASTER | 10 | `04513455400`×1; `001GRU97442984`×1; `17218151534`×1; `07420664081`×1; `00198452804`×1 |
| CD_PAIS_ORIGEM | 14 | `105`×43; `249`×9; `160`×5; `023`×4; `245`×3 |
| CD_LOCAL_EMBARQUE | 39 | `0002`×23; `0090`×4; `0125`×3; `0005`×3; `0027`×2 |
| CD_PAIS_DESTINO | 27 | `105`×46; `249`×7; `169`×3; `063`×3; `160`×2 |
| CD_LOCAL_DESEMBARQUE | 40 | `0002`×29; `0125`×6; `0010`×3; `0063`×3; `0111`×2 |
| NR_DI | 31 | `2522298304`×1; `2324123150`×1; `0603490233`×1; `0801868682`×1; `2000249158`×1 |
| QT_REF_CLIENTE | 1 | `0`×200 |
| QT_SOLINUM | 1 | `0`×200 |
| QT_RECEBIMENTO | 1 | `0`×200 |
| QT_DEVOLUCOES | 1 | `0`×200 |
| QT_LANC_FAT | 1 | `0`×200 |
| BASE_CALCULO_SDA | 1 | `0`×200 |
| VL_SDA | 1 | `0`×200 |
| VL_CONTR_ASSIST | 1 | `0`×200 |
| DT_DISTRIBUICAO | 0 | *(all NULL/empty)* |
| CD_DESPACHANTE_SDA | 0 | *(all NULL/empty)* |
| CD_STATUS_SDA | 1 | `0`×200 |
| VL_FRETE_INTERNO | 1 | `0`×200 |
| NM_LOCAL_NF_LWW | 0 | *(all NULL/empty)* |
| DT_CONTABIL_LWW | 0 | *(all NULL/empty)* |
| TX_OBS_LWW | 0 | *(all NULL/empty)* |
| DT_ATRACACAO | 0 | *(all NULL/empty)* |
| DT_DESCARGA | 0 | *(all NULL/empty)* |
| DT_ESTOCAGEM | 0 | *(all NULL/empty)* |
| DT_CONHECIMENTO | 75 | `2023-09-19 00:00:00.000`×1; `2019-11-28 00:00:00.000`×1; `2006-11-14 00:00:00.000`×1; `2016-09-14 00:00:00.000`×1; `2025-09-17 00:00:00.000`×1 |
| DT_DESEMBARACO | 0 | *(all NULL/empty)* |
| IN_LIBERADO | 1 | `1`×200 |
| DT_EMBARQUE | 1 | `2012-09-05 00:00:00.000`×1 |
| CD_REGIME_TRIB | 0 | *(all NULL/empty)* |
| IN_CHEQUE_SDA | 1 | `0`×200 |
| IN_LIQUIDADO | 1 | `0`×200 |
| VL_FRETE_TNAC_MNEG | 1 | `0`×200 |
| IN_PRODUCAO | 1 | `1`×200 |
| NR_DDE | 13 | `21653300760`×1; `21600437311`×1; `21206823151`×1; `20704175339`×1; `21102297259`×1 |
| IN_SDA_PAGO | 1 | `0`×200 |
| TX_OBS_INT | 21 | `*PEDIDOS: 7025047292 *TRANSP`×1; `HASU5049170 - 0008137472 // `×1; `20/08 - MOTOBOY NITRO- PAGO `×1; `09/03: Processo bl hoje - Mé`×1; `Considerar TD/TS/Ordem para `×1 |
| CD_CANAL | 4 | `2`×64; `0`×2; `1`×1; `7`×1 |
| IN_URGENTE | 2 | `0`×196; `1`×4 |
| CD_ANALISTA_CLIENTE | 1 | `1639`×1 |
| CD_ANALISTA_COMISSARIA | 36 | `0087`×10; `2330`×9; `0789`×6; `0796`×5; `2057`×4 |
| NR_PRESENCA_CARGA | 23 | `CEMERCANTE310320081523052960`×1; `6644024284240220060000628S30`×1; `CEMERCANTE310320081519052903`×1; `7075CTGSSZ250920069085314BAQ`×1; `CEMERCANTE310320081519051479`×1 |
| DT_PRESENCA_CARGA | 25 | `2023-11-27 00:00:00.000`×2; `2025-10-06 00:00:00.000`×1; `2006-03-27 00:00:00.000`×1; `2020-01-06 00:00:00.000`×1; `2006-10-19 00:00:00.000`×1 |
| IN_POR_VEICULO | 0 | *(all NULL/empty)* |
| CD_USUARIO_REPASSA | 0 | *(all NULL/empty)* |
| NR_VIAGEM | 57 | `0123`×4; `0416`×2; `0323`×2; `0206`×2; `0223`×1 |
| IN_IMP_ARM | 1 | `0`×200 |
| CD_TRANSP_NAC_DOC | 5 | `0008`×1; `0176`×1; `0221`×1; `0051`×1; `0007`×1 |
| IN_DI_LIBERADA | 3 | `0`×182; `1`×17; `2`×1 |
| CD_LIBERADOR_DI | 2 | `0108`×1; `0087`×1 |
| NR_AVERBACAO | 0 | *(all NULL/empty)* |
| VL_PREMIO_SEGURO | 1 | `0`×200 |
| TP_BANCO_EXP | 0 | *(all NULL/empty)* |
| CD_BANCO_EXP | 0 | *(all NULL/empty)* |
| CD_AGENTE_SEGURO | 0 | *(all NULL/empty)* |
| VL_COMPL_SDA | 1 | `0`×200 |
| NR_DA | 0 | *(all NULL/empty)* |
| CD_CONTATO | 24 | `001`×5; `005`×3; `003`×3; `021`×2; `017`×2 |
| CD_AREA | 56 | `58`×121; `JX`×5; `FE`×4; `AJ`×3; `32`×3 |
| NR_MANIFESTO | 26 | `250048892`×1; `1523502015701`×1; `1148`×1; `CL144000184`×1; `19000450333`×1 |
| NM_CONEXAO | 0 | *(all NULL/empty)* |
| NR_PROCESSO_EXP_TEMP | 0 | *(all NULL/empty)* |
| DT_VENC_PROCESSO_EXP_TEMP | 0 | *(all NULL/empty)* |
| NR_DI_RETORNO | 0 | *(all NULL/empty)* |
| VL_PESO_LIQUIDO | 63 | `0`×136; `12000`×2; `5000000`×1; `5460`×1; `17640`×1 |
| VL_PESO_BRUTO | 63 | `0`×137; `5000000`×1; `6162`×1; `20788`×1; `25000`×1 |
| CD_INCOTERM | 8 | `FCA`×22; `CFR`×17; `FOB`×13; `CPT`×8; `EXW`×5 |
| NR_PROCESSO_VINC | 0 | *(all NULL/empty)* |
| TP_MIC_DTA | 1 | `T`×200 |
| TP_DESEMB_MIC_DTA | 1 | `T`×200 |
| CD_UNID_NEG_VINC | 0 | *(all NULL/empty)* |
| CD_PRODUTO_VINC | 0 | *(all NULL/empty)* |
| NR_DESPACHO | 0 | *(all NULL/empty)* |
| DT_CHEGADA | 0 | *(all NULL/empty)* |
| DT_APRESENTACAO | 0 | *(all NULL/empty)* |
| DT_CRUZE | 0 | *(all NULL/empty)* |
| DT_SOL_NUM | 0 | *(all NULL/empty)* |
| DT_REC_NUM | 0 | *(all NULL/empty)* |
| DT_RECEB_DOC | 0 | *(all NULL/empty)* |
| TP_PROCESSO | 1 | `1`×87 |
| NM_ATO_DECLARATORIO | 0 | *(all NULL/empty)* |
| CD_DESPACHANTE | 4 | `003`×8; `001`×2; `027`×1; `028`×1 |
| DT_REG_DDE | 13 | `2016-08-17 00:00:00.000`×1; `2016-01-20 00:00:00.000`×1; `2012-07-04 18:49:27.540`×1; `2007-04-10 00:00:00.000`×1; `2011-03-04 14:26:49.370`×1 |
| IN_ETIQUETA | 2 | `0`×199; `1`×1 |
| TP_FRETE | 2 | `0`×41; `1`×29 |
| NR_FATURA | 18 | `0080521003`×1; `NES077086/2019`×1; `NES073020/2018`×1; `438/07`×1; `NES094288/2022`×1 |
| CD_EMP_EST | 40 | `27321`×4; `28223`×3; `18805`×2; `06211`×1; `01738`×1 |
| NR_PLACA_VEICULO | 0 | *(all NULL/empty)* |
| NR_PERIODO_ARMAZENAGEM | 2 | `10`×1; `1`×1 |
| DT_VENCTO_ARMAZENAGEM | 5 | `2006-03-31 00:00:00.000`×1; `2020-01-18 00:00:00.000`×1; `2014-01-14 00:00:00.000`×1; `2011-08-07 00:00:00.000`×1; `2022-09-26 00:00:00.000`×1 |
| VL_FRETE_CUSTO | 0 | *(all NULL/empty)* |
| VL_M3 | 25 | `0`×174; `76`×2; `152`×2; `89,232`×1; `79,248`×1 |
| CD_IMPORTADOR | 59 | `02274`×100; `27321`×4; `00500`×4; `28223`×3; `18805`×2 |
| CD_EXPORTADOR | 50 | `00000`×100; `00013`×4; `02362`×3; `02870`×3; `00782`×3 |
| IN_ENTREPOSTO | 2 | `0`×199; `1`×1 |
| NR_PROCESSO_OR_ENTREPOSTO | 0 | *(all NULL/empty)* |
| CD_TRANSPORTADOR | 19 | `0008`×5; `0009`×3; `0225`×2; `0624`×2; `0020`×2 |
| CD_GRUPO | 31 | `B35`×101; `002`×23; `155`×22; `B58`×6; `A77`×5 |
| CD_CELULA | 30 | `89`×10; `92`×9; `87`×9; `75`×7; `11`×6 |
| NR_DTA | 1 | `1303967364`×1 |
| IN_REL_LEAD_TIME | 1 | `1`×200 |
| CD_TAB_SDA | 0 | *(all NULL/empty)* |
| IN_IMPORTANTE | 1 | `0`×200 |
| NR_CAMINHAO | 0 | *(all NULL/empty)* |
| CD_TP_DTA | 1 | `0`×1 |
| NR_REFERENCIA | 108 | `1051558325`×1; `6701958949`×1; `1049717318`×1; `1050530408`×1; `8001051044`×1 |
| DT_PEDIDO | 0 | *(all NULL/empty)* |
| HR_PEDIDO | 0 | *(all NULL/empty)* |
| HR_ABERTURA | 110 | `2024-11-11 10:53:19.000`×1; `2018-08-01 14:59:33.000`×1; `2023-03-29 11:48:27.000`×1; `2024-01-11 09:39:15.000`×1; `2022-12-13 17:15:47.533`×1 |
| NM_EMPRESA_BASF | 0 | *(all NULL/empty)* |
| CD_TP_PEDIDO | 3 | `11`×4; `9`×1; `12`×1 |
| NR_REF_EXPORTADOR | 0 | *(all NULL/empty)* |
| NM_PLANTA | 0 | *(all NULL/empty)* |
| NR_ORDEM | 0 | *(all NULL/empty)* |
| IN_CONSOLIDADO | 1 | `0`×3 |
| IN_SEGURO | 1 | `0`×3 |
| IN_EDI_BASF | 0 | *(all NULL/empty)* |
| CD_REF_IMP | 0 | *(all NULL/empty)* |
| IN_DADOS_IGUAIS_ITENS | 1 | `1`×108 |
| CD_IMP_EXP_FI | 0 | *(all NULL/empty)* |
| NR_PROPOSTA | 0 | *(all NULL/empty)* |
| TP_CARGA | 0 | *(all NULL/empty)* |
| CD_ORIGEM | 0 | *(all NULL/empty)* |
| CD_DESTINO | 0 | *(all NULL/empty)* |
| DESCR_INGLES | 0 | *(all NULL/empty)* |
| CD_TAB_FRETE_VENDA | 0 | *(all NULL/empty)* |
| CD_TAB_FRETE_COMPRA | 0 | *(all NULL/empty)* |
| CD_CIA_TRANSP | 0 | *(all NULL/empty)* |
| TP_FREQUENCIA | 0 | *(all NULL/empty)* |
| CD_ARMADOR | 0 | *(all NULL/empty)* |
| IN_ROUTING | 1 | `0`×87 |
| QTD_VOLUME | 0 | *(all NULL/empty)* |
| CUBAGEM | 0 | *(all NULL/empty)* |
| CHARGEABLE | 0 | *(all NULL/empty)* |
| CD_ESTUFAGEM | 0 | *(all NULL/empty)* |
| IN_CUBAGEM | 0 | *(all NULL/empty)* |
| TX_DESCR | 0 | *(all NULL/empty)* |
| VL_TARIFA_FRETE | 0 | *(all NULL/empty)* |
| VL_OTHER_CHARGE | 0 | *(all NULL/empty)* |
| VL_FRETE | 0 | *(all NULL/empty)* |
| VL_HOUSE | 0 | *(all NULL/empty)* |
| VL_RATEIO | 0 | *(all NULL/empty)* |
| VL_OTHER_CHARGE_CUSTO | 0 | *(all NULL/empty)* |
| OUTRA_TAXA | 0 | *(all NULL/empty)* |
| VL_RATEIO_DESPESA | 0 | *(all NULL/empty)* |
| VL_TT_VENDA | 0 | *(all NULL/empty)* |
| VL_TT_CUSTO | 0 | *(all NULL/empty)* |
| VL_DESP_MASTER | 0 | *(all NULL/empty)* |
| VL_PROFIT_AGENTE | 0 | *(all NULL/empty)* |
| VL_PROFIT_BRASIL | 0 | *(all NULL/empty)* |
| VL_DIVISAO | 0 | *(all NULL/empty)* |
| TP_DIVISAO | 0 | *(all NULL/empty)* |
| VL_DESP_BRASIL | 0 | *(all NULL/empty)* |
| VL_PROFIT_LIQUIDO | 0 | *(all NULL/empty)* |
| VL_PROFIT_HOUSE | 0 | *(all NULL/empty)* |
| VL_MERCADORIA | 0 | *(all NULL/empty)* |
| TP_ESTUFAGEM | 3 | `1`×66; `2`×15; `0`×10 |
| VL_DESP_AG | 0 | *(all NULL/empty)* |
| IN_PEDIDO | 1 | `0`×87 |
| IN_SELECIONADO | 1 | `0`×199 |
| VL_OVER | 0 | *(all NULL/empty)* |
| VL_COMISS_IATA | 0 | *(all NULL/empty)* |
| IN_ACCOUNT | 1 | `0`×199 |
| VL_ACCOUNT | 0 | *(all NULL/empty)* |
| OUTRA_TAXA_CUSTO | 0 | *(all NULL/empty)* |
| VL_REC_AG | 0 | *(all NULL/empty)* |
| VL_REC_BR | 0 | *(all NULL/empty)* |
| VL_TT_PROF_BR | 0 | *(all NULL/empty)* |
| VL_TT_PROF_AG | 0 | *(all NULL/empty)* |
| VL_VENDA_BRASIL | 0 | *(all NULL/empty)* |
| VL_DESP_REAL | 0 | *(all NULL/empty)* |
| VL_VENDA_CIA | 0 | *(all NULL/empty)* |
| VL_CUSTO_CIA | 0 | *(all NULL/empty)* |
| NR_CONTA_CONTABIL | 0 | *(all NULL/empty)* |
| CD_CT_LUCRO | 0 | *(all NULL/empty)* |
| CD_LOCAL_CONSOLIDACAO | 0 | *(all NULL/empty)* |
| IN_AS_AGREED | 0 | *(all NULL/empty)* |
| VL_FAT_COMPLEMENTAR | 0 | *(all NULL/empty)* |
| DT_RECEBIMENTO | 0 | *(all NULL/empty)* |
| DESCR_MERCADORIA | 0 | *(all NULL/empty)* |
| REF_CLIENTE | 0 | *(all NULL/empty)* |
| CD_USUARIO_ALTEROU_CANAL | 29 | `MYIV`×5; `4995`×4; `0911`×3; `5663`×3; `2890`×2 |
| CD_LINGUA_PEDIDO | 3 | `1`×10; `2`×8; `0`×2 |
| NR_COURRIER | 0 | *(all NULL/empty)* |
| CD_ARMAZEM_TABELA_CLIENTE | 1 | `1`×1 |
| IN_TRANSMITE_SEM_PREVISAO | 1 | `0`×61 |
| VL_OTHER_CHARGE_CC | 0 | *(all NULL/empty)* |
| CD_TAB_FRETE | 0 | *(all NULL/empty)* |
| NR_VIAGEM_ARMADOR | 0 | *(all NULL/empty)* |
| CD_FRONTEIRA | 3 | `0523`×5; `0546`×1; `0348`×1 |
| IN_COURRIER | 1 | `0`×1 |
| NUM_CE | 20 | `152305296015807`×1; `151905290344490`×1; `151905147933657`×1; `152305305059123`×1; `151805137449729`×1 |
| CD_PRIMEIRO_PORTO_ATRAC | 0 | *(all NULL/empty)* |
| ID_CODIGO_INSTR_DESEMB | 2 | `ID00001482-16`×1; `ID00003012-12`×1 |
| CD_TERMO_PAGTO | 0 | *(all NULL/empty)* |
| DIAS_CONDICAO_PAGTO | 3 | `60`×1; `30`×1; `90`×1 |
| CONDICAO_PAGTO | 1 | `I`×2 |
| CD_LOCAL_TRANSBORDO | 8 | `0201`×2; `0006`×2; `0156`×2; `0468`×1; `0071`×1 |
| IN_PRODUTO_IMPORTADO | 1 | `0`×190 |
| CD_CONTATO_AG | 0 | *(all NULL/empty)* |
| VL_TRANSIT_TIME | 21 | `16`×3; `0`×2; `28`×2; `35`×2; `45`×1 |
| VL_AFRMM | 0 | *(all NULL/empty)* |
| CD_CONSIGNEE | 20 | `08809`×2; `21328`×1; `12740`×1; `22001`×1; `06069`×1 |
| TP_CONSIGNEE | 1 | `0`×21 |
| IN_DSE | 1 | `0`×2 |
| CD_LOCAL_ENTREGA | 12 | `0967`×2; `2595`×2; `2012`×1; `0342`×1; `2653`×1 |
| CD_ACORDO | 0 | *(all NULL/empty)* |
| QNTD_ACORDO | 3 | `1`×4; `0`×1; `2`×1 |
| TP_CERTIFICADO | 4 | `COMUM`×1; `TRIANGULAR`×1; `FATURA TRIANGULAR INFERIOR A`×1; `CO + FITO`×1 |
| DOCS_ENVIADO_PARA | 11 | `21328`×1; `12189`×1; `22001`×1; `08448`×1; `11547`×1 |
| TP_ENVIO_CERTIFICADO | 1 | `CARGA`×1 |
| IN_WEB | 1 | `1`×5 |
| CD_ANALISTA_CRIADOR | 1 | `2696`×1 |
| NR_PRAZO_VENCTO_ARM | 0 | *(all NULL/empty)* |
| CD_RESP_DRAFT | 0 | *(all NULL/empty)* |
| CD_RESP_DESEMB | 0 | *(all NULL/empty)* |
| IN_MONEY | 1 | `1`×187 |
| IN_PROCESSO_MAPA | 1 | `0`×198 |
| IN_APENAS_EMISSAO_DOCTOS | 1 | `0`×198 |
| IN_DRAWBACK_ALADI | 2 | `0`×181; `1`×2 |
| IN_MBF | 1 | `1`×5 |
| VL_LEAD_TIME | 8 | `45`×1; `24`×1; `40`×1; `11`×1; `37`×1 |
| QT_MERC_UN_COMERC | 4 | `2100`×1; `14696,24`×1; `20000`×1; `1`×1 |
| VL_FOB | 0 | *(all NULL/empty)* |
| CD_UNID_MEDIDA | 3 | `159`×2; `011`×1; `010`×1 |
| DT_NAVIO_ALTERADO | 17 | `2016-09-05 17:13:37.760`×1; `2023-03-28 14:04:32.000`×1; `2022-02-23 10:42:41.907`×1; `2019-08-16 17:23:57.323`×1; `2023-09-01 11:29:51.470`×1 |
| IN_CE_ENVIADO | 1 | `1`×2 |
| IN_COBRANCA_DTA | 1 | `0`×177 |
| TB_ARMAZENAGEM | 0 | *(all NULL/empty)* |
| CD_USUARIO_LIB_TRANS_DI | 0 | *(all NULL/empty)* |
| DT_LIB_TRANS_DI | 0 | *(all NULL/empty)* |
| CD_LOCAL_TRANSBORDO2 | 0 | *(all NULL/empty)* |
| CD_LOCAL_TRANSBORDO3 | 0 | *(all NULL/empty)* |
| IN_EXTRATO_DDE_ENVIADO | 0 | *(all NULL/empty)* |
| NR_DEPOT | 4 | `0299`×2; `0199`×1; `0400`×1; `0258`×1 |
| CD_ERP | 1 | `1`×77 |
| SEQ_POSYSTEM | 0 | *(all NULL/empty)* |
| TX_NCM | 2 | `15050010;34049029`×1; `39173290;39269090;84189900;8`×1 |
| CD_NOTIFY1_PROC | 4 | `11547`×1; `06120`×1; `29282`×1; `09591`×1 |
| CD_NOTIFY2_PROC | 0 | *(all NULL/empty)* |
| TP_NOTIFY1_PROC | 1 | `0`×4 |
| TP_NOTIFY2_PROC | 0 | *(all NULL/empty)* |
| TX_MARCACAO_VOL_PROC | 5 | `NESTLE DOMINICANA S.A 456000`×1; `NESCAFE`×1; `IBBL/BRAZIL - PROFORMA:62401`×1; `NESTLE PERU S.A. 4579998243 `×1; `NESTLE INTERNATIONAL TRAVEL `×1 |
| CD_RUC | 26 | `3BR6049870620001570000000000`×1; `9BR5910599910003481200158E19`×1; `3BR591798382PIRELLI738041`×1; `2BR591798382PIRELLI735066`×1; `1BR6049870620001570000000000`×1 |
| CD_DUE | 26 | `23BR0015108188`×1; `19BR0016414992`×1; `23BR0004808604`×1; `22BR0002853998`×1; `21BR0012823684`×1 |
| IN_CROSSDOCKING | 1 | `0`×21 |
| VL_DESCONTO_MN | 0 | *(all NULL/empty)* |
| VL_ACRESCIMO_MN | 1 | `4091,66`×1 |
| IN_DESEMBARACO_SOBRE_AGUAS | 2 | `0`×20; `1`×1 |
| CD_EMBARCACAO_BALDEACAO | 0 | *(all NULL/empty)* |
| NR_VIAGEM_BALDEACAO | 0 | *(all NULL/empty)* |
| IN_BALDEACAO | 1 | `0`×20 |
| SEQ_PROG_RODOVIARIA | 3 | `1`×6; `2`×2; `3`×2 |
| NR_PEDIDO_PGMTO_AFRMM | 13 | `2301602295`×1; `2000003594`×1; `1900879174`×1; `2301714549`×1; `2001557518`×1 |
| TX_EMAIL_PROCESSO | 0 | *(all NULL/empty)* |
| IN_PROCESSO_CONSOLIDADO | 0 | *(all NULL/empty)* |
| CD_DUIMP | 0 | *(all NULL/empty)* |
| IN_FRETE_ACORDADO | 2 | `0`×16; `1`×3 |
| CD_OPERADOR_TANQUE | 0 | *(all NULL/empty)* |
| IN_MADEIRA_CONDENADA | 1 | `0`×45 |
| DS_ARMAZEM_MANTRA | 0 | *(all NULL/empty)* |
| CONSULTA_SISCARGA_FRETE | 2 | `0`×9; `1`×1 |
| IN_ICMS_EXONERADO | 1 | `0`×18 |
| BOOKING_CONTRACT_NUMBER | 0 | *(all NULL/empty)* |
| BOOKING_CONTRACT_PARTY | 0 | *(all NULL/empty)* |
| BOOKING_MOVE_TYPE | 0 | *(all NULL/empty)* |
| BOOKING_HS_CODE | 0 | *(all NULL/empty)* |
| BOOKING_CUSTOMER_COMMENTS | 0 | *(all NULL/empty)* |
| BOOKING_PARTNER_EMAIL | 0 | *(all NULL/empty)* |
| IN_MUDANCA_REGIME | 1 | `0`×12 |
| CD_LOCAL_COLETA | 0 | *(all NULL/empty)* |
| CD_CHAVE_ACESSO_DUE | 2 | `26MFN159544177`×1; `25OVQ158022993`×1 |
| IN_CSI_MAPA | 1 | `0`×3 |
| IN_COBRANCA_ECAC | 1 | `0`×2 |

## `TFOLLOWUP_ETAPA`

- Source: `myindaia-problemas-csv/Problema_3_tfollowup_etapa.csv`
- Rows: 200 · schema columns: 7 · observed widths: {7: 200} · **PASS**
- Written: `W3_samples_rehydrated/TFOLLOWUP_ETAPA.csv`

| Column | distinct non-NULL | top values (count) |
|---|--:|---|
| CD_UNID_NEG | 3 | `01`×190; `02`×6; `07`×4 |
| CD_PRODUTO | 2 | `01`×110; `02`×90 |
| NR_PROCESSO | 200 | `0101IM-000350-26`×1; `0101TD-000106-24`×1; `0102EM-013001-25`×1; `0102EM-009065-14`×1; `0102EM-014830-22`×1 |
| CD_FOLLOWUP_ETAPA | 12 | `2`×34; `1`×32; `3`×30; `6`×27; `4`×23 |
| CD_ETAPA | 48 | `85`×18; `100`×17; `1118`×12; `111`×12; `119`×12 |
| CD_USUARIO | 10 | `0707`×191; `5846`×1; `4694`×1; `3559`×1; `4162`×1 |
| DT_ALTERACAO | 200 | `2026-02-04 10:21:38.337`×1; `2024-02-14 07:49:19.033`×1; `2025-10-08 08:03:23.200`×1; `2014-12-12 16:23:09.357`×1; `2022-09-09 11:42:59.873`×1 |

## `TDECLARACAO_IMPORTACAO`

- Source: `myindaia-problemas-csv/Problema_3_tdeclaracao_importacao.csv`
- Rows: 200 · schema columns: 156 · observed widths: {156: 200} · **PASS**
- Written: `W3_samples_rehydrated/TDECLARACAO_IMPORTACAO.csv`

| Column | distinct non-NULL | top values (count) |
|---|--:|---|
| NR_PROCESSO | 200 | `0101IR-000446-16`×1; `0101IM-4238-09`×1; `0101IM-012326-17`×1; `0101IM-006033-23`×1; `0101IA-001361-24`×1 |
| NR_IDENT_USUARIO | 96 | `0101IR00044616`×1; `0101IM01232617`×1; `0101IA00136124`×1; `0101IM00853420`×1; `0101IM00821017`×1 |
| CD_APLICACAO_MERC | 2 | `1`×84; `2`×53 |
| CD_BANDEIRA_TRANSP | 26 | `023`×46; `249`×28; `105`×9; `232`×8; `767`×8 |
| CD_COBERTURA_CAMBIAL | 3 | `1`×191; `4`×7; `2`×2 |
| CD_DESTAQUE_NCM | 5 | `999`×31; `001`×4; `080`×4; `002`×3; `033`×1 |
| CD_FORMA_PAGAMENTO | 3 | `3`×138; `1`×58; `2`×4 |
| CD_FUND_LEGAL_II | 5 | `16`×6; `87`×2; `52`×1; `30`×1; `59`×1 |
| CD_IMPORTADOR | 85 | `00007`×23; `00006`×10; `01915`×9; `01699`×9; `02028`×8 |
| CD_INCOTERM | 11 | `CFR`×81; `FCA`×35; `EXW`×23; `FOB`×22; `CPT`×13 |
| CD_LOCAL_EMBARQUE | 82 | `0030`×13; `0001`×11; `0005`×9; `0003`×8; `0123`×7 |
| CD_METODO_VALORACAO | 2 | `01`×197; `02`×3 |
| CD_MODALIDADE_DESP | 3 | `1`×195; `7`×2; `2`×1 |
| CD_MODALIDADE_PAGTO | 5 | `31`×131; `21`×3; `10`×2; `52`×1; `1`×1 |
| CD_MOEDA_DESPESAS | 0 | *(all NULL/empty)* |
| CD_MOEDA_FRETE | 3 | `220`×115; `978`×72; `425`×2 |
| CD_MOEDA_MLE | 5 | `220`×95; `978`×33; `790`×10; `425`×4; `540`×4 |
| CD_MOEDA_SEGURO | 6 | `220`×113; `978`×33; `790`×6; `425`×4; `540`×4 |
| CD_MOTIVO_SEM_COBERTURA | 4 | `99`×3; `39`×2; `52`×1; `41`×1 |
| CD_MOTIVO_TRANS | 0 | *(all NULL/empty)* |
| CD_PAIS_IMPORTADOR | 0 | *(all NULL/empty)* |
| CD_PAIS_PROC_CARGA | 33 | `249`×47; `023`×36; `160`×25; `087`×13; `245`×9 |
| CD_RECINTO_ALFAND | 50 | `8931356`×38; `8911101`×28; `8933204`×16; `8921101`×13; `8931359`×11 |
| CD_REG_TRIB_II | 4 | `1`×134; `3`×5; `5`×4; `4`×2 |
| CD_REG_TRIB_IPI | 4 | `4`×130; `5`×7; `2`×4; `1`×1 |
| CD_SETOR_ARMAZENAM | 13 | `001`×50; `006`×45; `002`×28; `500`×17; `011`×13 |
| CD_TIPO_AG_CARGA | 0 | *(all NULL/empty)* |
| CD_TIPO_CONSIG | 3 | `1`×191; `0`×7; `2`×1 |
| CD_TIPO_DCTO_CARGA | 9 | `10`×110; `03`×38; `1`×29; `2`×7; `01`×6 |
| CD_TIPO_DECLARACAO | 3 | `01`×198; `02`×1; `14`×1 |
| CD_TIPO_IMPORTADOR | 1 | `1`×200 |
| CD_TIPO_MANIFESTO | 4 | `1`×109; `2`×39; `3`×11; `4`×3 |
| CD_TRANSPORTADOR | 88 | `0008`×15; `0624`×8; `0225`×8; `1867`×7; `0016`×7 |
| CD_URF_DESPACHO | 21 | `0817800`×115; `0817600`×28; `0817700`×21; `0717600`×8; `0927800`×4 |
| CD_URF_ENTR_CARGA | 18 | `0817800`×122; `0817600`×29; `0817700`×18; `0717600`×7; `0927800`×4 |
| CD_UTIL_DCTO_CARGA | 1 | `1`×200 |
| CD_VIA_TRANSP_CARG | 3 | `01`×144; `04`×52; `07`×4 |
| CD_VINC_IMPO_EXPO | 2 | `1`×122; `2`×78 |
| DT_CHEGADA_CARGA | 188 | `00000000`×11; `19062023`×2; `26102022`×2; `02082016`×1; `29092009`×1 |
| DT_EMBARQUE | 187 | `30121899`×4; `00000000`×3; `12062011`×2; `24102019`×2; `27042023`×2 |
| DT_PROCESSAMENTO | 0 | *(all NULL/empty)* |
| DT_REGISTRO_DI | 192 | `25112019`×2; `27062023`×2; `22052017`×2; `14082018`×2; `01032005`×2 |
| DT_TRANSMISSAO | 111 | `Oct 25 2`×2; `Apr 22 2`×2; `Nov 25 2`×2; `Jun 27 2`×2; `May 13 2`×2 |
| IN_BEM_ENCOMENDA | 1 | `0`×200 |
| IN_MATERIAL_USADO | 1 | `0`×200 |
| IN_MOEDA_NACIONAL | 2 | `0`×137; `F`×63 |
| IN_MOEDA_UNICA | 2 | `1`×148; `0`×52 |
| IN_MULTIMODAL | 1 | `0`×200 |
| IN_OPERACAO_FUNDAP | 1 | `0`×200 |
| IN_RATEAR_FRETE_ITENS | 1 | `1`×200 |
| IN_RATEAR_SEGURO_ITENS | 1 | `1`×200 |
| IN_REPASSA_DADOS_ADICAO | 2 | `1`×132; `0`×68 |
| IN_REPASSA_DADOS_CAMBIO | 2 | `1`×142; `0`×58 |
| NM_CONSIGNATARIO | 0 | *(all NULL/empty)* |
| NM_VEICULO_TRANSP | 101 | `MSC VITA`×3; `MAERSK LEON`×3; `VALIANT`×2; `NORTHERN MAGNUM`×2; `ALIANÇA MAUÁ`×2 |
| NR_AGENTE_CARGA | 47 | `N/I`×36; `60867520000209`×16; `02378779000532`×11; `96452545000108`×10; `05951386001455`×6 |
| NR_BANCO_COM | 0 | *(all NULL/empty)* |
| NR_BANCO_PAGAMENTO | 2 | `7409`×1; `4048`×1 |
| NR_COMPRADOR_ME | 19 | `59105999003959`×6; `59105999002804`×4; `59105999000348`×3; `48539407000207`×2; `48539407007392`×2 |
| NR_CONSIGNATARIO | 1 | `60409075004905`×1 |
| NR_CONTRATO_CAMBIO | 2 | `05013666`×1; `10099693`×1 |
| NR_CPF_REPR_LEGAL | 3 | `08061411822`×15; `72738804853`×12; `16239665827`×11 |
| NR_DCTO_CARGA | 170 | `CEMER`×30; `029AR254007806`×1; `G233/904640`×1; `SUDUN7421A6QG0HW`×1; `ZRH00006432`×1 |
| NR_DCTO_CARGA_MAST | 76 | `152305093053810`×1; `04730655026`×1; `12537386963`×1; `152405197988954`×1; `152205283210879`×1 |
| NR_DECL_IMP_PROT | 32 | `1093062140`×1; `1342562574`×1; `0760648638`×1; `1004714723`×1; `0848965981`×1 |
| NR_DECLARACAO_IMP | 197 | `1611942480`×1; `0914255600`×1; `1718418010`×1; `2308529112`×1; `2408472112`×1 |
| NR_IDENTIFICACAO_COM | 0 | *(all NULL/empty)* |
| NR_MANIFESTO | 147 | `16AR224215C`×1; `4100`×1; `17000374541`×1; `240117042`×1; `20000166175`×1 |
| NR_PRACA_COM | 0 | *(all NULL/empty)* |
| NR_PRACA_PAGAMENTO | 1 | `5885`×2 |
| NR_ROF | 0 | *(all NULL/empty)* |
| NR_VEICULO_TRANSP | 3 | `JXF1401/MHH9048`×1; `KCFS74/GRJX12`×1; `IFB3882/IIQ9503`×1 |
| PB_CARGA | 182 | `0`×16; `1470`×2; `17`×2; `856,8`×2; `51790`×1 |
| PC_COMISSAO | 1 | `0`×200 |
| PC_ICMS | 7 | `18`×121; `0`×63; `16`×7; `17`×6; `2`×1 |
| PC_REDUCAO_ICMS | 7 | `0`×186; `30`×5; `20`×3; `61,11`×2; `90`×2 |
| PL_CARGA | 168 | `0`×16; `20000`×4; `18000`×3; `16000`×2; `100000`×2 |
| QT_ADICOES | 10 | `1`×141; `2`×23; `0`×16; `3`×11; `4`×3 |
| TX_INFO_COMPL | 200 | `PRESTADORA DO SERVIÇO: INDAI`×1; `|| PRESTADORA DO SERVIÇO : I`×1; `PRESTADORA DO SERVICO : INDA`×1; `N/REF.: 2023/56856 PRESTADOR`×1; `PRESTADORA DO SERVIÇO: INDAI`×1 |
| VL_FRETE_TNAC_MNEG | 5 | `0`×196; `2589,5`×1; `3801,3`×1; `2000`×1; `3536,03`×1 |
| VL_TOT_DESPS_MN | 1 | `0`×200 |
| VL_TOT_DESPS_MNEG | 1 | `0`×200 |
| VL_TOT_FRT_COLLECT | 77 | `0`×124; `995,13`×1; `690`×1; `1041,49`×1; `265,72`×1 |
| VL_TOT_FRT_PREPAID | 105 | `0`×89; `1500`×3; `1900`×2; `250`×2; `2400`×2 |
| VL_TOT_MLE_MNEG | 145 | `0`×54; `49107,32`×2; `25920`×2; `42884,73`×1; `5088`×1 |
| VL_TOT_SEGURO_MNEG | 156 | `0`×42; `1,41`×2; `2,02`×2; `0,39`×2; `82,64`×1 |
| VL_TOTAL_FRETE_MN | 188 | `0`×13; `2523,99`×1; `438,77`×1; `6080,57`×1; `10518,78`×1 |
| VL_TOTAL_MLE_MN | 147 | `0`×54; `139332,49`×1; `12979,34`×1; `224936,13`×1; `35835,25`×1 |
| VL_TOTAL_SEG_MN | 122 | `0`×79; `268,5`×1; `18,49`×1; `71,75`×1; `52,33`×1 |
| PC_SEGURO_MLE | 60 | `0`×92; `0,1475`×8; `0,11`×5; `0,12593`×4; `0,0236`×4 |
| VL_TOTAL_II | 149 | `0`×52; `1833,58`×1; `31677,82`×1; `11615,55`×1; `5018,8`×1 |
| VL_TOTAL_IPI | 95 | `0`×106; `746,53`×1; `12897,4`×1; `3748,08`×1; `1515,42`×1 |
| VL_TOTAL_AD | 1 | `0`×184 |
| DT_ULTIMA_ALTERACAO | 156 | `2023-06-27 00:00:00.000`×2; `2017-05-22 00:00:00.000`×2; `2018-08-14 00:00:00.000`×2; `2019-04-12 00:00:00.000`×2; `2005-01-06 00:00:00.000`×2 |
| IN_RISC_ATUALIZADO | 1 | `0`×200 |
| CD_TIPO_BASE_SEGURO | 4 | `2`×148; `1`×35; `3`×2; `4`×1 |
| IN_REB | 1 | `0`×200 |
| VL_TOT_ICMS | 116 | `0`×85; `32516,04`×1; `3820,14`×1; `65337,06`×1; `11775,08`×1 |
| CD_TIPO_PGTO_TRIB | 1 | `1`×200 |
| NR_CONTA_PGTO_TRIB | 61 | `0000000000000016839`×32; `253101`×25; `4617`×14; `1570`×10; `801889`×7 |
| TX_MLE | 135 | `0`×54; `1`×10; `3,7591`×2; `6,0988`×2; `2,632`×2 |
| TX_FRETE | 149 | `0`×49; `4,9696`×2; `4,3862`×2; `2,632`×2; `3,249`×1 |
| TX_SEGURO | 116 | `0`×77; `1`×6; `3,7591`×2; `6,0988`×2; `2,632`×2 |
| TX_DOLAR | 156 | `0`×38; `3,127`×3; `3,7591`×2; `4,7698`×2; `4,9696`×2 |
| NR_REF_CLI | 0 | *(all NULL/empty)* |
| IN_SISCOMEX | 1 | `0`×200 |
| CD_TIPO_ICMS | 4 | `1`×149; `3`×33; `2`×11; `4`×7 |
| IN_ICMS_IMPRESSO | 3 | `0`×108; `2`×90; `1`×2 |
| DT_ICMS_IMPRESSO | 86 | `2023-06-27 00:00:00.000`×2; `2018-08-14 00:00:00.000`×2; `2019-04-12 00:00:00.000`×2; `2018-11-26 00:00:00.000`×2; `2016-08-04 00:00:00.000`×1 |
| VL_TOTAL_ACRESCIMOS_MN | 83 | `0`×114; `667,01`×3; `666,98`×2; `750,01`×2; `99,2`×1 |
| VL_TOTAL_DEDUCOES_MN | 2 | `0`×199; `8413,29`×1 |
| DT_CALCULO | 143 | `2023-06-27 00:00:00.000`×2; `2018-08-14 00:00:00.000`×2; `2005-03-01 00:00:00.000`×2; `2016-08-04 00:00:00.000`×1; `2009-10-16 00:00:00.000`×1 |
| VL_DESPESA_ITEM | 0 | *(all NULL/empty)* |
| VL_DESPESA_ITEM_MN | 0 | *(all NULL/empty)* |
| CD_ORGAO_FIN_INTER | 0 | *(all NULL/empty)* |
| CD_PRESENCA_CARGA | 117 | `2016AR0254007806`×1; `CEMERCANTE310320081509051226`×1; `CEMERCANTE310320081517052110`×1; `CEMERCANTE310320081520051140`×1; `CEMERCANTE310320081517051492`×1 |
| NR_SEQ_RETIFICACAO | 1 | `00`×38 |
| CD_MOTIVO_RETIF | 0 | *(all NULL/empty)* |
| DT_RETIFICACAO | 0 | *(all NULL/empty)* |
| DT_EXON_IMPRESSO | 11 | `2019-01-21 00:00:00.000`×1; `2008-10-13 00:00:00.000`×1; `2005-12-27 00:00:00.000`×1; `2014-07-17 00:00:00.000`×1; `2014-07-24 00:00:00.000`×1 |
| IN_EXON_IMPRESSO | 3 | `0`×188; `2`×11; `1`×1 |
| CD_TRIBUTACAO_ICMS | 6 | `1`×102; `7`×16; `4`×11; `5`×7; `3`×6 |
| CD_FUND_LEGAL_ICMS | 20 | `186`×7; `032`×5; `281`×3; `064`×3; `211`×2 |
| VL_TOTAL_CAMBIO | 140 | `0`×59; `49107,32`×2; `25920`×2; `42884,73`×1; `5088`×1 |
| CD_AUSENCIA_FABRIC | 3 | `1`×74; `2`×62; `3`×5 |
| CD_FORNECEDOR | 121 | `08249`×6; `20506`×5; `00013`×5; `09265`×3; `10488`×3 |
| CD_FABRICANTE | 50 | `16732`×3; `23047`×2; `05214`×2; `14688`×2; `24243`×1 |
| CD_PAIS_AQUIS_MERC | 32 | `249`×34; `023`×31; `573`×10; `160`×8; `628`×7 |
| CD_PAIS_ORIG_MERC | 18 | `160`×12; `249`×12; `023`×10; `386`×3; `190`×3 |
| QT_PARC_FINANC_360 | 1 | `1`×81 |
| QT_PERIOD_PGTO_360 | 11 | `60`×32; `90`×16; `30`×12; `180`×8; `45`×4 |
| CD_PERIOD_PGTO_360 | 2 | `1`×80; `2`×1 |
| IN_EMBUT_FRT_ITENS | 2 | `0`×121; `1`×79 |
| IN_EMBUT_SEG_ITENS | 2 | `0`×193; `1`×7 |
| VL_TOTAL_ACRESCIMOS_MNEG | 87 | `0`×114; `38,887`×1; `416,84`×1; `135,76`×1; `192,18`×1 |
| VL_TOTAL_DEDUCOES_MNEG | 2 | `0`×199; `2589,5`×1 |
| VL_TOTAL_FRETE_MNEG | 177 | `0`×13; `1900`×3; `1500`×3; `250`×2; `2400`×2 |
| NR_PROCESSO_SISCOMEX | 48 | `00017/11`×2; `00001/05`×2; `00045/09`×1; `00038/11`×1; `00070/12`×1 |
| IN_PGTO_VARIAV_360 | 2 | `0`×149; `1`×51 |
| CD_VEICULO_TRANSP | 100 | `3138`×3; `2516`×3; `2788`×2; `4643`×2; `1312`×2 |
| PC_REDUCAO_IPT_BLI | 1 | `0`×200 |
| DT_DI | 192 | `2019-11-25 00:00:00.000`×2; `2023-06-27 00:00:00.000`×2; `2017-05-22 00:00:00.000`×2; `2018-08-14 00:00:00.000`×2; `2005-03-01 00:00:00.000`×2 |
| VL_TOTAL_TX_SCX | 15 | `214,5`×67; `0`×54; `40`×21; `154,23`×21; `192,79`×11 |
| VL_TOT_PIS_COFINS | 121 | `0.00`×36; `16726.43`×1; `1685.73`×1; `26586.74`×1; `5305.25`×1 |
| VL_TOTAL_SEGURO_MN | 139 | `0`×55; `268,5`×1; `71,75`×1; `22,24`×1; `52,33`×1 |
| IN_CALCULOU_COM_AFRMM | 2 | `1`×78; `0`×54 |
| HR_DI | 144 | `09:30:55`×1; `13:12:21`×1; `14:47:52`×1; `13:48:46`×1; `08:56:42`×1 |
| HR_CALCULO | 128 | `09:37:29`×1; `13:25:17`×1; `14:51:43`×1; `13:57:06`×1; `14:35:30`×1 |
| VL_TOTAL_II_SEM_SEGURO | 12 | `266,71`×1; `17116,31`×1; `20187,87`×1; `26475,94`×1; `20783,7`×1 |
| VL_TOTAL_IPI_SEM_SEGURO | 10 | `0`×3; `139,3`×1; `6968,78`×1; `6617,14`×1; `6235,11`×1 |
| VL_TOT_ICMS_SEM_SEGURO | 12 | `438,56`×1; `32171,47`×1; `35271,17`×1; `0`×1; `31757,65`×1 |
| NR_TRANSMISSAO | 63 | `[object Text]`×20; `211288016-5`×1; `227771825-9`×1; `321724302-3`×1; `224642179-3`×1 |
| CD_USUARIO_TRANSMISSAO | 48 | `0173`×8; `1892`×6; `3588`×6; `3580`×5; `4107`×5 |
| IN_FMA | 1 | `0`×54 |
| DT_PAGAMENTO_DARF | 0 | *(all NULL/empty)* |
| TX_INFO_COMPL_AUTO | 1 | `PRESTADORA DO SERVICO : INDA`×1 |