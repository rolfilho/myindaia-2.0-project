unit PGBF003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Grids, DBGrids, Buttons, DBTables, StdCtrls;

type
  Tfrm_exp_leitura_nf = class(TForm)
    pgctrl_integra: TPageControl;
    tb_integra: TTabSheet;
    Bevel1: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnl_status: TPanel;
    Panel3: TPanel;
    Bevel3: TBevel;
    btn_importar_nf_exp: TSpeedButton;
    btn_sair: TSpeedButton;
    Label1: TLabel;
    edt_nm_file: TEdit;
    btn_file: TSpeedButton;
    OpenFile: TOpenDialog;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_fileClick(Sender: TObject);
    procedure edt_nm_fileExit(Sender: TObject);
    procedure btn_importar_nf_expClick(Sender: TObject);
    procedure edt_nm_fileKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function TiraZero( cNumero : String ) : String;

  public
    { Public declarations }
  end;

var
  frm_exp_leitura_nf: Tfrm_exp_leitura_nf;

implementation

uses PGGP001, PGBF004, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_exp_leitura_nf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_exp_leitura_nf.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_exp_leitura_nf, datm_exp_leitura_nf);

end;

procedure Tfrm_exp_leitura_nf.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var i: Integer;
begin
  for i := 0 to datm_exp_leitura_nf.ComponentCount - 1 do
  begin
     if datm_exp_leitura_nf.Components[i] is TQuery then
       ( datm_exp_leitura_nf.Components[i] as TQuery ).Close;
     if datm_exp_leitura_nf.Components[i] is TTable then
       ( datm_exp_leitura_nf.Components[i] as TTable ).Close;
  end;
end;


procedure Tfrm_exp_leitura_nf.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_exp_leitura_nf.btn_fileClick(Sender: TObject);
begin
  if OpenFile.Execute then edt_nm_file.text :=
     OpenFile.FileName;
  edt_nm_fileExit( nil );
end;

procedure Tfrm_exp_leitura_nf.edt_nm_fileExit(Sender: TObject);
begin
  if edt_nm_file.text = '' then
  begin
     pnl_status.Caption := 'Informe um nome para o arquivo a ser lido, e clique em importar dados...';
     Exit;
  end;
  if FileExists( edt_nm_file.text ) then
  pnl_status.Caption := 'Clique em importar dados...'
  else
  begin
    BoxMensagem('O arquivo não existe.',2);
    edt_nm_file.SetFocus;
  end;
end;


procedure Tfrm_exp_leitura_nf.btn_importar_nf_expClick(Sender: TObject);
var f: TextFile;
    reg: String;
    nr_pe : String[10];
    nr_processo: String[18];
begin
   nr_pe := '';
   nr_processo := '';
   if not FileExists( edt_nm_file.text ) then
   begin
     BoxMensagem('O arquivo não existe ou não foi informado corretamente.',2);
     Exit;
   end
   else
   begin
     AssignFile( f, edt_nm_file.text );
     {$i-}
     Reset( f );
     {$i+}
     if ioResult <> 0 then
     begin
       BoxMensagem( 'Não foi possível abrir o arquivo especificado.', 2 );
       Exit;
     end
     else
     begin
       while not EOF( f ) do
       begin

         ReadLn( f, reg );

         if Copy( reg, 1, 1 ) = '1' then
         begin
           nr_pe := Copy( reg, 19, 10 );
           datm_exp_leitura_nf.qry_exp_itens_.Close;
           datm_exp_leitura_nf.qry_exp_itens_.ParamByName('NR_PROC_PE').AsString := Copy( reg, 19, 10 );
           datm_exp_leitura_nf.qry_exp_itens_.Prepare;
           datm_exp_leitura_nf.qry_exp_itens_.Open;

           if Trim(datm_exp_leitura_nf.qry_exp_itens_NR_PROC_PE.AsString) <> Trim( Copy( reg, 19, 10 ) ) then
              Continue;
         end;

         try
           datm_main.db_broker.StartTransaction;

           with datm_exp_leitura_nf do
           begin
             nr_processo := qry_exp_itens_NR_PROCESSO.AsString;
             if Copy( reg, 1,1 ) = '1' then
             begin
               qry_exp_nf_.Close;
               qry_exp_nf_.ParamByName('NR_PROCESSO').AsString := qry_exp_itens_NR_PROCESSO.AsString;
               qry_exp_nf_.ParamByName('NR_NF').AsString       := Copy( reg, 13, 6 );
               qry_exp_nf_.Prepare;
               qry_exp_nf_.Open;

               if qry_exp_nf_.EOF then
               begin
                 qry_exp_nf_.Append;
                 qry_exp_nf_NR_PROCESSO.AsString := qry_exp_itens_NR_PROCESSO.AsString;
                 qry_exp_nf_NR_NF.AsString       := Copy( reg, 13, 6 );
                 qry_exp_nf_.Post;
               end;
             end
             else if Copy( reg, 1,1 ) = '2' then
             begin
               qry_exp_merc_.Close;
               qry_exp_merc_.ParamByName('NR_PROCESSO').AsString := qry_exp_itens_NR_PROCESSO.AsString;
               qry_exp_merc_.ParamByName('CD_MERCADORIA').AsString := Copy( reg, 19, 18 );
               qry_exp_merc_.Open;

               if not (qry_exp_merc_.EOF) then
               begin
                 qry_exp_nf_itens_.Close;
                 qry_exp_nf_itens_.ParamByName( 'NR_PROCESSO').AsString := qry_exp_merc_NR_PROCESSO.AsString;
                 qry_exp_nf_itens_.ParamByName( 'NR_NF').AsString       := Copy( reg, 13, 6 );
                 qry_exp_nf_itens_.ParamByName( 'NR_ITEM').AsString     := qry_exp_merc_NR_ITEM.AsString;
                 qry_exp_nf_itens_.Prepare;
                 qry_exp_nf_itens_.Open;

                 if qry_exp_nf_itens_.EOF then
                 begin
                   qry_exp_nf_itens_.Append;
                   qry_exp_nf_itens_NR_PROCESSO.AsString := qry_exp_merc_NR_PROCESSO.AsString;
                   qry_exp_nf_itens_NR_NF.AsString       := Copy( reg, 13, 6 );
                   qry_exp_nf_itens_NR_ITEM.AsString     := qry_exp_merc_NR_ITEM.AsString;
                   qry_exp_nf_itens_.Post;
                 end;
               end;
             end;
           end;
           datm_main.db_broker.Commit;

         except
           on E: Exception do
            begin
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
         end;
       end;

       BoxMensagem( 'Importação de dados executada com sucesso!' + #13#10 +
                    'Pedido: ' + nr_pe + ' - Processo: ' + nr_processo, 3 );
       edt_nm_file.Text := '';

     end;

     CloseFile(f);

   end;

end;


procedure Tfrm_exp_leitura_nf.edt_nm_fileKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = edt_nm_file then btn_fileClick(nil);
  end;
end;


procedure Tfrm_exp_leitura_nf.FormShow(Sender: TObject);
begin
  edt_nm_file.SetFocus;

end;


function Tfrm_exp_leitura_nf.TiraZero( cNumero : String ) : String;
begin
  while Pos('0',cNumero) > 0 do
    cNumero := TrocaStr( cNumero, ' ', Pos( '0', cNumero ) );

  TiraZero := Alltrim( cNumero )
end;


end.

