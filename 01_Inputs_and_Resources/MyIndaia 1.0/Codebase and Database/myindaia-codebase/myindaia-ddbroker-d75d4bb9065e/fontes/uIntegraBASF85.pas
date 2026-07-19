unit UintegraBASF85;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, Mask, ExtCtrls, FileCtrl, DB,
  DBTables, ConsOnlineEx, PGGP017, Funcoes, ADODB, Txtradev, ppDB,
  ppDBPipe, MemTable, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, LibTiffDelphi, LibDelphi, LibJpegDelphi,
  IdMessage, IdSMTP, Gauges, IniFiles;

type
  TfrmIntegraBASF85 = class(TForm)
    panel: TPanel;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    btn_envio: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    lbl_cd_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    dsProcesso: TDataSource;
    qryProcesso: TQuery;
    pnlTopo: TPanel;
    shp1: TShape;
    lbl1: TLabel;
    dsRE: TDataSource;
    qryRE: TQuery;
    dsNF: TDataSource;
    qryNF: TQuery;
    qryProcessoNR_PROCESSO: TStringField;
    qryProcessoNR_DDE: TStringField;
    qryProcessoDT_DDE: TStringField;
    qryProcessoCONHEC: TStringField;
    qryProcessoDT_CONHEC: TStringField;
    qryProcessoDEST: TStringField;
    qryProcessoDT_AVERBACAO: TStringField;
    qryRENR_RE: TStringField;
    qryREDT_RE: TStringField;
    qryNFNF: TStringField;
    qryNFDT_NF: TStringField;
    qryProcessoTP_CONHEC: TStringField;
    qryRESULFIXO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btn_envioClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIntegraBASF85: TfrmIntegraBASF85;

implementation

uses PGGP001, PGSM990, GSMLIB;

{$R *.dfm}

procedure TfrmIntegraBASF85.FormCreate(Sender: TObject);
begin
  msk_cd_unid_neg.Text :=  ConsultaLookUpSQL('SELECT ISNULL(CD_UNID_NEG, '''') AS UNID ' +
                                             '  FROM TUSUARIO_HABILITACAO ' +
                                             ' WHERE IN_DEFAULT = ''1'' ' +
                                             '   AND CD_USUARIO = ''' + str_cd_usuario + ''' ', 'UNID');
  msk_cd_produto.Text  := '02';
  edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', str_cd_unid_neg, 'AP_UNID_NEG');
  edt_nm_produto.Text  := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', '02', 'NM_PRODUTO');
end;

procedure TfrmIntegraBASF85.btn_envioClick(Sender: TObject);
var vArq: TextFile;
    vNmArq, vStrTxt: string;
    vConhecAux : string;
begin
  try
    qryProcesso.Close;
    //xxxqryProcesso.ParamByName('NR_PROCESSO').AsString := Trim(msk_cd_unid_neg.Text) + '02' + Trim(msk_nr_processo.Text);
    qryProcesso.Open;
    if qryProcesso.IsEmpty then
      Application.MessageBox('Processo Inválido, Inexistente ou sem Nota Fiscal Cadastrada!', 'MyIndaiá', MB_OK + MB_ICONERROR)
    else begin
      vnmArq := 'C:\DDBroker\' + 'Reg85_'+ FormatDateTime('ddmmyyyy', date() ) + FormatDateTime('hhmmss', time() ) + '.txt';;
      AssignFile( vArq, vNmArq );
      ReWrite( vArq );

      while not qryProcesso.Eof do begin
        qryNF.Close;
        qryRE.Close;
        qryNF.Open;
        if qryNF.IsEmpty then begin
          //xxxApplication.MessageBox('Processo sem Nota Fiscal Cadastrada!', 'MyIndaiá', MB_OK + MB_ICONERROR);
          //xxxExit;
          qryProcesso.Next; //xxx
          Continue; //xxx
        end;
        qryRE.Open;
        if qryRE.IsEmpty then begin
          //xxxApplication.MessageBox('Processo sem Registro de Exportação Cadastrado!', 'MyIndaiá', MB_OK + MB_ICONERROR);
          //xxxExit;
          qryProcesso.Next; //xxx
          Continue; //xxx
        end;

        if StrToIntDef(ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TREF_CLIENTE WHERE NR_PROCESSO = "' + qryProcessoNR_PROCESSO.AsString + '" AND CD_REFERENCIA LIKE "%AMOSTRA%" ', 'CONT'), 0) > 0 then begin
          qryProcesso.Next; //xxx
          Continue; //xxx
        end;

        qryNF.First;
        qryRE.First;
        while not qryNF.EOF do
        begin
          vStrTxt := '85'; //tipo
          vStrTxt := vStrTxt + Copy(qryProcesso.Fieldbyname('NR_DDE').AsString, 1, 11) + Space(11 - Length(qryProcesso.Fieldbyname('NR_DDE').AsString));
          if (not qryProcesso.Fieldbyname('DT_DDE').IsNull) and (StrToIntDef(Copy(qryProcesso.Fieldbyname('DT_DDE').AsString, 1, 4), 1900) > 1900) then
            vStrTxt := vStrTxt + Copy(qryProcesso.Fieldbyname('DT_DDE').AsString, 1, 8)
          else
            vStrTxt := vStrTxt + '        ';
          vStrTxt := vStrTxt + '1';
          //RE
          vStrTxt := vStrTxt + Copy(qryRE.FieldByName('NR_RE').AsString, 1, 9) + Copy(qryRE.FieldByName('SULFIXO').AsString, 1, 3) + Space(12 - Length(Copy(qryRE.FieldByName('NR_RE').AsString, 1, 9) + Copy(qryRE.FieldByName('SULFIXO').AsString, 1, 3)));
          if (not qryRE.Fieldbyname('DT_RE').IsNull) and (StrToIntDef(Copy(qryRE.Fieldbyname('DT_RE').AsString, 1, 4), 1900) > 1900) then
            vStrTxt := vStrTxt + Copy(qryRE.Fieldbyname('DT_RE').AsString, 1, 8)
          else
            vStrTxt := vStrTxt + '        ';
          vConhecAux := '';
          vConhecAux := StringReplace(Copy(qryProcesso.FieldByName('CONHEC').AsString, 1, 16), '.', '', [rfReplaceAll]);
          vStrTxt := vStrTxt + vConhecAux + Space(16 - Length(vConhecAux));
          if (not qryProcesso.Fieldbyname('DT_CONHEC').IsNull) and (StrToIntDef(Copy(qryProcesso.Fieldbyname('DT_CONHEC').AsString, 1, 4), 1900) > 1900) then
            vStrTxt := vStrTxt + Copy(qryProcesso.Fieldbyname('DT_CONHEC').AsString, 1, 8)
          else
            vStrTxt := vStrTxt + '        ';
          vStrTxt := vStrTxt + qryProcesso.FieldByName('TP_CONHEC').AsString;
          vStrTxt := vStrTxt + Copy(qryProcesso.Fieldbyname('DEST').AsString, 1, 4) + Space(4 - Length(qryProcesso.Fieldbyname('DEST').AsString));
          vStrTxt := vStrTxt + '00000000'; //reservado
          if (not qryProcesso.Fieldbyname('DT_AVERBACAO').IsNull) and (StrToIntDef(Copy(qryProcesso.Fieldbyname('DT_AVERBACAO').AsString, 1, 4), 1900) > 1900) then
            vStrTxt := vStrTxt + Copy(qryProcesso.Fieldbyname('DT_AVERBACAO').AsString, 1, 8)
          else
            vStrTxt := vStrTxt + '        ';
          //NF
          vStrTxt := vStrTxt + Copy(qryNF.Fieldbyname('NF').AsString, 1, 6) + Space(6 - Length(qryNF.Fieldbyname('NF').AsString));
          if (not qryNF.Fieldbyname('DT_NF').IsNull) and (StrToIntDef(Copy(qryNF.Fieldbyname('DT_NF').AsString, 1, 4), 1900) > 1900) then
            vStrTxt := vStrTxt + Copy(qryNF.Fieldbyname('DT_NF').AsString, 1, 8)
          else
            vStrTxt := vStrTxt + '        ';

          vStrTxt := vStrTxt + '01001                   ' +#13#10;

          Write( vArq, vStrTxt );
          qryNF.Next;
          if not qryRE.Eof then qryRE.Next;
        end;

        qryProcesso.Next;
      end;
        
      CloseFile( vArq );

      //abertura do form de impressão
      Application.CreateForm(TFrm_impressao, Frm_impressao );
      frm_impressao.vApenas_email := true;
      frm_impressao.eSubject.Text :='Integração BASF - Reg. 85 - ' + msk_nr_processo.Text;
      Frm_impressao.LstFiles.Items.Add(vNmArq);
      frm_impressao.ShowModal;
      frm_impressao.Release;


    end;
  finally
    qryProcesso.Close;
    qryNF.Close;
    qryRE.Close;
  end;
end;

procedure TfrmIntegraBASF85.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO, 5, 14) NR_PROCESSO_ABR, PR.CD_UNID_NEG, PR.CD_PRODUTO , EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE ');
  vListAux.Add('       INNER JOIN TFOLLOWUP F ( NOLOCK ) ON PR.NR_PROCESSO = F.NR_PROCESSO AND F.CD_EVENTO = ''141'' ');
  vListAux.Add('       INNER JOIN TPROCESSO_EXP_NF NF ( NOLOCK ) ON PR.NR_PROCESSO = NF.NR_PROCESSO ');
  vListAux.Add('       INNER JOIN TPROCESSO_EXP_RE RE ( NOLOCK ) ON PR.NR_PROCESSO = RE.NR_PROCESSO ');
  vListAux.Add('WHERE  PR.IN_CANCELADO = ''0''');
  vListAux.Add('  AND  PR.CD_UNID_NEG  = ' + QuotedStr(msk_cd_unid_neg.Text));
  vListAux.Add('  AND  PR.CD_PRODUTO   = ''02'' AND ISNULL(F.DT_REALIZACAO, '''') <> '''' ');
  vListAux.Add('  AND  EN.CD_GRUPO     = ''002'' ');
  vListAux.Add(' GROUP BY SUBSTRING(PR.NR_PROCESSO, 5, 14), PR.CD_UNID_NEG, PR.CD_PRODUTO , EN.NM_EMPRESA, DT_ABERTURA ');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO_ABR', 'CD_UNID_NEG', 'CD_PRODUTO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Unidade', 'Produto', 'Cliente', 'Data de Abertura'],'NR_PROCESSO_ABR', nil);
  vListAux.Free;
end;

procedure TfrmIntegraBASF85.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1, msk_cd_unid_neg.Text);
    msk_cd_unid_negExit(nil);
  End
  Else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');

end;

procedure TfrmIntegraBASF85.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_F5 then
 begin
   if Sender = msk_cd_unid_neg  then btn_co_unid_negClick(btn_co_unid_neg);
   if Sender = msk_nr_processo  then btn_co_processoClick(btn_co_processo);
 end;
end;

procedure TfrmIntegraBASF85.msk_cd_unid_negExit(Sender: TObject);
begin
  msk_cd_unid_neg.text := Copy('00', 1, 2 - Length(msk_cd_unid_neg.text)) + msk_cd_unid_neg.text;
  edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
  if edt_nm_unid_neg.Text = '' then
  begin
    MessageBox(0, 'Unidade de Negociação Inválida ou Inexistente!', 'MyIndaiá', 0);
  end;
end;

procedure TfrmIntegraBASF85.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
     btn_envio.Enabled := true;
end;

procedure TfrmIntegraBASF85.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;


end.
