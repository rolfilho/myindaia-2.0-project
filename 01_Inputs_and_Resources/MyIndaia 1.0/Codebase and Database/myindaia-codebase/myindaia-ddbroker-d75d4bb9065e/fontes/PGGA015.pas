(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGA015.PAS - frm_imp_eventos_nao_realizados

AUTOR: Leandro Stipanich

DATA: dd/mm/yyyy

Manutenção: Leandro Stipanich

Data: 08/01/2002

*************************************************************************************************)

unit PGGA015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, UCRPE32, ComCtrls, checklst, Funcoes;

type
  Tfrm_imp_eventos_nao_realizados = class(TForm)
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    lbl_evento: TLabel;
    btn_co_evento: TSpeedButton;
    msk_cd_evento: TMaskEdit;
    edt_nm_evento: TEdit;
    RadioGroup1: TRadioGroup;
    msk_dt_referencia: TMaskEdit;
    lbl_dt_referencia: TLabel;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    crp_rel_eventos_nao_realizados: TCrpe;
    msk_dt_inicio: TMaskEdit;
    lbl_periodo_de: TLabel;
    msk_dt_fim: TMaskEdit;
    lbl_periodo_a: TLabel;
    lbl_analista_com: TLabel;
    msk_cd_analista_com: TMaskEdit;
    edt_nm_analista_com: TEdit;
    btn_co_analista_com: TSpeedButton;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    Label2: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure msk_cd_eventoExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure msk_dt_referenciaExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_analista_comExit(Sender: TObject);
    procedure btn_co_analista_comClick(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_cd_relatorio : String;
  end;

var
  frm_imp_eventos_nao_realizados: Tfrm_imp_eventos_nao_realizados;

implementation

uses PGGA016, PGSM010, PGSM018, PGSM024, PGSM036, GSMLIB, PGGP001, PGSM119, PGSM212;

{$R *.DFM}

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_unid_negExit(
  Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  with datm_imp_eventos_nao_realizados.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;

end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_produtoExit(
  Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  with datm_imp_eventos_nao_realizados.qry_produto_ do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_Produto.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      msk_cd_Produto.Clear;
      edt_nm_Produto.Clear;
    end
    else edt_nm_produto.Text:= FieldByName('AP_PRODUTO').AsString;
    Close;
  end;

end;

procedure Tfrm_imp_eventos_nao_realizados.btn_co_produtoClick(
  Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  With frm_produto Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_imp_eventos_nao_realizados.btn_co_unid_negClick(
  Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  With frm_unidade Do
  Begin
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

procedure Tfrm_imp_eventos_nao_realizados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_rel_eventos_nao_realizados.Free;
  datm_imp_eventos_nao_realizados.free;
  action:= cafree;
end;

procedure Tfrm_imp_eventos_nao_realizados.FormCreate(Sender: TObject);
begin
  Application.CreateForm(tdatm_imp_eventos_nao_realizados,datm_imp_eventos_nao_realizados);
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_imp_eventos_nao_realizados.qry_cliente_ do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  With frm_cliente Do
  Begin
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

procedure Tfrm_imp_eventos_nao_realizados.btn_co_eventoClick(
  Sender: TObject);
begin
  Application.CreateForm(Tfrm_evento, frm_evento);
  With frm_evento Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_evento.Cons_OnLine_Texto := msk_cd_evento.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_evento.Text := frm_evento.Cons_OnLine_Texto;
  end;
  msk_cd_eventoExit(nil);
  msk_cd_evento.SetFocus;
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_eventoExit(Sender: TObject);
begin
  edt_nm_evento.Clear;
  if msk_cd_evento.text = '' then
  begin
    edt_nm_evento.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_evento);
  with datm_imp_eventos_nao_realizados.qry_evento_ do
  begin
    ParamByName('CD_evento').AsString := msk_cd_evento.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Evento não encontrado!',2);
      msk_cd_evento.Clear;
      msk_cd_evento.SetFocus;
    end
    else edt_nm_evento.Text:= FieldByName('NM_EVENTO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.btn_iniciarClick(Sender: TObject);
var st_responsavel:String;
    nr_identificador :Integer;
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    BoxMensagem('A Unidade de Negócio é obrigatório!',2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if msk_cd_produto.Text = '' then
  begin
    BoxMensagem('O Produto é obrigatório!',2);
    msk_cd_Produto.SetFocus;
    Exit;
  end;

  if str_cd_relatorio = '1' then
  begin
    if msk_dt_referencia.Text = '  /  /    ' then
    begin
      BoxMensagem('A data de referência é obrigatória!',2);
      msk_dt_referencia.SetFocus;
      Exit;
    end;
    if StrToDate(msk_dt_referencia.Text) < Date then
    begin
      BoxMensagem( 'Data de referência deve ser maior ou igual a data de hoje!', 2 );
      msk_dt_referencia.Clear;
      msk_dt_referencia.SetFocus;
      Exit;
    end;
  end
  else
  begin
    if msk_dt_inicio.Text = '  /  /    ' then
    begin
      BoxMensagem('A data de inicio do período é obrigatória!',2);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
    if msk_dt_fim.Text = '  /  /    ' then
    begin
      BoxMensagem('A data de fim do período é obrigatória!',2);
      msk_dt_fim.SetFocus;
      Exit;
    end;
    if StrToDate(msk_dt_inicio.Text) > StrToDate(msk_dt_fim.Text)then
    begin
      BoxMensagem('Data de inicio do período deve ser menor que a de fim do período!',2);
      msk_dt_inicio.Clear;
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;

  Screen.Cursor := crHourGlass;
  with crp_rel_eventos_nao_realizados do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    with datm_imp_eventos_nao_realizados do
    begin
      CloseStoredProc(sp_atz_ref_cliente);
      //Grupo
      if Trim( msk_cd_grupo.Text ) = '' then sp_atz_ref_cliente.ParamByName('@cd_grupo').AsString := 'XXX'
      else sp_atz_ref_cliente.ParamByName('@cd_grupo').AsString := msk_cd_grupo.Text;
      //Cliente
      if Trim( msk_cd_cliente.Text ) = '' then sp_atz_ref_cliente.ParamByName('@cd_cliente').AsString := 'XXXXX'
      else sp_atz_ref_cliente.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
      //Responsável
      case RadioGroup1.ItemIndex of
        0: sp_atz_ref_cliente.ParamByName('@cd_responsavel').AsString := 'C';
        1: sp_atz_ref_cliente.ParamByName('@cd_responsavel').AsString := 'D';
        2: sp_atz_ref_cliente.ParamByName('@cd_responsavel').AsString := 'X';
      end;
      //Unidade de Negócio
      sp_atz_ref_cliente.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      //Produto
      sp_atz_ref_cliente.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
      //Evento
      if Trim( msk_cd_evento.Text ) = '' then sp_atz_ref_cliente.ParamByName('@cd_evento').AsString := 'XXX'
      else sp_atz_ref_cliente.ParamByName('@cd_evento').AsString := msk_cd_evento.Text;
      //Área
      if Trim(msk_cd_area.Text)= '' then sp_atz_ref_cliente.ParamByName('@cd_area').AsString := 'XX'
      else sp_atz_ref_cliente.ParamByName('@cd_area').AsString := msk_cd_area.Text;
      //Analista Responsavel Comissária
      if Trim( msk_cd_analista_com.Text ) = '' then sp_atz_ref_cliente.ParamByName('@cd_analista_com').AsString := 'XXXX'
      else sp_atz_ref_cliente.ParamByName('@cd_analista_com').AsString := msk_cd_analista_com.Text;

      if str_cd_relatorio = '1' then sp_atz_ref_cliente.ParamByName('@tipo').AsString := '1';
      if str_cd_relatorio = '2' then sp_atz_ref_cliente.ParamByName('@tipo').AsString := '2';

      if str_cd_relatorio = '1' then sp_atz_ref_cliente.ParamByName('@dt_inicio').AsDateTime := StrToDate( msk_dt_referencia.Text );
      if str_cd_relatorio = '2' then sp_atz_ref_cliente.ParamByName('@dt_inicio').AsDateTime := StrToDate( msk_dt_inicio.Text );

      if str_cd_relatorio = '1' then sp_atz_ref_cliente.ParamByName('@dt_fim').AsDateTime := StrToDate( msk_dt_referencia.Text );
      if str_cd_relatorio = '2' then sp_atz_ref_cliente.ParamByName('@dt_fim').AsDateTime := StrToDate( msk_dt_fim.Text );
      ExecStoredProc(sp_atz_ref_cliente);
      CloseStoredProc(sp_atz_ref_cliente);

      CloseStoredProc(sp_atz_ev_nao_real);
      {Grupo}
      if Trim( msk_cd_grupo.Text ) = '' then sp_atz_ev_nao_real.ParamByName('@cd_grupo').AsString := 'XXX'
      else sp_atz_ev_nao_real.ParamByName('@cd_grupo').AsString := msk_cd_grupo.Text;
      {Cliente}
      if Trim( msk_cd_cliente.Text ) = '' then sp_atz_ev_nao_real.ParamByName('@cd_cliente').AsString := 'XXXXX'
      else sp_atz_ev_nao_real.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
      {Responsável}
      case RadioGroup1.ItemIndex of
        0: sp_atz_ev_nao_real.ParamByName('@cd_responsavel').AsString := 'C';
        1: sp_atz_ev_nao_real.ParamByName('@cd_responsavel').AsString := 'D';
        2: sp_atz_ev_nao_real.ParamByName('@cd_responsavel').AsString := 'X';
      end;
      {Unidade de Negócio}
      sp_atz_ev_nao_real.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      {Produto}
      sp_atz_ev_nao_real.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
      {Evento}
      if Trim( msk_cd_evento.Text ) = '' then sp_atz_ev_nao_real.ParamByName('@cd_evento').AsString := 'XXX'
      else sp_atz_ev_nao_real.ParamByName('@cd_evento').AsString := msk_cd_evento.Text;
      {Área}
      if Trim(msk_cd_area.Text)= '' then sp_atz_ev_nao_real.ParamByName('@cd_area').AsString := 'XX'
      else sp_atz_ev_nao_real.ParamByName('@cd_area').AsString := msk_cd_area.Text;
      {Analista Responsável Comissária}
      if Trim( msk_cd_analista_com.Text ) = '' then sp_atz_ev_nao_real.ParamByName('@cd_analista_com').AsString := 'XXXX'
      else sp_atz_ev_nao_real.ParamByName('@cd_analista_com').AsString := msk_cd_analista_com.Text;

      if str_cd_relatorio = '1' then sp_atz_ev_nao_real.ParamByName('@tipo').AsString := '1';
      if str_cd_relatorio = '2' then sp_atz_ev_nao_real.ParamByName('@tipo').AsString := '2';

      if str_cd_relatorio = '1' then sp_atz_ev_nao_real.ParamByName('@dt_inicio').AsDateTime := StrToDate( msk_dt_referencia.Text );
      if str_cd_relatorio = '2' then sp_atz_ev_nao_real.ParamByName('@dt_inicio').AsDateTime := StrToDate( msk_dt_inicio.Text );

      if str_cd_relatorio = '1' then sp_atz_ev_nao_real.ParamByName('@dt_fim').AsDateTime := StrToDate( msk_dt_referencia.Text );
      if str_cd_relatorio = '2' then sp_atz_ev_nao_real.ParamByName('@dt_fim').AsDateTime := StrToDate( msk_dt_fim.Text );
      ExecStoredProc(sp_atz_ev_nao_real);
      nr_identificador := sp_atz_ev_nao_real.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc(sp_atz_ev_nao_real);
    end;
    Screen.Cursor := crDefault;

    if str_cd_relatorio = '1' then
    begin
      ReportName  := cDir_Rpt + '\CRGA002.RPT';
      case RadioGroup1.ItemIndex of
      0: st_responsavel:= 'do Cliente';
      1: st_responsavel:= 'da Comissária';
      2: st_responsavel:= 'de Ambos';
      end;
      case RadioGroup1.ItemIndex of
      0: ParamFields[2]:= 'C';
      1: ParamFields[2]:= 'D';
      2: ParamFields[2]:= 'X';
      end;
      ParamFields[0] := edt_nm_unid_neg.Text;
      ParamFields[1] := edt_nm_produto.Text;
      ReportTitle:= 'Relação dos Eventos Não Realizados até ' + msk_dt_referencia.Text;
      Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );
      Execute;
    end
    else
    begin
      ReportName  := cDir_Rpt + '\CRGA003.RPT';
      case RadioGroup1.ItemIndex of
      0: st_responsavel:= 'do Cliente';
      1: st_responsavel:= 'da Comissária';
      2: st_responsavel:= 'de Ambos';
      end;

      if Trim( msk_cd_cliente.Text ) = '' then ParamFields[0] := 'XXXXX'
      else ParamFields[0] := msk_cd_cliente.Text;
      ParamFields[1] := msk_cd_unid_neg.Text;
      ParamFields[2] := msk_cd_produto.Text;
      if Trim( msk_cd_evento.Text ) = '' then ParamFields[3] := 'XXX'
      else ParamFields[3] := msk_cd_evento.Text;
      if Trim(msk_cd_area.Text) = '' then ParamFields[7] := 'XX'
      else ParamFields[7] := msk_cd_area.Text;
      ParamFields[4] := msk_dt_inicio.Text;
      ParamFields[5] := msk_dt_fim.Text;
      if Trim(msk_cd_grupo.Text) = '' then ParamFields[8] := 'XXX'
      else ParamFields[8] := msk_cd_grupo.Text;
      case RadioGroup1.ItemIndex of
      0: ParamFields[6] := 'C';
      1: ParamFields[6] := 'D';
      2: ParamFields[6] := 'X';
      end;
      Execute;
    end;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_dt_referenciaExit(
  Sender: TObject);
begin
  if msk_dt_referencia.Text = '  /  /    ' then Exit;
  try
    StrToDate( msk_dt_referencia.Text );
  except
    on EConvertError do
    begin
      BoxMensagem( 'Data Inválida!', 2 );
      msk_dt_referencia.Clear;
      msk_dt_referencia.SetFocus;
    end;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_unid_negKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg      then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto       then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo         then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente       then btn_co_clienteClick(nil);
    if Sender = msk_cd_evento        then btn_co_eventoClick(nil);
    if Sender = msk_cd_analista_com  then btn_co_analista_comClick(nil);
    if Sender = msk_cd_area          then btn_co_areaClick(nil);
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.FormShow(Sender: TObject);
begin
  if str_cd_relatorio = '1' then
  begin
    frm_imp_eventos_nao_realizados.Caption := 'Relação dos Eventos Não Realizados';
    lbl_dt_referencia.Visible   := True;
    msk_dt_referencia.Visible   := True;
    lbl_periodo_de.Visible      := False;
    lbl_periodo_a.Visible       := False;
    msk_dt_inicio.Visible       := False;
    msk_dt_fim.Visible          := False;
    msk_dt_referencia.Text      := DateToStr(Date);
    lbl_analista_com.Visible    := True;
    lbl_analista_com.Top        := lbl_evento.Top + 40;
    msk_cd_analista_com.Visible := True;
    msk_cd_analista_com.Top     := msk_cd_evento.Top + 40;
    edt_nm_analista_com.Visible := True;
    edt_nm_analista_com.Top     := edt_nm_evento.Top + 40;
    btn_co_analista_com.Visible := True;
    btn_co_analista_com.Top     := btn_co_evento.Top + 40;
  end
  else
  begin
    frm_imp_eventos_nao_realizados.Caption := 'Relação dos Eventos Realizados';
    lbl_area.Visible          := True;
    msk_cd_area.Visible       := True;
    edt_nm_area.Visible       := True;
    btn_co_area.Visible       := True;
    lbl_dt_referencia.Visible := False;
    msk_dt_referencia.Visible := False;
    lbl_periodo_de.Visible    := True;
    lbl_periodo_a.Visible     := True;
    msk_dt_inicio.Visible     := True;
    msk_dt_fim.Visible        := True;
    msk_dt_inicio.Text        := DateToStr(Date);
    msk_dt_fim.Text           := DateToStr(Date);

  end;
  msk_cd_unid_neg.Text        := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text         := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_analista_comExit(Sender: TObject);
begin
  edt_nm_analista_com.Clear;
  if msk_cd_analista_com.text = '' then
  begin
    edt_nm_analista_com.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_analista_com);
  with datm_imp_eventos_nao_realizados.qry_usuario_ do
  begin
    ParamByName('CD_USUARIO').AsString := msk_cd_analista_com.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Analista não encontrado!', 2 );
      msk_cd_analista_com.Clear;
      msk_cd_analista_com.SetFocus;
    end
    else edt_nm_analista_com.Text:= FieldByName('AP_USUARIO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.btn_co_analista_comClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TUSUARIO', msk_cd_analista_com , 'Analista', 45, '' );
  msk_cd_analista_comExit(nil);
end;

procedure Tfrm_imp_eventos_nao_realizados.btn_co_areaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_area, frm_area);
  With frm_area Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_area.Cons_OnLine_Texto := msk_cd_area.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_area.Text := frm_area.Cons_OnLine_Texto;
  end;
  msk_cd_areaExit(nil);
  msk_cd_area.SetFocus;
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_areaExit(Sender: TObject);
begin
  edt_nm_area.Clear;
  if msk_cd_area.text = '' then
  begin
    edt_nm_area.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_area);
  with datm_imp_eventos_nao_realizados.qry_area_ do
  begin
    ParamByName('CD_AREA').AsString := msk_cd_area.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Área não encontrada!', 2 );
      msk_cd_area.Clear;
      msk_cd_area.SetFocus;
    end
    else edt_nm_area.Text:= FieldByName('NM_AREA').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.text = '' then
  begin
    edt_nm_grupo.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_grupo);
  with datm_imp_eventos_nao_realizados.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Grupo não encontrado!', 2 );
      msk_cd_grupo.Clear;
      edt_nm_grupo.Clear;
    end
    else edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Enabled := False;
    btn_co_cliente.Enabled := False;
  end
  else
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    btn_co_cliente.Enabled := True;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text <> '' then
  begin
    msk_cd_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Enabled := False;
    btn_co_grupo.Enabled := False;
  end
  else
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    btn_co_grupo.Enabled := True;
  end;
end;

procedure Tfrm_imp_eventos_nao_realizados.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
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

end.

