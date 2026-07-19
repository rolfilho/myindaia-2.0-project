(*******************************************************************************
  Sistema    : MyIndaia - Indaiá Logística Internacional
  PROGRAMA   : PGSM155.PAS - frm_po_leitura - INTEGRACAO Indaiá Logística x EASY  /  REV 10
  DATA       : 29/01/2001
  Manutenção :
*******************************************************************************)
unit PGSM155;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Menus, StdCtrls, ComCtrls, Db, FileText, DBTables, Funcoes;

type
  Tfrm_po_leitura = class(TForm)
    menu_: TMainMenu;
    mi_integrar_: TMenuItem;
    mi_sair_: TMenuItem;
    pnl_integra: TPanel;
    btn_integrar: TSpeedButton;
    speed_sair_: TSpeedButton;
    open_file_: TOpenDialog;
    Panel1: TPanel;
    progress_file_: TProgressBar;
    pnl_file_: TPanel;
    Speed_file_: TSpeedButton;
    Label1: TLabel;
    edt_nm_file_: TEdit;
    procedure Speed_file_Click(Sender: TObject);
    procedure btn_integrarClick(Sender: TObject);
    procedure speed_sair_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mi_sair_Click(Sender: TObject);
    procedure edt_nm_file_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_integrar_Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function LerLinha( nInicio : Integer; nTamanho : Integer; cTipo : String ) : String;
    procedure LeiaCapI;
    procedure LeiaCap2;
    procedure LeiaCap3;
    procedure LeiaIteA;
    procedure LeiaIteB;
    procedure LeiaIteC;
    procedure LeiaIteD;
    procedure LeiaITDI;
    procedure LeiaDPnn;
    procedure ProcessaCapa;
    procedure ProcessaItem;
    function StrToBoolean( cCaracter : String ) : Boolean;
    function StrToStr( cCaracter : String ) : String;
    { Private declarations }
  public
    { Public declarations }
    tp_leitura : Byte;
    Stri       : String;
  end;

var
  frm_po_leitura: Tfrm_po_leitura;
  Arquivo   : TFileText;
  cItem     : String[3];
  cd_import : String[14];
  nr_itens  : LongInt;
  POFatura  : integer;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGPO013, PGGP017;


procedure Tfrm_po_leitura.Speed_file_Click(Sender: TObject);
begin
  if open_file_.Execute then
    edt_nm_file_.Text := open_file_.FileName;
end;

procedure Tfrm_po_leitura.btn_integrarClick(Sender: TObject);
var f, ArqSAP: TextFile;
    reg, vProcesso : String;
    cIdent : String[4];
    vMaxItem : String[3];
    nMax : Real;
    mens_ato : AnsiString;
begin
  if Length( edt_nm_file_.Text ) = 0 then
  begin
    edt_nm_file_.SetFocus;
    BoxMensagem( 'O nome do arquivo texto para integração deverá ser informado.', 2 );
    edt_nm_file_.SetFocus;
    Exit;
  end
  else
  begin
    if Not FileExists( edt_nm_file_.Text ) then
    begin
      BoxMensagem( 'O arquivo "' + edt_nm_file_.Text + '" não existe ou não está disponível. Tente novamente.', 2 );
      edt_nm_file_.SetFocus;
      Exit;
    end
    else
    begin
      AssignFile( f, edt_nm_file_.text );
      {$i-}
      Reset( f );
      {$i+}
      if ioresult <> 0 then
      begin
        BoxMensagem( 'Ocorreu um erro quando o sistema tentou abrir o arquivo "' + edt_nm_file_.Text +'".', 2 );
        edt_nm_file_.SetFocus;
        Exit;
      end;
    end;
  end;

  Arquivo := TFileText.Create;
  Arquivo.Name := edt_nm_file_.Text;
  Arquivo.Open;

  // Leitura PO Padrão
  if tp_leitura = 1 then
  begin
    nMax := ( Arquivo.FSize / 242 );
    progress_file_.Max  := Round( nMax ) + 1;
    progress_file_.Step := 1;

    cItem := '000';
    cd_import := '';
    try
      datm_main.db_broker.StartTransaction;

      while not ( Arquivo.Eof ) do
      begin
        Arquivo.Read(242);

        cIdent := LerLinha( 001, 004, 'C' );

        if ( cIdent = 'CAPI' ) or ( cIdent = 'CAP2' ) or ( cIdent = 'CAP3' ) then
           cItem := '000';

        if cIdent = 'CAPI' then
        begin
          LeiaCapI;
          POFatura := 0;
        end
        else
        if cIdent = 'CAP2' then
           LeiaCap2
        else if cIdent = 'CAP3' then
           LeiaCap3
        else if cIdent = 'ITEA' then
           LeiaIteA
        else if cIdent = 'ITEB' then
           LeiaIteB
        else if LerLinha( 001, 004, 'C' ) = 'ITEC' then
           LeiaIteC
        else if LerLinha( 001, 004, 'C' ) = 'ITED' then
           LeiaIteD
        else if LerLinha( 001, 002, 'C' ) = 'DP' then
           LeiaDPnn
        else if LerLinha( 001, 004, 'C' ) = 'ITDI' then
           LeiaITDI;

        Application.ProcessMessages;

        readln( f, reg );

        progress_file_.StepIt;
      end;

      datm_main.db_broker.Commit;

      BoxMensagem( 'Integração realizada com sucesso!', 3 );

    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  // Leitura PO SAP ==> DDBroker (myIndaiá)
  if tp_leitura = 2 then
  begin
    AssignFile( ArqSAP, edt_nm_file_.Text );
    Reset( ArqSAP );
    nr_itens := 0;
    try
      datm_main.db_broker.StartTransaction;

      while Not EOF( ArqSAP ) do
      begin
        ReadLn( ArqSAP, Stri );
        if Copy( Stri, 1, 4 ) = 'CAPI' then  // Capa
        begin
          //datm_po_leitura.qry_apaga_itens_.ParamByName('NR_PROCESSO').AsString := Copy( Stri, 5, 10 );
          //datm_po_leitura.qry_apaga_itens_.ExecSQL;
          vProcesso := Copy( Stri, 5, 10 );
          ProcessaCapa;
        end else if ( Copy( Stri, 1, 4 ) <> 'ITDI' ) and ( Stri <> '' ) then // Item
        begin
          ProcessaItem;
        end;
        Application.ProcessMessages;
      end;

      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQl.Clear;
        SQL.Add('SELECT MAX(NR_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = ''' + vProcesso + '''');
        Open;
        vMaxItem := Fields[0].AsString;
        Close;
        SQl.Clear;
        SQL.Add('UPDATE TPO SET QT_TOTAL_ITENS = ''' + vMaxItem + ''' WHERE NR_PROCESSO = ''' + vProcesso + '''');
        ExecSQL;
        Free;
      end;

      // Enviar emails
      mens_ato := '';
      with datm_po_leitura do
      begin
        qry_po_int_.Close;
        qry_po_int_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
        qry_po_int_.Prepare;
        qry_po_int_.Open;
        while Not qry_po_int_.EOF do
        begin
          CloseStoredProc( sp_aviso_drawback );
          sp_aviso_drawback.ParamByName( '@nr_processo' ).AsString := qry_po_int_.FieldByName('NR_PROCESSO').AsString;
          ExecStoredProc( sp_aviso_drawback );
          CloseStoredProc( sp_aviso_drawback );

          mens_ato := '';
          qry_merc_com_ato_.Close;
          qry_merc_com_ato_.ParamByName('NR_PROCESSO').AsString    := qry_po_int_.FieldByName('NR_PROCESSO').AsString;
          qry_merc_com_ato_.Prepare;
          qry_merc_com_ato_.Open;
          while Not qry_merc_com_ato_.EOF do
          begin
            if Trim( mens_ato ) = '' then
              mens_ato := 'Existem mercadorias que incidem Ato Drawback!' + #13#10 +
                          'Favor verificá-las no SAP:' + #13#10;
            mens_ato := mens_ato +
                        qry_merc_com_ato_.FieldByName('NR_PROCESSO').AsString + '/' +
                        IntToStr( StrToInt( qry_merc_com_ato_.FieldByName('NR_ITEM').AsString ) ) + ' - ' +
                        qry_merc_com_ato_.FieldByName('CD_MERCADORIA').AsString + ' - ' +
                        qry_merc_com_ato_.FieldByName('AP_MERCADORIA').AsString + #13#10;
            qry_merc_com_ato_.Next;
          end;
          if Trim( mens_ato ) <> '' then
          begin
            BoxMensagem( mens_ato, 3 );
          end;

          qry_po_int_.Next;
        end;
        qry_po_int_.Close;
      end;

      // Limpar usuário
      with datm_po_leitura do
      begin
        qry_atz_po_item_.Close;
        qry_atz_po_item_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
        qry_atz_po_item_.Prepare;
        qry_atz_po_item_.ExecSQL;

        qry_atz_po_.Close;
        qry_atz_po_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
        qry_atz_po_.Prepare;
        qry_atz_po_.ExecSQL;
      end;
      datm_main.db_broker.Commit;

      BoxMensagem( 'Integração realizada com sucesso!', 3 );
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        BoxMensagem( 'Erro na leitura de arquivos!', 2 );
      end;
    end;
  end;

  Arquivo.Close;
  Arquivo.Free;

  progress_file_.Position := 0;
end;

procedure Tfrm_po_leitura.speed_sair_Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_po_leitura.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_Po_Leitura, datm_Po_Leitura );
end;

function Tfrm_po_leitura.LerLinha( nInicio : Integer; nTamanho : Integer; cTipo : String ) : String;
var
   cTexto : String;
   i : Integer;
begin
   cTexto := '';
   nInicio := nInicio - 1;

   for i := nInicio to nTamanho+nInicio-1 do
   begin
     cTexto := cTexto + Arquivo.Buffer[i];
   end;

   if cTipo = 'D' then
   begin
     if alltrim(cTexto) <> '' then
     begin
       cTexto := FormatDateTime('YYYYMMDD',Strtodate(cTexto));
     end;
   end
   else if cTipo = 'N' then
   begin
     if alltrim(cTexto) <> '' then
     begin
       for i := 0 to length(cTexto ) do
       begin
         if ( cTexto[i] = ',' ) then
         begin
           cTexto[i] := ' ';
         end
         else
         begin
           cTexto[i] := cTexto[i];
         end;
       end;
       cTexto := alltrim(cTexto);
     end;
   end
   else if cTipo = 'V' then
   begin
     if alltrim(cTexto) <> '' then
     begin
       for i := 0 to length(cTexto ) do
       begin
         if ( cTexto[i] = '.' ) then
         begin
           cTexto[i] := ',' ;
         end
         else if (cTexto[i] = ',') then
         begin
           cTexto[i] := '.';
         end
         else
         if (cTexto[i] = 'R') or (cTexto[i] = '$') then
         begin
           cTexto[i] := ' ' ;
         end
         else
         begin
           cTexto[i] := cTexto[i];
         end;
       end;
       cTexto := alltrim(cTexto);
     end;
   end;
   if cTipo = 'V' then
   begin
     if Trim( cTexto ) = '' then
       cTexto := '0';
   end;
   LerLinha := cTexto ;
end;

procedure Tfrm_po_leitura.mi_sair_Click(Sender: TObject);
begin
  speed_sair_Click(nil);
end;

procedure Tfrm_po_leitura.LeiaCapI;
begin
  with datm_po_leitura do
  begin
    qry_verif_po_.Close;
    qry_verif_po_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_verif_po_.Prepare;
    qry_verif_po_.Open;

    qry_po_.Close;
    qry_po_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_po_.Prepare;
    qry_po_.Open;

    if qry_verif_po_TOTAL.AsInteger = 0 then
       qry_po_.Append
    else
       qry_po_.Edit;

    qry_po_NR_PROCESSO.AsString                 := LerLinha( 005, 015, 'C' );
    //qry_po_NR_IDENT_USUARIO.AsString            := LerLinha( 005, 15, 'C' );
    if Trim( LerLinha( 040, 006, 'C' ) ) <> '' then
       qry_po_DT_ABERTURA.AsDateTime            := StrToDate( LerLinha( 040, 002, 'C' ) + '/'+ LerLinha( 042, 002, 'C' ) + '/20' + LerLinha( 044, 002, 'C' ) );

    qry_po_CD_TP_DECLARACAO.AsString            := LerLinha( 046, 002, 'C' );

    qry_po_IN_INDICADOR_CONSIG_IMPORT.AsBoolean := StrToBoolean( LerLinha( 048, 001, 'C' ) );

    if cd_import = '' then
    begin
      qry_de_para_.Close;
      qry_de_para_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
      qry_de_para_.ParamByName('CD_TABELA').AsString   := '01';
      qry_de_para_.ParamByName('CD_EXTERNO').AsString := LerLinha( 049, 004, 'C' );
      qry_de_para_.Prepare;
      qry_de_para_.Open;
      if not qry_de_para_.EOF then
         qry_po_CD_IMPORTADOR.AsString            := qry_de_para_CD_DDBROKER.AsString;
    end
    else
      qry_po_CD_IMPORTADOR.AsString := cd_import;

    qry_po_CD_CONSIGNATARIO.AsString            := LerLinha( 053, 004, 'C' );
    qry_po_IN_FUNDAP.AsBoolean                  := StrToBoolean( LerLinha( 057, 001, 'C' ) );
    qry_po_IN_IND_CAMBIO_ITENS.AsBoolean        := StrToBoolean( LerLinha( 058, 001, 'C' ) );

    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString   := '05';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString  := LerLinha( 059, 004, 'C' );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
       qry_po_CD_EXPORTADOR.AsString            := qry_de_para_CD_DDBROKER.AsString;

    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString   := '05';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString := LerLinha( 063, 004, 'C' );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
       qry_po_CD_FABRICANTE.AsString            := qry_de_para_CD_DDBROKER.AsString;

    qry_po_CD_PAIS_ORIGEM.AsString              := LerLinha( 067, 003, 'C' );
    qry_po_CD_URF_DESPACHO.AsString             := LerLinha( 070, 007, 'C' );
    qry_po_CD_PAIS_AQUISICAO.AsString           := LerLinha( 077, 003, 'C' );
    qry_po_IN_INDICADOR_PROC.AsString           := StrToStr( LerLinha( 080, 001, 'C' ) );
    qry_po_IN_VINC_IMPO_EXPO.AsString           := LerLinha( 081, 001, 'C' );
    qry_po_CD_MET_VALORACAO_ADUAN.AsString      := LerLinha( 082, 002, 'C' );
    qry_po_IN_IND_COND_MERC.AsBoolean           := StrToBoolean( LerLinha( 084, 001, 'C' ) );
    qry_po_IN_FABR_EXPOR_IMP.AsString           := LerLinha( 085, 001, 'C' );
    qry_po_TP_MOD_DESPACHO.AsString             := LerLinha( 086, 001, 'C' );
    qry_po_IN_COND_MERCADORIA.AsString          := StrToStr( LerLinha( 087, 001, 'C' ) );
    qry_po_IN_APLICACAO_MERC.AsString           := LerLinha( 088, 001, 'C' );
    qry_po_CD_VIA_TRANSP.AsString               := LerLinha( 089, 002, 'C' );
    qry_po_IN_INDIC_MULTMODAL.AsBoolean         := StrToBoolean( LerLinha( 091, 001, 'C' ) );

    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString   := '06';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString  := LerLinha( 092, 004, 'C' );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
       qry_po_CD_TRANSP_INTERN.AsString         := qry_de_para_CD_DDBROKER.AsString;

    qry_po_NR_PLACA_VEICULO.AsString            := LerLinha( 096, 015, 'C' );
    qry_po_NM_VEICULO.AsString                  := LerLinha( 111, 030, 'C' );
    qry_po_CD_BANDEIRA_VEIC.AsString            := LerLinha( 141, 003, 'C' );
    qry_po_TP_MANIFESTO.AsString                := LerLinha( 144, 001, 'C' );
    qry_po_NR_MANIFESTO.AsString                := LerLinha( 145, 015, 'C' );
    qry_po_TP_DOC_CARGA.AsString                := LerLinha( 160, 002, 'C' );
    qry_po_NR_DOC_MASTER.AsString               := LerLinha( 162, 011, 'C' );
    qry_po_NR_DOC_HOUSE.AsString                := LerLinha( 173, 011, 'C' );

    if ( Trim( LerLinha( 184, 006, 'C' ) ) <> '' ) and ( LerLinha( 184, 002, 'C' ) <> '00' )  and ( LerLinha( 184, 002, 'C' ) <> '  ' ) then
       qry_po_DT_EMISSAO_DOC_CARGA.AsDateTime   := StrToDate( LerLinha( 184, 002, 'C' ) + '/'+ LerLinha( 186, 002, 'C' ) + '/20' + LerLinha( 188, 002, 'C' ) );

    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString   := '07';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString  := Trim( LerLinha( 190, 004, 'C' ) );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
      qry_po_CD_LOCAL_EMBARQUE.AsString              := qry_de_para_CD_DDBROKER.AsString;

    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString   := '08';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString  := Trim( LerLinha( 194, 004, 'C' ) );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
      qry_po_CD_LOCAL_DESEMBARQUE.AsString           := qry_de_para_CD_DDBROKER.AsString;

    qry_po_IN_UTILIZ_CARGA.AsString                  := LerLinha( 200, 001, 'C' );

    if ( Trim( LerLinha( 201, 006, 'C' ) ) <> '' ) and ( LerLinha( 201, 002, 'C' ) <> '00' ) and ( LerLinha( 201, 002, 'C' ) <> '  ' )  then
       qry_po_DT_CHEGADA_CARGA.AsDateTime := StrToDate( LerLinha( 201, 002, 'C' ) + '/'+ LerLinha( 203, 002, 'C' ) + '/20' + LerLinha( 205, 002, 'C' ) );

    qry_po_PL_PO.AsFloat                  := StrToFloat( LerLinha( 207, 015, 'V' ) ); // 4
    qry_po_PB_PO.AsFloat                  := StrToFloat( LerLinha( 222, 015, 'V' ) ); // 4
    qry_po_CD_PAIS_PROCEDENCIA.AsString   := LerLinha( 237, 003, 'C' );

    qry_po_.Post;
  end;
end;

procedure Tfrm_po_leitura.LeiaCap2;
begin
  with datm_po_leitura do
  begin
    qry_verif_po_.Close;
    qry_verif_po_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_verif_po_.Prepare;
    qry_verif_po_.Open;

    if qry_verif_po_TOTAL.AsInteger = 0 then
       Exit;

    qry_po_.Close;
    qry_po_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_po_.Prepare;
    qry_po_.Open;
    qry_po_.Edit;

    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString   := '04';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString := LerLinha( 020, 004, 'C' );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
       qry_po_CD_AGENTE_CARGA.AsString          := qry_de_para_CD_DDBROKER.AsString;

    qry_po_CD_URF_ENTRADA.AsString              := LerLinha( 024, 007, 'C' );
    qry_po_CD_RECINTO_ALFAND.AsString           := LerLinha( 031, 007, 'C' );
    qry_po_QT_TOTAL_ITENS.AsString              := LerLinha( 038, 003, 'C' );
    qry_po_QT_PORC_ICMS.AsFloat                 := StrToFloat( LerLinha( 041, 007, 'V' ) ); // 4
    qry_po_QT_PORC_RED_ICMS.AsFloat             := StrToFloat( LerLinha( 048, 007, 'V' ) ); // 4
    qry_po_CD_MOEDA_NEG.AsString                := LerLinha( 055, 003, 'C' );
    qry_po_VL_TOTAL.AsFloat                     := StrToFloat( LerLinha( 058, 015, 'V' ) ); // 2
    qry_po_CD_MOEDA_FRETE.AsString              := LerLinha( 073, 003, 'C' );
    qry_po_VL_FRETE_PREPAID.AsFloat             := StrToFloat( LerLinha( 076, 015, 'V' ) ); // 2
    qry_po_VL_FRETE_COLLECT.AsFloat             := StrToFloat( LerLinha( 091, 015, 'V' ) ); // 2
    qry_po_VL_FRETE_TERRIT_NAC.AsFloat          := StrToFloat( LerLinha( 106, 015, 'V' ) ); // 2
    qry_po_CD_MOEDA_SEGURO.AsString             := LerLinha( 121, 003, 'C' );
    qry_po_TP_SEGURO.AsString                   := LerLinha( 124, 001, 'C' );
    qry_po_PC_SEGURO.AsFloat                    := StrToFloat( LerLinha( 125, 007, 'V' ) ); // 4
    qry_po_VL_SEGURO.AsFloat                    := StrToFloat( LerLinha( 132, 015, 'V' ) ); // 2
    qry_po_CD_MOEDA_CARGA.AsString              := LerLinha( 147, 003, 'C' );
    if Trim( LerLinha( 150, 015, 'V' ) ) <> '' then
       qry_po_VL_CARGA.AsFloat                  := StrToFloat( LerLinha( 150, 015, 'V' ) ); // 2
    qry_po_CD_INCOTERM.AsString                 := LerLinha( 165, 003, 'C' );
    qry_po_CD_LOCAL_INCOTERM.AsString           := LerLinha( 168, 010, 'C' );
    qry_po_TP_COBERT_CAMBIO.AsString            := LerLinha( 178, 001, 'C' );
    qry_po_CD_REPRESENTANTE.AsString            := LerLinha( 179, 004, 'C' );
    qry_po_PC_COMISSAO.AsFloat                  := StrToFloat( LerLinha( 183, 006, 'V' ) ); // 3
    qry_po_CD_MOD_PAGAMENTO.AsString            := LerLinha( 189, 002, 'C');
    qry_po_IN_INDIC_TX_JUROS.AsBoolean          := StrToBoolean( LerLinha( 191, 001, 'C' ) ); // T/F
    qry_po_CD_TX_JUROS.AsString                 := LerLinha( 192, 004,'C');
    qry_po_TX_JUROS.AsFloat                     := StrToFloat( LerLinha( 196, 015, 'V' ) ); // 6
    qry_po_NR_PARCELAS.AsString                 := LerLinha( 211, 003,'C' );
    qry_po_QT_PERIODICIDADE.AsString            := LerLinha( 214, 003,'C' );
    qry_po_VL_PERIODIC_MENSAL.AsFloat           := StrToFloat( LerLinha( 217, 015, 'V' ) ); // 2
    qry_po_CD_INSTIT_FINANC.AsString            := LerLinha( 232, 002, 'C' );

    qry_po_.Post;
  end;
end;

procedure Tfrm_po_leitura.LeiaCap3;
begin
  with datm_po_leitura do
  begin
    qry_verif_po_.Close;
    qry_verif_po_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_verif_po_.Prepare;
    qry_verif_po_.Open;

    If qry_verif_po_TOTAL.AsInteger = 0 then
       exit;

    qry_po_.Close;
    qry_po_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_po_.Prepare;
    qry_po_.Open;
    qry_po_.Edit;

    qry_po_VL_CAMBIO.AsFloat                    := StrToFloat( LerLinha( 020, 020, 'V' ) ); // 2
    qry_po_NR_BACEN.AsString                    := LerLinha( 040, 008, 'C' );
    qry_po_CD_MOTIVO_CAMBIO_SEM_COBERT.AsString := LerLinha( 048, 002, 'C' );
    qry_po_VL_PAGTO_ANTECIPADO.AsFloat          := StrToFloat( LerLinha( 050, 015, 'V' ) ); // 2
    qry_po_VL_PAGTO_VISTA.AsFloat               := StrToFloat( LerLinha( 065, 015, 'V' ) ); // 2
    qry_po_IN_PERIODICIDADE.AsString            := LerLinha( 080, 001, 'C' );
    qry_po_NM_IDENT_CRT.AsString                := LerLinha( 081, 011, 'C' );
    qry_po_CD_BARRA.AsString                    := LerLinha( 092, 011, 'C' );
    qry_po_CD_SETOR_ARMAZENAGEM.AsString        := LerLinha( 103, 003, 'C' );

    qry_po_.Post;
  end;
end;

procedure Tfrm_po_leitura.LeiaIteA;
begin
  // cItem := Copy( LerLinha( 237, 004, 'C' ), 2, 3 );
  cItem := StrZero( ( StrToInt( cItem ) + 1 ), 3 );

  with datm_po_leitura do
  begin
    qry_verif_po_itens_.Close;
    qry_verif_po_itens_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_verif_po_itens_.ParamByName('NR_ITEM').AsString     := cItem;
    qry_verif_po_itens_.Prepare;
    qry_verif_po_itens_.Open;

    qry_po_itens_.Close;
    qry_po_itens_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_po_itens_.ParamByName('NR_ITEM').AsString := cItem;
    qry_po_itens_.Prepare;
    qry_po_itens_.Open;

    if qry_verif_po_itens_TOTAL.AsInteger > 0 then
       qry_po_itens_.Edit
    else
       qry_po_itens_.Append;

    qry_po_itens_NR_PROCESSO.AsString      := LerLinha( 005, 015, 'C' );
    qry_po_itens_CD_MERCADORIA.AsString    := LerLinha( 020, 015, 'C' ); // ATENCAO
    qry_po_itens_QT_INICIAL.AsFloat        := StrToFloat( LerLinha( 040, 015, 'V' ) ); // 5

    // Unidade de Medida
    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString    := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString      := '09';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString     := LerLinha( 055, 002, 'C' );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
       qry_po_itens_CD_UNID_MEDIDA.AsString             := qry_de_para_CD_DDBROKER.AsString;
    // qry_po_itens_CD_UNID_MEDIDA.AsString   := '0' + LerLinha( 055, 002, 'C' );
    qry_po_itens_PL_ITEM.AsFloat           := StrToFloat( LerLinha( 057, 012, 'V' ) ); // 6
    qry_po_itens_VL_UNITARIO.AsFloat       := StrToFloat( LerLinha( 069, 012, 'V' ) ); // 6
    if Trim(LerLinha( 081, 001, 'C' )) = '' then
      qry_po_itens_TP_CALCULO.AsString     := '1'
    else
      qry_po_itens_TP_CALCULO.AsString     := LerLinha( 081, 001, 'C' );
    qry_po_itens_PC_DESCONTO.AsFloat       := StrToFloat( LerLinha( 082, 005, 'V' ) ); // 2
    qry_po_itens_VL_DESCONTO.AsFloat       := StrToFloat( LerLinha( 087, 010, 'V' ) ); // 2
    if LerLinha( 097, 001, 'C' ) = 'N' then
       qry_po_itens_IN_NECESSITA_LI.AsBoolean := False
    else
       qry_po_itens_IN_NECESSITA_LI.AsBoolean := True;
    qry_po_itens_IN_FABR_EXP_PROD.AsString := LerLinha( 099, 001, 'C' );
    qry_po_itens_VL_TOTAL.AsFloat          := qry_po_itens_VL_UNITARIO.AsFloat * qry_po_itens_QT_INICIAL.AsFloat;

    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString    := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString      := '05';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString     := LerLinha( 100, 004, 'C' );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
       qry_po_itens_CD_EXPORTADOR.AsString              := qry_de_para_CD_DDBROKER.AsString;

    qry_de_para_.Close;
    qry_de_para_.ParamByName('CD_UNID_NEG').AsString    := str_cd_unid_neg;
    qry_de_para_.ParamByName('CD_TABELA').AsString      := '05';
    qry_de_para_.ParamByName('CD_EXTERNO').AsString     := LerLinha( 104, 004, 'C' );
    qry_de_para_.Prepare;
    qry_de_para_.Open;
    if Not qry_de_para_.EOF then
       qry_po_itens_CD_FABRICANTE.AsString              := qry_de_para_CD_DDBROKER.AsString;

    qry_po_itens_CD_PAIS_ORIGEM.AsString                := LerLinha( 108, 003, 'C' );
    qry_po_itens_CD_PAIS_AQUISICAO.AsString             := LerLinha( 111, 003, 'C' );
    qry_po_itens_CD_NCM_SH.AsString                     := LerLinha( 114, 010, 'C' );
    qry_po_itens_NR_EX_NCM.AsString                     := LerLinha( 124, 003, 'C' );
    qry_po_itens_NR_AL_EX_NCM.AsString                  := LerLinha( 127, 009, 'C' );
    qry_po_itens_NM_ORGAO_EMISSOR_AL_NCM.AsString       := LerLinha( 136, 009, 'C' );
    qry_po_itens_NR_ANO_EX_NCM.AsString                 := LerLinha( 145, 004, 'C' );
    qry_po_itens_NR_NUM_EX_NCM.AsString                 := LerLinha( 149, 004, 'C' );
    qry_po_itens_CD_NALADI_SH.AsString                  := LerLinha( 196, 010, 'C' );
    qry_po_itens_NR_EX_NALADI.AsString                  := LerLinha( 206, 003, 'C' );
    qry_po_itens_NM_AL_EX_NALADI.AsString               := LerLinha( 209, 009, 'C' );
    qry_po_itens_NM_ORGAO_EMISSOR_AL_EX_NALADI.AsString := LerLinha( 218, 009, 'C' );
    qry_po_itens_NR_ANO_EMISSAO_AL_EX_NALADI.AsString   := LerLinha( 227, 004, 'C' );
    qry_po_itens_NR_AL_EX_NALADI.AsString               := LerLinha( 231, 006, 'C' );
    qry_po_itens_NR_ITEM.AsString                       := cItem;        // ATENCAO
    qry_po_itens_NR_ITEM_CLIENTE.AsString               := LerLinha( 237, 004, 'C' );


    if ( ( Trim( qry_po_itens_CD_FABRICANTE.AsString ) = '' ) and
         ( Trim( qry_po_itens_CD_PAIS_ORIGEM.AsString ) = '' ) ) or
       ( ( Trim( qry_po_itens_CD_EXPORTADOR.AsString ) = Trim( qry_po_itens_CD_FABRICANTE.AsString ) ) and
         ( Trim( qry_po_itens_CD_PAIS_AQUISICAO.AsString ) = Trim( qry_po_itens_CD_PAIS_ORIGEM.AsString ) ) ) then
    begin
      qry_po_itens_IN_FABR_EXP_PROD.AsString := '1';
    end
    else
    if ( Trim( qry_po_itens_CD_EXPORTADOR.AsString ) <> Trim( qry_po_itens_CD_FABRICANTE.AsString ) ) and
       ( Trim( qry_po_itens_CD_FABRICANTE.AsString ) <> '' ) then
    begin
      qry_po_itens_IN_FABR_EXP_PROD.AsString := '2';
    end
    else
    begin
      qry_po_itens_IN_FABR_EXP_PROD.AsString := '3';
    end;

    qry_po_itens_.Post;
  end;
end;


procedure Tfrm_po_leitura.LeiaIteB;
var
  modalidade, tp_modalidade : String;
begin

  with datm_po_leitura do
  begin
    qry_po_itens_.Close;
    qry_po_itens_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_po_itens_.ParamByName('NR_ITEM').AsString := cItem;
    qry_po_itens_.Prepare;
    qry_po_itens_.Open;

    if qry_po_itens_.EOF then
       Exit;

    qry_po_itens_.Edit;

    qry_po_itens_CD_NALADI_NCCA.AsString                := LerLinha( 020, 010, 'C' );
    qry_po_itens_NR_EX_NALADI_NCCA.AsString             := LerLinha( 030, 003, 'C' );
    qry_po_itens_NM_AL_EX_NALADI_NCCA.AsString          := LerLinha( 033, 009, 'C' );
    qry_po_itens_NM_ORG_EMISSOR_EX_NALADI_NCCA.AsString := LerLinha( 042, 009, 'C' );
    qry_po_itens_NR_ANO_EMISSAO_EX_NALADI_NCCA.AsString := LerLinha( 051, 004, 'C' );
    qry_po_itens_NR_AL_EX_NALADI_NCCA.AsString          := LerLinha( 055, 006, 'C' );
    qry_po_itens_CD_MET_VALOR_ADUANEIRA.AsString        := LerLinha( 061, 002, 'C' );
    qry_po_itens_CD_DISP_LEGAL_EXONERA.AsString         := LerLinha( 063, 004, 'C' );
    qry_po_itens_IN_IND_COND_MERC.AsBoolean             := StrToBoolean( LerLinha( 067, 001, 'C' ) ); // T/F
    qry_po_itens_IN_COND_MERC.AsString                  := LerLinha( 068, 001, 'C' );
    qry_po_itens_IN_APLIC_MERC.AsString                 := LerLinha( 069, 001, 'C' );
    if Trim(LerLinha(070,006,'V')) <> '' then
       qry_po_itens_PC_ICMS.AsFloat                     := StrToFloat( LerLinha( 070, 006, 'V' ) ); // 2
    if Trim(LerLinha(076,006,'V')) <> '' then
       qry_po_itens_PC_ICMS_REDUCAO.AsFloat             := StrToFloat( LerLinha( 076, 006, 'V' ) ); // 2
    qry_po_itens_CD_MOEDA_NEGOCIADA.AsString            := LerLinha( 082, 003, 'C' );
    qry_po_itens_CD_INCOTERM.AsString                   := LerLinha( 085, 003, 'C' );
    qry_po_itens_NM_LOCAL_INCOTERM.AsString             := LerLinha( 088, 010, 'C' );
    qry_po_itens_CD_REG_TRIB_II.AsString                := LerLinha( 098, 001, 'C' );
    qry_po_itens_CD_FUND_LEGAL_II.AsString              := LerLinha( 099, 002, 'C' );
    qry_po_itens_TP_ACORDO_TARIFARIO.AsString           := LerLinha( 101, 001, 'C' );
    qry_po_itens_CD_ACORDO_ALADI.AsString               := LerLinha( 102, 003, 'C' );
    qry_po_itens_NM_AL_II.AsString                      := LerLinha( 105, 009, 'C' );
    qry_po_itens_NM_ORGAO_EMISSOR_II.AsString           := LerLinha( 114, 009, 'C' );
    qry_po_itens_NR_ANO_II.AsString                     := LerLinha( 123, 004, 'C' );
    qry_po_itens_NR_AL_II.AsString                      := LerLinha( 127, 006, 'C' );
    if Trim(LerLinha(133,007,'V')) <> '' then
       qry_po_itens_NR_ALIQ_NORMAL_II.AsFloat           := StrToFloat( LerLinha( 133, 007, 'V' ) ); // 3
    if Trim(LerLinha(140,007,'V')) <> '' then
       qry_po_itens_NR_ALIQ_ACORDO_II.AsFloat           := StrToFloat( LerLinha( 140, 007, 'V' ) ); // 3
    if Trim(LerLinha(147,007,'V')) <> '' then
       qry_po_itens_NR_ALIQ_REDUZIDA_II.AsFloat         := StrToFloat( LerLinha( 147, 007, 'V' ) ); // 3
    if Trim(LerLinha(154,007,'V')) <> '' then
       qry_po_itens_NR_ALIQ_PERC_RED_II.AsFloat         := StrToFloat( LerLinha( 154, 007, 'V' ) ); // 3
    qry_po_itens_NR_ITEM.AsString                       := cItem;
    qry_po_itens_IN_REG_TRIB_IPI.AsString               := LerLinha( 178, 001, 'C' );
    qry_po_itens_NM_AL_IPI.AsString                     := LerLinha( 179, 009, 'C' );
    qry_po_itens_NM_ORGAO_EMISSOR_IPI.AsString          := LerLinha( 188, 009, 'C' );
    qry_po_itens_NR_ANO_IPI.AsString                    := LerLinha( 197, 004, 'C' );
    qry_po_itens_NR_AL_IPI.AsString                     := LerLinha( 201, 006, 'C' );
    qry_po_itens_NR_NOTA_COMPL_IPI.AsString             := LerLinha( 207, 002, 'C' );
    qry_po_itens_NR_ALIQ_NORMAL_IPI.AsString            := LerLinha( 209, 007, 'C' ); // 3
    qry_po_itens_NR_ALIQ_REDUZIDA_IPI.AsString          := LerLinha( 216, 007, 'C' ); // 3
    qry_po_itens_NR_ALIQ_PERC_RED_IPI.AsString          := LerLinha( 223, 007, 'C' ); // 3
    qry_po_itens_NR_PROC_LI.AsString                    := LerLinha( 230, 010, 'C' );

    modalidade := LerLinha( 240, 001, 'C' );
    if Trim( modalidade ) = '' then
       modalidade := '0' ;

    tp_modalidade := '0';
    case StrToInt(modalidade) of
      0 : tp_modalidade := '0';
      1 : tp_modalidade := '3';
      7 : tp_modalidade := '2';
      4 : tp_modalidade := '1';
    end;
    qry_po_itens_CD_MODALIDADE.AsString                 := tp_modalidade;

    qry_po_itens_.Post;
  end;
end;


procedure Tfrm_po_leitura.LeiaIteC;
begin
  with datm_po_leitura do
  begin
    qry_po_itens_.Close;
    qry_po_itens_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_po_itens_.ParamByName('NR_ITEM').AsString := cItem;
    qry_po_itens_.Prepare;
    qry_po_itens_.Open;

    if qry_po_itens_.EOF then
       Exit;

    qry_po_itens_.Edit;

    if Trim( LerLinha( 020, 012, 'V' ) ) <> '' then
       qry_po_itens_VL_ESPEC_IPI.AsFloat                := StrToFloat( LerLinha( 020, 012, 'V' ) ); // 2
    qry_po_itens_CD_UNID_MED_IPI.AsString               := LerLinha( 032, 002, 'C' );
    if Trim( LerLinha( 034, 003, 'V' ) ) <> '' then
       qry_po_itens_QT_ESPEC_IPI.AsFloat                := StrToFloat( LerLinha( 034, 003, 'V' ) );
    qry_po_itens_NR_EX_AD.AsString                      := LerLinha( 037, 003, 'C' );
    qry_po_itens_NM_TIPO_AL_AD.AsString                 := LerLinha( 040, 010, 'C' );
    qry_po_itens_NM_ORGAO_EMISSOR_AD.AsString           := LerLinha( 050, 010, 'C' );
    qry_po_itens_NR_ANO_AD.AsString                     := LerLinha( 060, 004, 'C' );
    qry_po_itens_NR_AL_AD.AsString                      := LerLinha( 064, 006, 'C' );
    qry_po_itens_NR_ALIQ_AD.AsString                    := LerLinha( 070, 007, 'C' );
    if Trim( LerLinha(077,015,'V') ) <> '' then
       qry_po_itens_NR_BASE_CALC_AD.AsFloat             := StrToFloat( LerLinha( 077, 015, 'V' ) ); // 3
    if Trim( LerLinha(092,015,'V') ) <> '' then
       qry_po_itens_VL_ESPEC_AD.AsFloat                 := StrToFloat( LerLinha( 092, 015, 'V' ) ); // 3
    qry_po_itens_CD_UNID_MED_AD.AsString                := LerLinha( 107, 002, 'C' );
    if Trim( LerLinha( 109, 003, 'V' ) ) <> '' then
       qry_po_itens_QT_AD.AsFloat                       := StrToFloat( LerLinha( 109, 003, 'V' ) );
    qry_po_itens_TP_CAMBIO.AsString                     := LerLinha( 112, 001, 'C' );
    qry_po_itens_CD_AGENTE_CAMBIO.AsString              := LerLinha( 113, 004, 'C' );
    if Trim( LerLinha( 117, 006, 'V' ) ) <> '' then
       qry_po_itens_VL_COMISSAO.AsFloat                 := StrToFloat( LerLinha( 117, 006, 'V' ) ); // 3
    qry_po_itens_CD_MOD_PAGTO.AsString                  := LerLinha( 123, 002, 'C' );
        qry_po_itens_TP_IND_TX_JUROS.AsBoolean          := StrToBoolean( LerLinha( 125, 001, 'C' ) ); // T/F
    qry_po_itens_CD_TX_JUROS.AsString                   := LerLinha( 126, 004, 'C' );
    if Trim( LerLinha( 130, 010, 'V' ) ) <> '' then
       qry_po_itens_TX_JUROS_CAMBIO.AsFloat             := StrToFloat( LerLinha( 130, 010, 'V' ) ); // 6
    qry_po_itens_NR_PARCELAS.AsString                   := LerLinha( 140, 003, 'C' );
    qry_po_itens_NR_PERIODICIDADE.AsString              := LerLinha( 143, 003, 'C' );
    if Trim( LerLinha(146,012,'V') ) <> '' then
       qry_po_itens_VL_TOTAL_PARCELAS.AsFloat           := StrToFloat( LerLinha( 146, 012, 'V' ) ); // 2
    qry_po_itens_TP_IND_PERIODICIDADE.AsString          := LerLinha( 158, 001, 'C' );
    qry_po_itens_CD_INSTITUICAO_FINANC.AsString         := LerLinha( 159, 002, 'C' );
    if Trim( LerLinha( 161, 012, 'V' ) ) <> '' then
       qry_po_itens_VL_COBERT_ACIMA_360.AsFloat         := StrToFloat( LerLinha( 161, 012, 'V' ) ); // 2
    qry_po_itens_NR_ROF_BACEN.AsString                  := LerLinha( 173, 008, 'C' );
    qry_po_itens_CD_MOT_SEM_COBERT_CAMBIAL.AsString     := LerLinha( 181, 002, 'C' );
    if Trim( LerLinha( 183, 012, 'V' ) ) <> '' then
       qry_po_itens_VL_PAGTO_ANTECIPADO.AsFloat         := StrToFloat( LerLinha( 183, 012, 'V' ) ); // 2
    if Trim( LerLinha( 195, 012, 'V' ) ) <> '' then
       qry_po_itens_VL_PAGTO_AVISTA.AsFloat             := StrToFloat( LerLinha( 195, 012, 'V' ) ); // 2
    qry_po_itens_IN_IND_PERIODICIDADE.AsString          := LerLinha( 207, 001, 'C' );
    qry_po_itens_CD_EX_II.AsString                      := LerLinha( 208, 003, 'C' );
    qry_po_itens_CD_EX_IPI.AsString                     := LerLinha( 211, 003, 'C' );
    qry_po_itens_TP_RECIPIENTE.AsString                 := LerLinha( 214, 002, 'C' );
    qry_po_itens_NM_IDENTIFICACAO.AsString              := LerLinha( 216, 009, 'C' );
    qry_po_itens_CD_VIA_TRANSP.AsString                 := LerLinha( 225, 002, 'C' );
    qry_po_itens_CD_PAIS_PROCEDENCIA.AsString           := LerLinha( 227, 003, 'C' );
    qry_po_itens_CD_URF_ENTRADA.AsString                := LerLinha( 230, 007, 'C' );
    qry_po_itens_TP_IND_MULTIMODAL.AsBoolean            := StrToBoolean( LerLinha( 237, 001, 'C' ) ); // T/F

    qry_po_itens_.Post;
  end;
end;


procedure Tfrm_po_leitura.LeiaDPnn;
var
   ato_drawback : String;
begin
  with datm_po_leitura do
  begin
    qry_po_itens_.Close;
    qry_po_itens_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
    qry_po_itens_.ParamByName('NR_ITEM').AsString     := cItem;
    qry_po_itens_.Prepare;
    qry_po_itens_.Open;

    if qry_po_itens_.EOF then
       Exit;

    qry_po_itens_.Edit;

    ato_drawback                                 := Trim( LerLinha( 024, 16, 'C' ) );
    while Pos( '-', ato_drawback ) > 0 do
       ato_drawback[Pos('-', ato_drawback)] := ' ';
    while Pos( '/', ato_drawback ) > 0 do
       ato_drawback[Pos('/', ato_drawback)] := ' ';
    ato_drawback := Copy( AllTrim( ato_drawback ), 1, 13);
    qry_po_itens_NR_ATO_DRAWBACK.AsString        := ato_drawback;

    if ( Not qry_po_itens_CD_MERCADORIA.IsNull ) and
       ( Trim( qry_po_itens_CD_MERCADORIA.AsString ) <> '' ) then
    begin
      qry_mercadoria_.Close;
      qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := qry_po_itens_CD_MERCADORIA.AsString;
      qry_mercadoria_.Prepare;
      qry_mercadoria_.Open;
      if qry_mercadoria_.EOF then
      begin
        qry_po_itens_TX_MERCADORIA.AsString       := Trim( LerLinha( 040, 200, 'C' ) );

        (* Não incluir a mercadoria temporariamente ==> falar com Marcelo ==> futuro colocar parâmetro nio Cadastro do Cliente
        qry_mercadoria_.Append;
        qry_mercadoria_CD_MERCADORIA.AsString     := qry_po_itens_CD_MERCADORIA.AsString;
        qry_mercadoria_NM_MERCADORIA.AsString     := LerLinha( 040, 200, 'C' );
        qry_mercadoria_AP_MERCADORIA.AsString     := qry_po_itens_CD_MERCADORIA.AsString;
        qry_mercadoria_CD_IMPORTADOR.AsString     := qry_po_CD_IMPORTADOR.AsString;
        qry_mercadoria_CD_UN_MED_COMERC.AsString  := qry_po_itens_CD_UNID_MEDIDA.AsString;
        qry_mercadoria_PL_MERCADORIA.AsFloat      := qry_po_itens_PL_ITEM.AsFloat;
        qry_mercadoria_VL_UNITARIO.AsFloat        := qry_po_itens_VL_UNITARIO.AsFloat;
        qry_mercadoria_CD_TIPO_CALCULO.AsString   := qry_po_itens_TP_CALCULO.AsString;
        qry_mercadoria_CD_FABR_EXPO.AsString      := qry_po_itens_IN_FABR_EXP_PROD.AsString;
        qry_mercadoria_CD_EXPORTADOR.AsString     := qry_po_itens_CD_EXPORTADOR.AsString;
        qry_mercadoria_CD_FABRICANTE.AsString     := qry_po_itens_CD_FABRICANTE.AsString;
        qry_mercadoria_CD_PAIS_ORIGEM.AsString    := qry_po_itens_CD_PAIS_ORIGEM.AsString;
        qry_mercadoria_CD_PAIS_AQUISICAO.AsString := qry_po_itens_CD_PAIS_AQUISICAO.AsString;
        qry_mercadoria_CD_NCM_SH.AsString         := qry_po_itens_CD_NCM_SH.AsString;
        qry_mercadoria_CD_NALADI_SH.AsString      := qry_po_itens_CD_NALADI_SH.AsString;
        qry_mercadoria_CD_NALADI_NCCA.AsString    := qry_po_itens_CD_NALADI_NCCA.AsString;
        qry_mercadoria_.Post;
        *)
      end
      else
      begin
        // Não incluir a mercadoria temporariamente ==> falar com Marcelo ==> futuro colocar parâmetro nio Cadastro do Cliente
        //qry_mercadoria_.Edit;
        //if LerLinha( 003, 002, 'C' ) = '01' then
        //   qry_mercadoria_NM_MERCADORIA.AsString := LerLinha( 040, 200, 'C' )
        //else
        //   qry_mercadoria_NM_MERCADORIA.AsString := qry_mercadoria_NM_MERCADORIA.AsString + LerLinha( 040, 200, 'C' );
        qry_po_itens_TX_MERCADORIA.AsString := qry_mercadoria_NM_MERCADORIA.AsString;
        // qry_mercadoria_.Post;
      end;
    end
    else
      qry_po_itens_TX_MERCADORIA.AsString := TRIM( qry_po_itens_TX_MERCADORIA.AsString ) + Trim( LerLinha( 040, 200, 'C' ) );

    qry_po_itens_.Post;
  end;
end;

function Tfrm_po_leitura.StrToBoolean( cCaracter : String ) : Boolean;
var
  lVar : Boolean;
begin
  lVar := False;
  if cCaracter = 'T' then
     lVar := True;
  if cCaracter = 'F' then
     lVar := False;

  Result := lVar;
end;

function Tfrm_po_leitura.StrToStr( cCaracter : String ) : String;
var
  cNum : String[1];
begin
  cNum := '0';
  if cCaracter = 'T' then
     cNum := '1';
  if cCaracter = 'F' then
     cNum := '0';

  Result := cNum
end;

procedure Tfrm_po_leitura.edt_nm_file_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
     if Sender = edt_nm_file_ then Speed_file_Click(Nil);
end;

procedure Tfrm_po_leitura.mi_integrar_Click(Sender: TObject);
begin
  btn_integrarClick(Nil);
end;

procedure Tfrm_po_leitura.FormShow(Sender: TObject);
begin
  pnl_integra.Color := clMenuBroker;
  if tp_leitura = 1 then Caption := 'Leitura Padrão para o PO';
  if tp_leitura = 2 then Caption := 'Leitura PO - SAP ==> DDBroker';
end;


procedure Tfrm_po_leitura.ProcessaCapa;
var str_cd_via_transp : String[2];
    str_nm_via_transp : String;
begin
  with datm_po_leitura do
  begin
    qry_verif_po_.Close;
    qry_verif_po_.ParamByName('NR_PROCESSO').AsString := Copy( Stri, 5, 10 );
    qry_verif_po_.Prepare;
    qry_verif_po_.Open;

    qry_po_.Close;
    qry_po_.ParamByName('NR_PROCESSO').AsString := Copy( Stri, 5, 10 );
    qry_po_.Prepare;
    qry_po_.Open;

    if qry_verif_po_TOTAL.AsInteger = 0 then
    begin
      qry_po_.Append;
      nr_itens := 0;
    end
    else
    begin
      qry_po_.Edit;
      nr_itens := qry_po_QT_TOTAL_ITENS.AsInteger;
    end;

    // Nr Processo
    qry_po_NR_PROCESSO.AsString     := Copy( Stri, 5, 10 );
    // Dt Abertura
    qry_po_DT_ABERTURA.AsDateTime   := StrToDate( Copy( Stri, 15, 2 ) + '/' + Copy( Stri, 17, 2 ) + '/' + Copy( Stri, 19, 4 ) );

    // Importador
    qry_cliente_.Close;
    qry_cliente_.ParamByName('CGC_EMPRESA').AsString := Copy( Stri, 24, 14 );
    qry_cliente_.Prepare;
    qry_cliente_.Open;
    if Not qry_cliente_.EOF then
    begin
      qry_po_CD_IMPORTADOR.AsString := qry_cliente_CD_EMPRESA.AsString;
    end;

    // Exportador
    qry_emp_est_.Close;
    qry_emp_est_.ParamByName('NM_EMPRESA').AsString := Copy( Stri, 38, 40 );
    qry_emp_est_.Prepare;
    qry_emp_est_.Open;
    if Not qry_emp_est_.EOF then
    begin
      qry_po_CD_EXPORTADOR.AsString := qry_emp_est_CD_EMPRESA.AsString;
    end
    else
    begin
      qry_emp_est_.Append;
      qry_ult_emp_est_.Open;
      qry_emp_est_.FieldByName('CD_EMPRESA').AsString := UltCod( qry_ult_emp_est_, qry_ult_emp_est_ULTIMO );
      qry_emp_est_.FieldByName('NM_EMPRESA').AsString := Copy( Stri, 38, 40 );
      qry_emp_est_.Post;

      qry_po_CD_EXPORTADOR.AsString := qry_emp_est_CD_EMPRESA.AsString;
    end;

    // País de Aquisição
    qry_pais_.Close;
    qry_pais_.ParamByName('CD_PAIS_AQUISICAO').AsString := Copy( Stri, 78, 3 );
    qry_pais_.Prepare;
    qry_pais_.Open;
    if Not qry_pais_.EOF then
    begin
      qry_po_CD_PAIS_AQUISICAO.AsString := Copy( Stri, 78, 3 );
    end;

    // Via de Transporte
    str_cd_via_transp := '';
    str_nm_via_transp := Trim( Copy( Stri, 81, 1 ) );

    if      str_nm_via_transp = 'S' then str_cd_via_transp := '01'
    else if str_nm_via_transp = 'Z' then str_cd_via_transp := '04'
    else if str_nm_via_transp = 'F' then str_cd_via_transp := '04'
    else if str_nm_via_transp = 'P' then str_cd_via_transp := '05'
    else if str_nm_via_transp = 'B' then str_cd_via_transp := '06'
    else if str_nm_via_transp = 'L' then str_cd_via_transp := '07';

    qry_po_CD_VIA_TRANSP.AsString := str_cd_via_transp;

    // Nº Itens
    nr_itens := nr_itens + StrToInt( Copy( Stri, 82, 3 ) );
    qry_po_QT_TOTAL_ITENS.AsString := StrZero( nr_itens, 3 );

    // Moeda
    qry_moeda_broker_.Close;
    qry_moeda_broker_.ParamByName('CD_MOEDA').AsString := Copy( Stri, 85, 3 );
    qry_moeda_broker_.Prepare;
    qry_moeda_broker_.Open;
    if Not qry_moeda_broker_.EOF then
    begin
      qry_po_CD_MOEDA_NEG.AsString := Copy( Stri, 85, 3 );
    end;

    // Valor da Mercadoria
    qry_po_VL_TOTAL.AsFloat :=  StrToFloat( Copy( Stri, 88, 11 ) + ',' + Copy( Stri, 99, 2 ) );

    // Incoterm
    qry_po_CD_INCOTERM.AsString := Copy( Stri, 101, 3 );

    // Modalidade de Pagto
    qry_po_CD_MOD_PAGAMENTO.AsString := Copy( Stri, 104, 1 );

    // Zera Peso Líquido
    qry_po_PL_PO.AsFloat := 0;

    // Fabricante/Exportador
    qry_po_IN_FABR_EXPOR_IMP.AsString := '1';

    // Prepara Campo Quantidade Disponível
    qry_po_QT_TOTAL_DISPONIVEL.AsFloat := 999;

    // Usuário Integração
    qry_po_CD_USUARIO_INT.AsString := str_cd_usuario;

    qry_po_.Post;
  end;
end;


procedure Tfrm_po_leitura.ProcessaItem;
var
  CodMercadoria, CodMercadoriaRed : String[30];
  i: Integer;
  CodUnidMed, vNrItem : String[3];
begin
  try
    with datm_po_leitura do
    begin
      qry_verif_po_itens_.Close;
      qry_verif_po_itens_.ParamByName('NR_PROCESSO').AsString := Copy( Stri, 5, 10 );
      qry_verif_po_itens_.ParamByName('NR_ITEM').AsString     := Copy( Stri, 1, 4 );
      qry_verif_po_itens_.Prepare;
      qry_verif_po_itens_.Open;

      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQl.Clear;
        SQL.Add('SELECT ISNULL(MAX(NR_ITEM),''0'') FROM TPO_ITEM WHERE NR_PROCESSO = ''' + Copy( Stri, 5, 10 ) + '''');
        Open;
        vNrItem := Copy('000', 0, 3 - Length(IntToStr(Fields[0].AsInteger+1))) + IntToStr(Fields[0].AsInteger+1);
        Close;
        Free;
      end;

      if qry_verif_po_itens_TOTAL.AsInteger <= 0 then
      begin
        qry_po_itens_.Close;
        qry_po_itens_.ParamByName('NR_PROCESSO').AsString := Copy( Stri, 5, 10 );
        qry_po_itens_.Prepare;
        qry_po_itens_.Open;

        qry_po_itens_.Append;
        // Nº Processo
        qry_po_itens_NR_PROCESSO.AsString := Copy( Stri, 5, 10 );
        // Nº Item
        qry_po_itens_NR_ITEM.AsString     := vNrItem;//Copy( Stri, 2, 3 );
        // Nº Ítem do Cliente
        qry_po_itens_NR_ITEM_CLIENTE.AsString  := Copy( Stri, 1, 4 );

        // Mercadoria
        CodMercadoriaRed := '';
        try
          CodMercadoria := IntToStr( StrToInt( Copy( Stri, 15, 15 ) ) );
        except
          CodMercadoria := Copy( Stri, 15, 15 );
          for i := 0 to Length( CodMercadoria ) - 1 do
          begin
            if Copy( CodMercadoria, i, 1 ) <> '0' then
            begin
               CodMercadoriaRed := Trim( Copy( CodMercadoria, i, Length( CodMercadoria ) - 1 ) );
               break;
            end;
          end;
          if Trim( CodMercadoriaRed ) <> '' then CodMercadoria := CodMercadoriaRed;
        end;

        qry_po_itens_CD_MERCADORIA.AsString := CodMercadoria;

        // Unidade
        qry_unid_medida_broker_.Close;
        qry_unid_medida_broker_.ParamByName('NM_SIGLA').AsString := Copy( Stri, 83, 3 );
        qry_unid_medida_broker_.Prepare;
        qry_unid_medida_broker_.Open;
        if Not qry_unid_medida_broker_.EOF then
        begin
          CodUnidMed := qry_unid_medida_broker_CD_UNID_MEDIDA.AsString;
        end;

        qry_mercadoria_.Close;
        qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := CodMercadoria;
        qry_mercadoria_.Prepare;
        qry_mercadoria_.Open;
        if qry_mercadoria_.EOF then
        begin
          qry_mercadoria_.Append;
          qry_mercadoria_.FieldByName('CD_MERCADORIA').AsString    := CodMercadoria;
          qry_mercadoria_.FieldByName('NM_MERCADORIA').AsString    := Copy( Stri, 30, 40 );
          qry_mercadoria_.FieldByName('AP_MERCADORIA').AsString    := Copy( Stri, 30, 16 );
          qry_mercadoria_.FieldByName('CD_NCM_SH').AsString        := Copy( Stri, 123, 4 ) + Copy( Stri, 128, 2 ) + Copy( Stri, 131, 2 );
          qry_mercadoria_.FieldByName('CD_GRUPO').AsString         := '002';
          qry_mercadoria_.FieldByName('CD_UN_MED_COMERC').AsString := CodUnidMed;
          qry_mercadoria_.Post;
          qry_po_itens_TX_MERCADORIA.AsString := Copy( Stri, 30, 40 );
        end
        else
        begin
          qry_po_itens_TX_MERCADORIA.AsString := qry_mercadoria_NM_MERCADORIA.AsString;
        end;

        // Quantidade
        qry_po_itens_QT_INICIAL.AsFloat := StrToFloat( Copy( Stri, 70, 10 ) + ',' + Copy( Stri, 80, 3 ) );

        // Unidade
        qry_po_itens_CD_UNID_MEDIDA.AsString := CodUnidMed;

        // Avisar Drawback
        qry_po_itens_IN_AVISO_DB.AsString := '1';

        qry_po_.Close;
        qry_po_.ParamByName('NR_PROCESSO').AsString := Copy( Stri, 5, 10 );
        qry_po_.Prepare;
        qry_po_.Open;

        qry_po_.Edit;

        // Peso Líquido
        qry_po_itens_PL_ITEM.AsFloat := StrToFloat( Copy( Stri, 86, 10 ) + ',' + Copy( Stri, 96, 3 ) );
        qry_po_PL_PO.AsFloat         := qry_po_PL_PO.AsFloat + StrToFloat( Copy( Stri, 86, 10 ) + ',' + Copy( Stri, 96, 3 ) );

        // Peso Bruto
        qry_po_PB_PO.AsFloat         := qry_po_PB_PO.AsFloat + StrToFloat( Copy( Stri, 99, 10 ) + ',' + Copy( Stri, 109, 3 ) );
        qry_po_.Post;
        qry_po_.Close;

        // Valor Unitário
        qry_po_itens_VL_UNITARIO.AsFloat := StrToFloat( Copy( Stri, 112, 8 ) + ',' + Copy( Stri, 120, 2 ) );

        // Valor do Item
        qry_po_itens_VL_TOTAL.AsFloat    := qry_po_itens_VL_UNITARIO.AsFloat * qry_po_itens_QT_INICIAL.AsFloat;

        // Tipo de Cálculo
        qry_po_itens_TP_CALCULO.AsString := Copy( Stri, 122, 1 );

        // NCM
        qry_po_itens_CD_NCM_SH.AsString := Copy( Stri, 123, 4 ) + Copy( Stri, 128, 2 ) + Copy( Stri, 131, 2 );

        // Aliquota do ICMS
        qry_po_itens_PC_ICMS.AsFloat := StrToFloat( Copy( Stri, 134, 3 ) + ',' + Copy( Stri, 137, 2 ) );

        // Incoterm
        qry_po_itens_CD_INCOTERM.AsString := Copy( Stri, 139, 3 );

        // Aliquota do II
        qry_po_itens_VL_ESPEC_II.AsFloat := StrToFloat( Copy( Stri, 142, 3 ) + ',' + Copy( Stri, 145, 2 ) );

        // Aliquota do IPI
        qry_po_itens_VL_ESPEC_IPI.AsFloat := StrToFloat( Copy( Stri, 147, 3 ) + ',' + Copy( Stri, 150, 2 ) );

        qry_po_itens_.Post;

        qry_po_itens_.Close;
      end;
      qry_verif_po_itens_.Close;
    end;

  except
    on e:Exception do
    begin
      ShowMessage(e.message);
    end;
  end;
end;

procedure Tfrm_po_leitura.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;


procedure Tfrm_po_leitura.LeiaIteD;
begin
  with datm_po_leitura do
  begin
    //PO
    if POFatura = 0 then
    begin
      POFatura := 1;

      if Trim( LerLinha( 039, 015, 'C' ) ) <> '' then
      begin
        qry_po_.Close;
        qry_po_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
        qry_po_.Prepare;
        qry_po_.Open;

        if Not qry_po_.EOF then
        begin
          qry_po_.Edit;
          qry_po_NR_FATURA.AsString := Trim( LerLinha( 039, 015, 'C' ) );
          if Trim( LerLinha( 068, 02, 'C' ) ) <> '' then
            qry_po_DT_FATURA.AsDateTime := StrToDate( LerLinha( 068, 02, 'C' ) + '/' + LerLinha( 070, 02, 'C' ) + '/20' + LerLinha( 072, 02, 'C') );
          qry_po_.Post;
        end;
      end;
    end;

    //ITENS PO
    if Trim( LerLinha( 039, 015, 'C' ) ) <> '' then
    begin
      qry_po_itens_.Close;
      qry_po_itens_.ParamByName('NR_PROCESSO').AsString := LerLinha( 005, 015, 'C' );
      qry_po_itens_.ParamByName('NR_ITEM').AsString := cItem;
      qry_po_itens_.Prepare;
      qry_po_itens_.Open;

      if qry_po_itens_.EOF then
         Exit;

      qry_po_itens_.Edit;
      qry_po_itens_NR_FATURA.AsString := Trim( LerLinha( 039, 015, 'C' ) );
      qry_po_itens_.Post;
    end;
  end;
end;

procedure Tfrm_po_leitura.LeiaITDI;
begin
  // Seleciona nº do importador através do CGC  
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQl.Clear;
    SQL.Add('SELECT CD_EMPRESA FROM TEMPRESA_NAC WHERE CGC_EMPRESA = ''' + LerLinha( 017, 014, 'C' ) + '''');
    Open;
    cd_import := Fields[0].AsString;
    Close;
    Free;
  end;
end;

end.

