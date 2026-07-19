unit PGPE023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  Tfrm_exp_duplica = class(TForm)
    pnl_duplica: TPanel;
    lbl_processo: TLabel;
    Label1: TLabel;
    edt_novo_processo: TEdit;
    btn_nr_processo: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    btn_co_proc_new: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    btn_ok: TBitBtn;
    btn_cancela: TBitBtn;
    procedure edt_novo_processoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure edt_novo_processoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_exp_duplica: Tfrm_exp_duplica;
  NR_PROC_CONSULTA : String[18];

implementation

{$R *.DFM}

uses PGGP001, PGPE010, PGPE004, PGPE024, PGPE020, PGGP025, GSMLIB, PGGP015,
     PGPE018, PGSM136, ConsOnlineEx;


procedure Tfrm_exp_duplica.edt_novo_processoChange(Sender: TObject);
begin
  If Trim(edt_novo_processo.Text) <> '' then
     btn_ok.Enabled := True
  else
     btn_ok.Enabled := False;

end;

procedure Tfrm_exp_duplica.FormShow(Sender: TObject);
begin
  with datm_exp_duplica do
  begin
    qry_exp_.Close;
    qry_exp_.ParamByName('NR_PROCESSO').AsString := datm_exp.qry_exp_NR_PROCESSO.AsString;
    qry_exp_.Prepare;
    qry_exp_.Open;
  end;

  msk_nr_processo.Text := Copy( datm_exp_duplica.qry_exp_NR_PROCESSO.AsString,5,14 );
  edt_novo_processo.SetFocus;

end;

procedure Tfrm_exp_duplica.FormCreate(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_exp_duplica, datm_exp_duplica );

end;


procedure Tfrm_exp_duplica.btn_nr_processoClick(Sender: TObject);
begin


  if Sender is TSpeedButton then
     msk_nr_processo.Text := Copy(ConsultaOnLineExSQL('SELECT  P.NR_PROCESSO, E.AP_EMPRESA, P.DT_REGISTRO_PEDIDO, P.CD_INCOTERM ' +
                                                 'FROM TPROCESSO_EXP P, TEMPRESA_NAC E ' +
                                                 'WHERE P.CD_EXPORTADOR *= E.CD_EMPRESA AND ' +
                                                 'SUBSTRING(P.NR_PROCESSO, 1, 4) = ' + QuotedStr(frm_exp.msk_cd_unid_neg.Text + '02') ,
                                                 'Consulta de Processos',
                                                 ['NR_PROCESSO','AP_EMPRESA', 'DT_REGISTRO_PEDIDO', 'CD_INCOTERM'],
                                                 ['Processo','Empresa Nacional', 'Data de Registro', 'Incoterm'],'NR_PROCESSO'), 5, 14);


end;

procedure Tfrm_exp_duplica.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    with datm_exp_duplica do
    begin
      qry_exp_.Close;
      qry_exp_.ParamByName('NR_PROCESSO').AsString := frm_exp.msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      qry_exp_.Prepare;
      qry_exp_.Open;

      if qry_exp_.EOF then
      begin
        BoxMensagem( 'Processo de Exportação inexistente, digite novamente !!', 3 );
        msk_nr_processo.Text := '';
        msk_nr_processo.SetFocus;
        Exit;
      end;
    end;
  end;

end;


procedure Tfrm_exp_duplica.btn_co_proc_newClick(Sender: TObject);
begin


  if Sender is TSpeedButton then
     edt_novo_processo.Text := Copy(ConsultaOnLineExSQL('SELECT  P.NR_PROCESSO, E.AP_EMPRESA, P.DT_REGISTRO_PEDIDO, P.CD_INCOTERM ' +
                                                 'FROM TPROCESSO_EXP P, TEMPRESA_NAC E ' +
                                                 'WHERE P.CD_EXPORTADOR *= E.CD_EMPRESA AND ' +
                                                 'SUBSTRING(P.NR_PROCESSO, 1, 4) = ' + QuotedStr(frm_exp.msk_cd_unid_neg.Text + '02') ,
                                                 'Consulta de Processos',
                                                 ['NR_PROCESSO','AP_EMPRESA', 'DT_REGISTRO_PEDIDO', 'CD_INCOTERM'],
                                                 ['Processo','Empresa Nacional', 'Data de Registro', 'Incoterm'],'NR_PROCESSO'), 5, 14);


end;

procedure Tfrm_exp_duplica.edt_novo_processoExit(Sender: TObject);
begin
  if edt_novo_processo.Text <> '' then
  begin
    with datm_exp_duplica do
    begin
      If edt_novo_processo.Text <> msk_nr_processo.Text then
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString := frm_exp.msk_cd_unid_neg.Text + '02' + edt_novo_processo.Text;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if qry_processo_.EOF then
        begin
          BoxMensagem( 'Processo não encontrado. Digite novamente !!', 2 );
          edt_novo_processo.Text := '';
          edt_novo_processo.SetFocus;
          btn_ok.Enabled := False;
          Exit;
        end;

        qry_exp_.Close;
        qry_exp_.ParamByName('NR_PROCESSO').AsString := frm_exp.msk_cd_unid_neg.Text + '02' + edt_novo_processo.Text;
        qry_exp_.Prepare;
        qry_exp_.Open;

        if not (qry_exp_.EOF) then
        begin
          BoxMensagem( 'Processo de Exportação já existente !!', 3 );
          edt_novo_processo.Text := '';
          edt_novo_processo.SetFocus;
          Exit;
        end;
      end
      else
      begin
        BoxMensagem( 'Necessário ser Processo diferente !!', 3 );
        edt_novo_processo.Text := '';
        edt_novo_processo.SetFocus;
        exit;
      end;
    end;
  end;

end;

procedure Tfrm_exp_duplica.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_exp_duplica.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo then btn_nr_processoClick(btn_nr_processo);
    if Sender = edt_novo_processo then btn_co_proc_newClick(btn_co_proc_new);
  end;
  
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
  if ( Key = VK_F8 ) and ( Sender = edt_novo_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      edt_novo_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      edt_novo_processoExit(nil);
    end;
  end;
end;

end.
