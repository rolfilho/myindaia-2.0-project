unit uWalletImpressaoNumerarioExpo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, RLReport, dxGDIPlusClasses,
  RLFilters, RLPDFFilter;

type
  TfrmWalletImpressaoNumerarioExpo = class(TformMyForm)
    RLReport1: TRLReport;
    RLPDFFilter1: TRLPDFFilter;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText13: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel23: TRLLabel;
    RLDBText14: TRLDBText;
    RLBand2: TRLBand;
    RLImage1: TRLImage;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLBand5: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel26: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLPanel2: TRLPanel;
    RLLabel27: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel31: TRLLabel;
    RLPanel3: TRLPanel;
    RLLabel28: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel32: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLGroup2: TRLGroup;
    RLBand3: TRLBand;
    RLDBText19: TRLDBText;
    RLLabel12: TRLLabel;
    RLBand4: TRLBand;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLBand6: TRLBand;
    RLPanel4: TRLPanel;
    RLDBResult3: TRLDBResult;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
   class procedure Execute(ids : string);overload;
   class procedure Execute(ids : string; nomearquivo, processo : string); overload;
   class procedure Execute(ids : string; nomearquivo, email_para, email_copia, email_assunto, email_corpo : string); overload;
  end;

var
  frmWalletImpressaoNumerarioExpo: TfrmWalletImpressaoNumerarioExpo;

implementation

uses
  ConnectionModuleV2, FrMain, ConnectionModule, GravaArquivoDigitalizacao;

{$R *.dfm}

class procedure TfrmWalletImpressaoNumerarioExpo.Execute(ids :string);
var
  form: TfrmWalletImpressaoNumerarioExpo;
begin
  form := TfrmWalletImpressaoNumerarioExpo.Create(nil);
  try
    if FireDacMSSQLV2(sUsuario).AbrirQueryRelatorioNumerario(ids) > 0 then
      form.RLReport1.Preview
  finally
    form.Free;
    FireDacMSSQLV2(sUsuario).FecharQueryRelatorioNumerario;
  end;
end;

class procedure TfrmWalletImpressaoNumerarioExpo.Execute(ids : string; nomearquivo, processo : string);
var
  form: TfrmWalletImpressaoNumerarioExpo;
  resultadoDigitalizacao : string;
begin
  form := TfrmWalletImpressaoNumerarioExpo.Create(nil);
  try
    if FireDacMSSQLV2(sUsuario).AbrirQueryRelatorioNumerario(ids) > 0 then
    begin
      form.RLPDFFilter1.FileName := NomeArquivo;
      form.RLReport1.SaveToFile(NomeArquivo);

      resultadoDigitalizacao := GravaArquivo(FireDacMSSQL.Connection,
                                             NomeArquivo,
                                             processo, 'Numerário - ' + ids,
                                             148,
                                             true);

      Application.MessageBox(PWideChar(resultadoDigitalizacao), 'Atenção!', MB_OK);
    end;
  finally
    form.Free;
    FireDacMSSQLV2(sUsuario).FecharQueryRelatorioNumerario;
  end;
end;

class procedure TfrmWalletImpressaoNumerarioExpo.Execute(ids : string;
 nomearquivo, email_para, email_copia, email_assunto, email_corpo : string);
var
  form: TfrmWalletImpressaoNumerarioExpo;
begin
  form := TfrmWalletImpressaoNumerarioExpo.Create(nil);
  try
    if FireDacMSSQLV2(sUsuario).AbrirQueryRelatorioNumerario(ids) > 0 then
    begin
      form.RLPDFFilter1.FileName := NomeArquivo;
      form.RLReport1.SaveToFile(NomeArquivo);
      if FireDacMSSQL.EnviaEmail('ti@myindaia.com.br',
                              [email_para] ,
                              [email_copia],
                              [],
                              email_assunto,
                              email_corpo,
                              [NomeArquivo]) then
        Application.MessageBox(PWideChar('E-mail enviado.'), 'Atenção!', MB_OK)
      else
        Application.MessageBox(PWideChar('Erro enviando e-mail.'), 'Atenção!', MB_OK);
    end;
  finally
    form.Free;
    FireDacMSSQLV2(sUsuario).FecharQueryRelatorioNumerario;
  end;
end;

end.
