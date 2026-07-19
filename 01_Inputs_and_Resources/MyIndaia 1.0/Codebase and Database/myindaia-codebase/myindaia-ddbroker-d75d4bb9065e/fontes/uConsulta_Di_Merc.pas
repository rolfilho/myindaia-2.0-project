unit uConsulta_Di_Merc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, ExtCtrls, ActiveX, ExcelXP, Excel2000;

type
  Tfrm_consulta_di_merc = class(TForm)
    PnlTopo: TPanel;
    btnSair: TSpeedButton;
    btnExcel: TSpeedButton;
    grpMercadoria: TGroupBox;
    mmoMercadoria: TMemo;
    lblTexto1: TLabel;
    lblTexto2: TLabel;
    qry_consulta_di_merc: TQuery;
    procedure btnExcelClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure mmoMercadoriaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consulta_di_merc: Tfrm_consulta_di_merc;

implementation

{$R *.dfm}

{ Tfrm_consulta_di_merc }

procedure Tfrm_consulta_di_merc.btnExcelClick(Sender: TObject);
var
  SQL, vArquivo, vSalvar, CodMercadoria : String;
  I, Where, Linha : Integer;
  CorFundo : Boolean;
  ExcelApp : TExcelApplication;
  ExcelWB  : TExcelWorkbook;
  ExcelWS  : TExcelWorksheet;
begin
  If Trim(mmoMercadoria.Lines.Text) = '' then
    begin
     ShowMessage('Insira um código de mercadoria válido!');
    end
    else
    begin
      try
        ExcelApp := TExcelApplication.Create(nil);
        ExcelWB  := TExcelWorkbook.Create(nil);
        ExcelWS  := TExcelWorksheet.Create(nil);
        Where := 0;
        Linha := 2;
        CorFundo := True;
        vArquivo := 'H:\DDBroker\Modelo_ConsultaDIMercadoria.xls';
        vSalvar  := ExtractFilePath(Application.ExeName) + 'ConsultaDI\';

        If not DirectoryExists(vSalvar) then
           CreateDir(vSalvar);

         SQL := qry_consulta_di_merc.SQL.Text;

        with qry_consulta_di_merc do
        begin
          for I := 0 to mmoMercadoria.Lines.Count -1 do
            begin
             If Trim(mmoMercadoria.Lines[I]) <> '' then
               begin
                 If Where = 0 then
                 begin
                      qry_consulta_di_merc.SQL.Add('WHERE DM.CD_MERCADORIA = '+QuotedStr(mmoMercadoria.Lines[I]));
                      Where := 1;
                 end
                 else
                 begin
                      qry_consulta_di_merc.SQL.Add('OR DM.CD_MERCADORIA = '+QuotedStr(mmoMercadoria.Lines[I]));
                 end
               end;
            end;
        end;

          qry_consulta_di_merc.SQL.Add('ORDER BY DM.CD_MERCADORIA');
          qry_consulta_di_merc.Open;


        If qry_consulta_di_merc.RecordCount > 0 then
        begin

        ExcelWB.ConnectTo(ExcelApp.Workbooks.Open(vArquivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0));
        ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] As ExcelWorksheet);

          while not qry_consulta_di_merc.Eof do
            begin

            If Trim(CodMercadoria) = '' then
              CodMercadoria := qry_consulta_di_merc.FieldbyName('CD_MERCADORIA').AsString
            else
            begin
              If CodMercadoria <> qry_consulta_di_merc.FieldbyName('CD_MERCADORIA').AsString then
              begin
                 CodMercadoria := qry_consulta_di_merc.FieldbyName('CD_MERCADORIA').AsString;
                 CorFundo := not CorFundo;
              end;
            end;

              ExcelWS.Range['A'+ IntToStr(Linha), 'A'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('NR_PROCESSO').AsString;
              ExcelWS.Range['B'+ IntToStr(Linha), 'B'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('CD_MERCADORIA').AsString;
              ExcelWS.Range['C'+ IntToStr(Linha), 'C'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('DT_REGISTRO_DI').AsString;
              ExcelWS.Range['D'+ IntToStr(Linha), 'D'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('NR_DECLARACAO_IMP').AsString;
              ExcelWS.Range['E'+ IntToStr(Linha), 'E'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('VL_UNITARIO').AsString;
              ExcelWS.Range['F'+ IntToStr(Linha), 'F'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('DT_REALIZACAO').AsString;
              ExcelWS.Range['G'+ IntToStr(Linha), 'G'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('PL_MERCADORIA').AsString;
              ExcelWS.Range['H'+ IntToStr(Linha), 'H'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('PAIS_ORIGEM').AsString;
              ExcelWS.Range['I'+ IntToStr(Linha), 'I'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('PAIS_AQUISICAO').AsString;
              ExcelWS.Range['J'+ IntToStr(Linha), 'J'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('QT_MERC_UN_COMERC').AsString;
              ExcelWS.Range['K'+ IntToStr(Linha), 'K'+ IntToStr(Linha)].Value2 := qry_consulta_di_merc.FieldByName('NCM').AsString;
              //ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Borders.[xlEdgeLeft].LineStyle := xlContinuous;
              //ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Borders[xlEdgeTop].LineStyle := xlContinuous;
              //ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
              //ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Borders[xlEdgeRight].LineStyle := xlContinuous;
              //ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Borders[xlInsideVertical].LineStyle := xlContinuous;
              //ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
              // Comentado acima e utilizando abaixo, porque no excel 2003 gerva problema - Michel - 12/07/2012
              ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;


            If CorFundo = True then
              begin
                ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Interior.Color := 16776960;  // Turquesa (O azul da camisa nova do Santos)
              end
              else
              begin
                ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                ExcelWS.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Interior.Color := 11711154; //Cinza escuro
              end;
                Inc(Linha);
                qry_consulta_di_merc.Next;
            end;
        end
        else
        if qry_consulta_di_merc.RecordCount = 0 then
        begin
          Showmessage('Não foi possível gerar o relatório, pois não foram encontradas DIs com os parâmetros selecionados.');
          ExcelWS.Disconnect;
          ExcelWB.Disconnect;
          ExcelApp.Disconnect;
          FreeAndNil(ExcelWS);
          FreeAndNil(ExcelWB);
          FreeAndNil(ExcelApp);
          qry_consulta_di_merc.Close;
          qry_consulta_di_merc.SQL.Text := SQL;
          Exit;
        end;


         If FileExists(vSalvar + 'Consulta_'+FormatDateTime('ddmmyy_hhmm', Now)+'.xls') then
          DeleteFile(vSalvar + 'Consulta_'+FormatDateTime('ddmmyy_hhmm', Now)+'.xls');


          ExcelApp.Visible[1] := True;
          ExcelWS.Disconnect;
          ExcelWB.Disconnect;
          ExcelApp.Disconnect;
          FreeAndNil(ExcelWS);
          FreeAndNil(ExcelWB);
          FreeAndNil(ExcelApp);
          qry_consulta_di_merc.Close;
          qry_consulta_di_merc.SQL.Text := SQL;

          Exit;
    except
      on E: Exception do
      begin
          ExcelWS.Disconnect;
          ExcelWB.Close(False);
          ExcelWB.Disconnect;
          ExcelApp.Quit;
          FreeAndNil(ExcelWS);
          FreeAndNil(ExcelWB);
          FreeAndNil(ExcelApp);
          qry_consulta_di_merc.Close;
          qry_consulta_di_merc.SQL.Text := SQL;
          ShowMessage('Erro ao gerar relatório! Tente novamente.'+#13#10+'Caso o erro persista, informe o departamento de TI.'#13#13 + E.Message);
          Exit;
      end;
    end;
  end;
end;

procedure Tfrm_consulta_di_merc.btnSairClick(Sender: TObject);
begin
       If MessageDlg('Tem certeza de que deseja sair?', mtWarning, [mbYes, mbNo], 0) = mrYes then
           Close;
end;

procedure Tfrm_consulta_di_merc.mmoMercadoriaChange(Sender: TObject);
begin
     If Trim(mmoMercadoria.Text) <> '' then
         btnExcel.Enabled := True
     else
         btnExcel.Enabled := False;

end;

end.
