unit uPeriodoProspeccao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ComObj, ShellApi, Funcoes, PGGP017, PGGP001;

type
  TFrmPeriodoProspeccao = class(TForm)
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    lbl_a: TLabel;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    procedure btn_iniciarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPeriodoProspeccao: TFrmPeriodoProspeccao;

implementation

{$R *.dfm}

uses
  PGDI018, dProcComerc;

procedure TFrmPeriodoProspeccao.btn_iniciarClick(Sender: TObject);
var
  Excel, xlWorkB, oSheet: OleVariant;
  vContGeradas, vContFechadas, vContDeclinadas, vCorLinha,
  I, vContEfetuados, vContPropostas, nLinha : Integer;

  procedure PintaBordas(vCol,vLinha : Integer);
  begin
    //TOP
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000008].Weight := $00000002;
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000008].Color  := clBlack;

    //Right
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$0000000A].Weight := $00000002;
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$0000000A].Color  := clBlack;

    //Left
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000007].Weight := $00000002;
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000007].Color  := clBlack;

    //Bottom
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000009].Weight := $00000002;
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000009].Color  := clBlack;
  end;
begin
  //relatorios/com ercial/prospecção de clientes
  if msk_dt_inicio.Date = 0 then
  begin
    BoxMensagem('Informe uma Data Inicial!', 2);
    msk_dt_inicio.SetFocus;
    Exit;
  end;
  if msk_dt_fim.Date = 0 then
  begin
    BoxMensagem('Informe uma Data Final!', 2);
    msk_dt_fim.SetFocus;
    Exit;
  end;

  if msk_dt_fim.Date < msk_dt_inicio.Date then
  begin
    BoxMensagem('Data Inicial deve ser maior que a Final!', 2);
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  try
    Excel := CreateOLEObject('Excel.Application');
    xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\Prospeccao.XLS' );
    Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\Prospeccao_' +
    Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
    oSheet := Excel.WorkBooks[1].Worksheets[1];

    vContEfetuados  := 0;
    vContPropostas  := 0;
    vContGeradas    := 0;
    vContFechadas   := 0;
    vContDeclinadas := 0;
    nLinha         := 12;
    oSheet.Cells[ 8, 1 ].Value := 'Resumo Geral de Prospecção';
    oSheet.Cells[ 9, 1 ].Value := 'Período ' + DateToStr(msk_dt_inicio.Date) + ' a ' + DateToStr(msk_dt_fim.Date);

    with datm_proc_comerc.SqlAux, datm_proc_comerc.SqlAux.Sql do
    begin
      Close;
      Clear;
      Add('SELECT');
      Add('case ISNULL(EN.AP_EMPRESA,'''') when '''' then EN.NM_EMPRESA');
      Add('else EN.AP_EMPRESA end NM_EMPRESA,');
      Add('PCH.* , V.NM_VENDEDOR, PC.DT_ABERTURA,');
      Add('case PCH.NM_HISTORICO when ''0'' then ''Visita'' when ''1'' then ''Telefone''');
      Add('when ''2'' then ''E-mail''	when ''3'' then ''Fax'' 	when ''4'' then ''Postagem''');
      Add('end as ACAO,');
      Add('(select count(*) from TAGENDA_COMERC where cd_agenda = PCH.CD_AGENDA) QTD_AGENDA,');
      Add('(select count(*) from TPROPOSTA where');
      Add(' DT_ABERTURA between :DT_INI and :DT_FIM and CD_EMPRESA = PC.CD_EMPRESA) QTD_PROPOSTAS,');
      Add('PR.CD_STATUS');
      Add('FROM TPROC_COMERC_HISTORICO PCH');
      Add('  LEFT JOIN TAGENDA_COMERC AC ON AC.CD_AGENDA = PCH.CD_AGENDA');
      Add('  LEFT JOIN TVENDEDOR    V    ON V.CD_VENDEDOR = AC.CD_VENDEDOR');
      Add('  LEFT JOIN TPROC_COMERC PC   ON PC.NR_PROC_COMERC = PCH.NR_PROC_COMERC');
      Add('  LEFT JOIN TEMPRESA_NAC EN   ON EN.CD_EMPRESA = PC.CD_EMPRESA');
      Add('  LEFT JOIN TPROPOSTA    PR   ON PR.NR_PROPOSTA = PCH.NR_PROC_COMERC');
      Add('WHERE PCH.DT_HISTORICO between :DT_INI and :DT_FIM');
      Add('ORDER BY PC.CD_EMPRESA');
      ParamByName('DT_INI').AsDateTime := msk_dt_inicio.DateTime;
      ParamByName('DT_FIM').AsDateTime := msk_dt_fim.DateTime;
      Open;
      while not EOF do
      begin
        if FieldByName('CD_STATUS').AsString = '0' then    //Aprovada
        begin
          vCorLinha := 4;
          Inc(vContFechadas);
        end
        else if FieldByName('CD_STATUS').AsString = '1' then    //Aguardando aprovação
        begin
          vCorLinha := 27;
          Inc(vContGeradas);
        end
        else if FieldByName('CD_STATUS').AsString = '3' then    //Rejeitada
        begin
          vCorLinha := 3;
          Inc(vContDeclinadas);
        end
        else
          vCorLinha := 0;


        oSheet.Cells[ nLinha, 1 ].Value := FieldByName('NM_EMPRESA').AsString;  //Empresa
        //oSheet.Cells[ nLinha, 1].Font.ColorIndex := 2;
        oSheet.Cells[ nLinha, 2 ].Value := FieldByName('DT_ABERTURA').AsString;  //data
        oSheet.Cells[ nLinha, 3 ].Value := FieldByName('ACAO').AsString;  //ação
        oSheet.Cells[ nLinha, 4 ].Value := FieldByName('NM_HIST_REDUZIDO').AsString;  //status
        oSheet.Cells[ nLinha, 5 ].Value := FieldByName('QTD_AGENDA').AsString;  //Contatos Efetuados
        oSheet.Cells[ nLinha, 6 ].Value := FieldByName('QTD_PROPOSTAS').AsString; //Cotações/ Propostas Geradas
        oSheet.Cells[ nLinha, 7 ].Value := FieldByName('NM_VENDEDOR').AsString; //colaborador

        oSheet.Cells[ nLinha, 1 ].Interior.ColorIndex := vCorLinha;
        oSheet.Cells[ nLinha, 2 ].Interior.ColorIndex := vCorLinha;
        oSheet.Cells[ nLinha, 3 ].Interior.ColorIndex := vCorLinha;
        oSheet.Cells[ nLinha, 4 ].Interior.ColorIndex := vCorLinha;
        oSheet.Cells[ nLinha, 5 ].Interior.ColorIndex := vCorLinha;
        oSheet.Cells[ nLinha, 6 ].Interior.ColorIndex := vCorLinha;
        oSheet.Cells[ nLinha, 7 ].Interior.ColorIndex := vCorLinha;


        //Bordas
        for I := 1 to 7 do
          PintaBordas(I, nLinha);


        Next;
        Inc(nLinha);

        vContEfetuados := vContEfetuados + FieldByName('QTD_AGENDA').AsInteger;
        vContPropostas := vContPropostas + FieldByName('QTD_PROPOSTAS').AsInteger;
      end;
    end;

    Inc(nLinha);
    oSheet.Cells[nLinha, 1].Value := 'Total de Prospecção';
    PintaBordas (1, nLinha);
    PintaBordas (2, nLinha);
    PintaBordas (3, nLinha);
    PintaBordas (4, nLinha);
    oSheet.Cells[nLinha, 5].Value := IntToStr(vContEfetuados);
    PintaBordas (5, nLinha);
    oSheet.Cells[nLinha, 6].Value := IntToStr(vContPropostas);
    PintaBordas (6, nLinha);
    PintaBordas (7, nLinha);
    Inc(nLinha);
    oSheet.Cells[ nLinha, 1 ].Value := 'Indíce em %';
    PintaBordas (1, nLinha);
    PintaBordas (2, nLinha);
    PintaBordas (3, nLinha);
    PintaBordas (4, nLinha);
    PintaBordas (5, nLinha);
    oSheet.Cells[ nLinha, 6 ].Value := FormatFloat('#,##0.00',(vContPropostas/vContEfetuados) * 100);
    PintaBordas (6, nLinha);
    PintaBordas (7, nLinha);
    Inc(nLinha);
    Inc(nLinha);
    oSheet.Cells[ nLinha, 1 ].Value := 'Resumo';
    PintaBordas (1, nLinha);
//    PintaBordas (2, nLinha);
//    PintaBordas (3, nLinha);

    Inc(nLinha);
    oSheet.Cells[ nLinha, 1 ].Value := 'Cotações Geradas';
    oSheet.Cells[ nLinha, 3 ].Value := IntToStr(vContPropostas);
    PintaBordas (1, nLinha);
    PintaBordas (2, nLinha);
    PintaBordas (3, nLinha);
    Inc(nLinha);
    oSheet.Cells[ nLinha, 1 ].Value := 'Cotações Fechadas';
    oSheet.Cells[ nLinha, 3 ].Value := IntToStr(vContFechadas);
    PintaBordas (1, nLinha);
    PintaBordas (2, nLinha);
    PintaBordas (3, nLinha);
    Inc(nLinha);
    oSheet.Cells[ nLinha, 1 ].Value := 'Cotações Declinadas';
    oSheet.Cells[ nLinha, 3 ].Value := IntToStr(vContDeclinadas);
    PintaBordas (1, nLinha);
    PintaBordas (2, nLinha);
    PintaBordas (3, nLinha);

    nLinha := nLinha + 2;
    oSheet.Cells[ nLinha, 1 ].Value := 'STATUS';
    PintaBordas (1, nLinha);
//    PintaBordas (2, nLinha);

    Inc(nLinha);
    oSheet.Cells[ nLinha, 1 ].Value := 'Fechado (Verde)';
    oSheet.Cells[ nLinha, 2 ].Interior.ColorIndex := 4;
    PintaBordas (1, nLinha);
    PintaBordas (2, nLinha);
    Inc(nLinha);
    oSheet.Cells[ nLinha, 1 ].Value := 'Em análise (Laranja)';
    oSheet.Cells[ nLinha, 2 ].Interior.ColorIndex := 27;
    PintaBordas (1, nLinha);
    PintaBordas (2, nLinha);
    Inc(nLinha);
    oSheet.Cells[ nLinha, 1 ].Value := 'Declinado (Vermelho)';
    oSheet.Cells[ nLinha, 2 ].Interior.ColorIndex := 3;
    PintaBordas (1, nLinha);
    PintaBordas (2, nLinha);


    //PLAN 3
    oSheet := Excel.WorkBooks[1].Worksheets[3];
    oSheet.Cells[ 10, 1 ].Value := 'Período ' + DateToStr(msk_dt_inicio.Date) + ' a ' + DateToStr(msk_dt_fim.Date);

    //Dados Vendedores
    oSheet.Cells[ 11, 5 ].Value := 5; //
    oSheet.Cells[ 11, 6 ].Value := 10; //
    oSheet.Cells[ 11, 7 ].Value := 15; //

    oSheet.Cells[ 12, 5 ].Value := 3; //
    oSheet.Cells[ 12, 6 ].Value := 6; //
    oSheet.Cells[ 12, 7 ].Value := 9; //


    //Prospecções
    oSheet.Cells[ 14, 4 ].Value := IntToStr(vContEfetuados); //Total de prospecção
    oSheet.Cells[ 15, 4 ].Value := IntToStr(vContPropostas); //Total de Cotações
    oSheet.Cells[ 16, 4 ].Value := 100; //Total de Visitas
    oSheet.Cells[ 17, 4 ].Value := FormatFloat('#,##0.00',(vContPropostas/vContEfetuados) * 100); //Indíce em %

    //RESUMO
    oSheet.Cells[ 19, 4 ].Value := IntToStr(vContPropostas);
    oSheet.Cells[ 20, 4 ].Value := IntToStr(vContFechadas);
    oSheet.Cells[ 21, 4 ].Value := IntToStr(vContDeclinadas);

    Excel.Visible := True;
  except
    Application.MessageBox('Verifique se a planilha já está aberta. Salve-a e feche-a!', 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
    Exit;
  end;
end;

procedure TFrmPeriodoProspeccao.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;
end;

end.
