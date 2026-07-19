unit PGCH029;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, UCRPE32, FILETEXT, ShellAPI, Funcoes;

type
  Tfrm_sel_unid_cli_mes_ano = class(TForm)
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_mes_ano: TLabel;
    msk_mes_ano: TMaskEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    crp_andamento: TCrpe;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    c1:  String;
    p1: Array[0..1024] of Char;
  public
    str_relatorio: integer;
    { 2 - FollowUp Importação
      4 - FollowUp Exportação }
    { Public declarations }
  end;

var
  frm_sel_unid_cli_mes_ano: Tfrm_sel_unid_cli_mes_ano;

implementation

{$R *.DFM}

uses GSMLIB, PGSM018, PGCH030, PGGP001, PGSM024, PGSM119;

var
   Arquivo : TFileText;

procedure Tfrm_sel_unid_cli_mes_ano.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_sel_unid_cli_mes_ano.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if str_relatorio in [1] then
  begin
    if msk_cd_unid_neg.Text = '' then
    begin
      edt_nm_unid_neg.Text := 'Todas';
      Exit;
    end
  end
  else
    if msk_cd_unid_neg.Text = '' then Exit;

  ValCodEdt(msk_cd_unid_neg);
  with datm_sel_unid_cli_mes_ano.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text := FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_mes_ano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_sel_unid_cli_mes_ano.Free;
  crp_andamento.Free;
  Action := cafree;
end;

procedure Tfrm_sel_unid_cli_mes_ano.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_unid_cli_mes_ano, datm_sel_unid_cli_mes_ano);
end;

procedure Tfrm_sel_unid_cli_mes_ano.OKBtnClick(Sender: TObject);
var
  Cont : Integer;
  str_totais : String;
  nr_linhas, nr_colunas : Integer;
begin
  if Str_Relatorio in [2,3] then
  begin
    if msk_cd_unid_neg.Text = '' then
    begin
      BoxMensagem('Informe uma Unidade!',2);
      if msk_cd_unid_neg.Enabled then msk_cd_unid_neg.SetFocus
      else msk_cd_unid_neg.SetFocus;
      Exit;
    end;
  end;

  if Str_Relatorio in [1,3] then
  begin
    if ( msk_cd_grupo.Text = '' ) and ( msk_cd_cliente.Text = '' ) then
    begin
      BoxMensagem('Informe um Grupo ou Cliente!',2);
      if msk_cd_grupo.Enabled then msk_cd_grupo.SetFocus
      else msk_cd_cliente.SetFocus;
      Exit;
    end;

    try
      if (StrToInt(Copy(msk_Mes_ano.Text,1,2)) < 1) or
         (StrToInt(Copy(msk_Mes_ano.Text,1,2)) > 12) then
      begin
        BoxMensagem('Mês inválido',2);
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart  := 0;
        msk_mes_ano.SelLength := 2;
        Exit;
      end;
    except
      on EConvertError do
      begin
        BoxMensagem('Mês inválido!',2);
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart  := 0;
        msk_mes_ano.SelLength := 2;
        Exit;
      end;
    end;

    try
      StrToInt(Copy(msk_mes_ano.Text,4,4));
    except
      on EConvertError do
      begin
        BoxMensagem('Ano inválido!',2);
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart  := 3;
        msk_mes_ano.SelLength := 4;
        exit;
      end;
    end;
  end;

  case str_relatorio of
  1: begin
       with datm_sel_unid_cli_mes_ano do
       begin
         qry_mapa_seg_.Close;
         qry_mapa_seg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
         qry_mapa_seg_.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
         qry_mapa_seg_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
         qry_mapa_seg_.ParamByName('MES').AsInteger        := StrToInt(Copy(msk_Mes_ano.Text,1,2));
         qry_mapa_seg_.ParamByName('ANO').AsInteger        := StrToInt(Copy(msk_Mes_ano.Text,4,4));
         qry_mapa_seg_.Prepare;
         qry_mapa_seg_.Open;

         Arquivo      := TFileText.Create;
         Arquivo.Name := cDir_Risc + '\SEGURO.TXT';
         Arquivo.CreateFile;
         {Cabeçalho}
         Cont := 0;
         qry_mapa_seg_.First;
         while Not qry_mapa_seg_.EOF do
         begin
           Cont := Cont + 1;
           qry_mapa_seg_.Next;
         end;
         c1 := IntToStr(Cont) + #13#10;
         c1 := c1 + '"' + msk_cd_unid_neg.Text + ' ' + Trim(edt_nm_unid_neg.Text) + '"' + Replicate(';', 13) + 'PÁGINA' + #13#10;
         c1 := c1 + 'RELAÇÃO MENSAL DE EMBARQUES - ' + msk_mes_ano.Text + Replicate(';', 13) + 'EMITIDO' + #13#10;
         c1 := c1 + '"' + msk_cd_cliente.Text + ' ' + Trim(edt_nm_cliente.Text) + '"' + Replicate(';', 13) + 'HORA' + #13#10;
         StrPCopy( p1, c1);
         Arquivo.Write( p1 );

         c1 := 'SUA REFERÊNCIA;N/REFER.;NR.FATURA;NAVIO/VOO;DT.BL;PAIS DE ORIGEM;';
         c1 := c1 + 'DESTINO FINAL;VIAGEM NO;;IMPORTANCIA SEGURADA ( NA MOEDA DE ORIGEM )' + #13#10;
         c1 := c1 + Replicate(';', 7) + 'PORAO;CONVES;MOEDA;F.O.B.;MOEDA;FRETE;FOB+FRETE' + #13#10;
         StrPCopy( p1, c1);
         Arquivo.Write( p1 );

         qry_mapa_seg_.First;
         while Not qry_mapa_seg_.EOF do
         begin
           qry_ref_cli_.Close;
           qry_ref_cli_.Prepare;
           qry_ref_cli_.Open;

           c1 := '';
           qry_ref_cli_.First;
           while Not qry_ref_cli_.EOF do
           begin
             c1 := c1 + Trim( qry_ref_cli_CD_REFERENCIA.AsString ) + '/';
             qry_ref_cli_.Next;
             if qry_ref_cli_.EOF then c1 := Copy( c1, 1, ( Length(c1) - 1 ) );
           end;
           c1 := c1  + ';';
           StrPCopy( p1, c1);
           Arquivo.Write( p1 );

           c1 := '';
           c1 := c1 + '"' + qry_mapa_seg_NR_PROCESSO.AsString + '";';
           StrPCopy( p1, c1);
           Arquivo.Write( p1 );

           qry_faturas_.Close;
           qry_faturas_.Prepare;
           qry_faturas_.Open;

           c1 := '';
           qry_faturas_.First;
           while Not qry_faturas_.EOF do
           begin
             c1 := c1 + Trim( qry_faturas_NR_DCTO_INSTRUCAO.AsString ) + '/';
             qry_faturas_.Next;
             if qry_faturas_.EOF then c1 := Copy( c1, 1, ( Length(c1) - 1 ) );
           end;
           c1 := c1  + ';';
           StrPCopy( p1, c1);
           Arquivo.Write( p1 );

           c1 := '';
           if ( Not qry_mapa_seg_NR_VOO.IsNull ) and ( Trim( qry_mapa_seg_NR_VOO.AsString ) <> '' ) then
              c1 := c1 + '"' + qry_mapa_seg_NR_VOO.AsString + '"'
           else c1 := c1 + qry_mapa_seg_NM_EMBARCACAO.AsString;
           c1 := c1 + ';';

           if Not qry_mapa_seg_DT_EMBARQUE.IsNull then
              c1 := c1 + Copy( qry_mapa_seg_DT_EMBARQUE.AsString, 1, 2) + '/' +
                         Copy( qry_mapa_seg_DT_EMBARQUE.AsString, 3, 2) + '/' +
                         Copy( qry_mapa_seg_DT_EMBARQUE.AsString, 5, 4);
           c1 := c1 + ';';

           c1 := c1 + qry_mapa_seg_NM_PAIS.AsString;
           c1 := c1 + ';S.J.CAMPOS;X;;';

           c1 := c1 + qry_mapa_seg_LookMoedaMLE.AsString + ';';
           c1 := c1 + FormatFloat('#0.00',  qry_mapa_seg_VL_MLE_MNEG.AsFloat ) + ';';
           c1 := c1 + qry_mapa_seg_LookMoedaFrete.AsString + ';';
           c1 := c1 + FormatFloat('#0.00',  qry_mapa_seg_VL_FRETE_PREPAID_MNEG.AsFloat +
                                            qry_mapa_seg_VL_FRETE_COLLECT_MNEG.AsFloat -
                                            qry_mapa_seg_VL_FRETE_TNAC_MNEG.AsFloat ) + ';';

           c1 := c1 + #13#10;
           StrPCopy( p1, c1);
           Arquivo.Write( p1 );

           qry_mapa_seg_.Next;
         end;

         qry_mapa_seg_.Close;
         Arquivo.Close;
         Arquivo.Free;

         {Fim da Geração do Arquivo}
         if BoxMensagem('Mapa de Seguro gerado com sucesso!' + #13#10 +
                        'Deseja abrir Mapa no Excel?' , 1) then
            ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\Smod-fut.XLS' ), '', SW_MAXIMIZE );
        end;
     end;

  2: begin
       Screen.Cursor := crHourGlass;
       Application.ProcessMessages;
       with crp_andamento do
       begin
         Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

         ReportName  := cDir_Rpt + '\CRGI007.RPT';
         ReportTitle := Caption+ ' - ' + edt_nm_unid_neg.Text;
         Formulas[0] := 'cd_unid_neg = "' + Trim( msk_cd_unid_neg.Text ) + '"';
         Formulas[1] := 'Produto = "01"';
         Formulas[2] := 'Grupo = "' + Trim( msk_cd_grupo.Text ) + '"';
         Formulas[3] := 'Cliente = "' + Trim( msk_cd_cliente.Text ) + '"';
         Execute;
         Screen.Cursor := crDefault;
       end;
     end;
  3: begin
       {Criação}
       Arquivo       := TFileText.Create;
       Arquivo.Name  := cDir_Risc + '\DESPMENS.TXT';
       Arquivo.CreateFile;
       Screen.Cursor := crHourGlass;

       with datm_sel_unid_cli_mes_ano do
       begin
         qry_tot_proc_.Close;
         qry_tot_proc_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
         qry_tot_proc_.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
         qry_tot_proc_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
         qry_tot_proc_.ParamByName('MES').AsInteger        := StrToInt( Copy( msk_Mes_ano.Text, 1, 2 ) );
         qry_tot_proc_.ParamByName('ANO').AsInteger        := StrToInt( Copy( msk_Mes_ano.Text, 4, 4 ) );
         qry_tot_proc_.Prepare;
         qry_tot_proc_.Open;
         nr_linhas := qry_tot_proc_TOT_PROC.AsInteger;
         qry_tot_proc_.Close;

         qry_processo_.Close;
         qry_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
         qry_processo_.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
         qry_processo_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
         qry_processo_.ParamByName('MES').AsInteger        := StrToInt( Copy( msk_Mes_ano.Text, 1, 2 ) );
         qry_processo_.ParamByName('ANO').AsInteger        := StrToInt( Copy( msk_Mes_ano.Text, 4, 4 ) );
         qry_processo_.Prepare;
         qry_processo_.Open;
         qry_processo_.First;

         qry_fob_us_.Close;
         qry_fob_us_.Prepare;
         qry_fob_us_.Open;

         qry_itens_dm_.Close;
         qry_itens_dm_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
         qry_itens_dm_.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
         qry_itens_dm_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
         qry_itens_dm_.ParamByName('MES').AsInteger        := StrToInt( Copy( msk_Mes_ano.Text, 1, 2 ) );
         qry_itens_dm_.ParamByName('ANO').AsInteger        := StrToInt( Copy( msk_Mes_ano.Text, 4, 4 ) );
         qry_itens_dm_.Prepare;
         qry_itens_dm_.Open;

         {Linhas X Colunas}
         qry_itens_dm_.First;
         nr_colunas := 0;
         while Not qry_itens_dm_.EOF do
         begin
           nr_colunas := nr_colunas + 1;
           qry_itens_dm_.Next;
         end;
         str_totais := IntToStr( nr_linhas ) + ';' + IntToStr( nr_colunas ) + #13#10;
         StrPCopy( p1, str_totais );
         Arquivo.Write( p1 );

         if msk_cd_grupo.Text <> '' then
         begin
           c1 := ';' + edt_nm_grupo.Text;
         end
         else
         begin
           c1 := ';' + edt_nm_cliente.Text;
         end;

         c1 := c1 + #13#10#13#10 + ';' + Caption + ';' +
            FormatDateTime( 'mmm', StrToDate( '01/' +  msk_mes_ano.Text ) ) +
            FormatDateTime( 'yyyy', StrToDate( '01/' +  msk_mes_ano.Text ) ) +
            #13#10#13#10;

         {Cabeçalho}
         c1 := c1 + 'IE;S/REF.;';
         qry_itens_dm_.First;
         while Not qry_itens_dm_.EOF do
         begin
           if ( qry_itens_dm_NM_APELIDO.IsNull ) or ( qry_itens_dm_NM_APELIDO.AsString = '' ) then
              c1 := c1 + qry_itens_dm_CD_ITEM.AsString + ';'
           else
              c1 := c1 + qry_itens_dm_NM_APELIDO.AsString + ';';
           StrPCopy( p1, c1);
           Arquivo.Write( p1 );
           c1 := '';
           qry_itens_dm_.Next;
         end;
         c1 := c1 + 'TOTAL;RECEB.DOC;';
         if qry_processo_CD_VIA_TRANSPORTE.AsString = '01' then
            c1 := c1 + 'ATRACAÇÃO;'
         else
            c1 := c1 + 'CHEGADA;';
         c1 := c1 + 'DESEMBARAÇO;VALOR FOB US$' + #13#10;
         StrPCopy( p1, c1);
         Arquivo.Write( p1 );

         qry_processo_.First;
         {Processo a Processo}
         while Not qry_processo_.EOF do
         begin
           {Gerar arquivo}
           {Processo}
           c1 := '';
           c1 := c1 + qry_processo_CalcNrProcesso.AsString + ';';
           StrPCopy( p1, c1);
           Arquivo.Write( p1 );
           {Referência}
           qry_ref_cli_.Close;
           qry_ref_cli_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
           qry_ref_cli_.Prepare;
           qry_ref_cli_.Open;
           c1 := '';
           qry_ref_cli_.First;
           while Not qry_ref_cli_.EOF do
           begin
             c1 := c1 + Trim( qry_ref_cli_CD_REFERENCIA.AsString ) + '/';
             qry_ref_cli_.Next;
             if qry_ref_cli_.EOF then c1 := Copy( c1, 1, ( Length(c1) - 1 ) );
           end;
           qry_ref_cli_.Close;
           c1 := c1  + ';';
           StrPCopy( p1, c1);
           Arquivo.Write( p1 );

           {Valor Item a Item}
           qry_itens_dm_.First;
           while Not qry_itens_dm_.EOF do
           begin
             qry_dm_.Close;
             qry_dm_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
             qry_dm_.ParamByName('CD_ITEM').AsString     := qry_itens_dm_CD_ITEM.AsString;
             qry_dm_.Prepare;
             qry_dm_.Open;
             if qry_dm_.RecordCount > 0 then
                c1 := FormatFloat( '#0.00', qry_dm_VL_ITEM.AsFloat ) + ';'
             else
                c1 := '0' + ';';
             StrPCopy( p1, c1);
             Arquivo.Write( p1 );
             qry_dm_.Close;
             qry_itens_dm_.Next;
           end;
           c1 := ';';
           {Datas}
           {Recebimento de Doctos}
           if Not qry_processo_DT_RECEB_DOC.IsNull then
             c1 := c1 + FormatDateTime( 'dd/mm/yyyy', qry_processo_DT_RECEB_DOC.AsDateTime );
           c1 := c1 + ';';
           {Atracação/Chegada}
           if Not qry_processo_DT_CHEGADA.IsNull then
             c1 := c1 + FormatDateTime( 'dd/mm/yyyy', qry_processo_DT_CHEGADA.AsDateTime );
           c1 := c1 + ';';
           {Desembaraço}
           if Not qry_processo_DT_DESEMB.IsNull then
             c1 := c1 + FormatDateTime( 'dd/mm/yyyy', qry_processo_DT_DESEMB.AsDateTime );
           c1 := c1 + ';';
           {Valor FOB US$}
           c1 := c1 + FormatFloat( '#0.00', qry_fob_us_CalcValorFOB.AsFloat ) + ';';
           c1 := c1 + #13#10;
           StrPCopy( p1, c1);
           Arquivo.Write( p1 );
           qry_processo_.Next;
         end;
         qry_processo_.Close;
       end;
       c1 := 'TOTAL;=====>';
       StrPCopy( p1, c1);
       Arquivo.Write( p1 );

       Arquivo.Close;
       Arquivo.Free;
       Screen.Cursor := crDefault;

       if FileExists(cDir_Rpt + '\DESPESAS.XLS') then
          DeleteFile(cDir_Rpt + '\DESPESAS.XLS');

       if BoxMensagem('Planilha Gerada com sucesso!' + #13#10 +
                      'Deseja abri-la no Excel?' , 1) then
          ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\DespMens.XLS' ), '', SW_MAXIMIZE );
       CancelBtn.SetFocus;
     end;
  4: begin
       Screen.Cursor := crHourGlass;
       Application.ProcessMessages;
       with crp_andamento do
       begin
         Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

         ReportName  := cDir_Rpt + '\CRGI007.RPT';
         ReportTitle := Caption+ ' - ' + edt_nm_unid_neg.Text;
         Formulas[0] := 'cd_unid_neg = "' + Trim( msk_cd_unid_neg.Text ) + '"';
         Formulas[1] := 'Produto = "02"';
         Formulas[2] := 'Grupo = "' + Trim( msk_cd_grupo.Text ) + '"';
         Formulas[3] := 'Cliente = "' + Trim( msk_cd_cliente.Text ) + '"';
         Execute;
         Screen.Cursor := crDefault;
       end;
     end;
  end;
end;

procedure Tfrm_sel_unid_cli_mes_ano.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_sel_unid_cli_mes_ano.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then exit;
  ValCodEdt(msk_cd_cliente);
  with datm_sel_unid_cli_mes_ano do
  begin
    qry_cliente_.Close;
    qry_cliente_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    qry_cliente_.Prepare;
    qry_cliente_.Open;
    if qry_cliente_.RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text := qry_cliente_.FieldByName('AP_EMPRESA').AsString;
    qry_cliente_.Close;
  end;
end;

procedure Tfrm_sel_unid_cli_mes_ano.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_sel_unid_cli_mes_ano.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_grupo.Cons_OnLine_Texto := msk_cd_grupo.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_sel_unid_cli_mes_ano.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then Exit;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_unid_cli_mes_ano.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo de Clientes não encontrado!',2);
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_mes_ano.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_cli_mes_ano.FormShow(Sender: TObject);
begin
  case str_relatorio of
  1: Caption := 'Mapa de Seguro';
  2: begin
       Caption             := 'Follow-up dos Processos de Importação';
       lbl_mes_ano.Visible := False;
       msk_mes_ano.Visible := False;
       OKBtn.Top           := OKBtn.Top - 35;
       Cancelbtn.Top       := Cancelbtn.Top - 35;
       Height              := Height - 35;
     end;
  3: Caption               := 'Relação de Despesas Mensais';
  4: begin
       Caption             := 'Follow-up dos Processos de Exportação';
       lbl_mes_ano.Visible := False;
       msk_mes_ano.Visible := False;
       OKBtn.Top           := OKBtn.Top - 35;
       Cancelbtn.Top       := Cancelbtn.Top - 35;
       Height              := Height - 35;
     end;
  end;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_sel_unid_cli_mes_ano.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_sel_unid_cli_mes_ano.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;

procedure Tfrm_sel_unid_cli_mes_ano.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_grupo then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente then btn_co_clienteClick(nil);
  end;
end;

end.
