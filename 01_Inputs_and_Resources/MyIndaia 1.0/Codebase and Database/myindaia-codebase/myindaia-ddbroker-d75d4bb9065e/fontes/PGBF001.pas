unit PGBF001;

// Remessa de Exportacao 

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Grids, DBGrids, Buttons, DBTables, StdCtrls, Db,
  Menus, Funcoes;

type
  Tfrm_integra_basf = class(TForm)
    pgctrl_integra: TPageControl;
    tb_remessas: TTabSheet;
    Bevel1: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnl_status_remessa: TPanel;
    Panel3: TPanel;
    Bevel3: TBevel;
    btn_importar_remessa: TSpeedButton;
    btn_sair: TSpeedButton;
    Label1: TLabel;
    edt_nm_file_remessa: TEdit;
    btn_file_remessa: TSpeedButton;
    OpenFile: TOpenDialog;
    mi_integra_basf: TMainMenu;
    mi_importar_remessa: TMenuItem;
    mi_sair: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_file_remessaClick(Sender: TObject);
    procedure edt_nm_file_remessaExit(Sender: TObject);
    procedure btn_importar_remessaClick(Sender: TObject);
    procedure edt_nm_file_remessaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    // Private declarations
    function UltCod_( cod_emp: String; size: Integer ): String;
    function ViaTransporte( cd_via : String ): String;
    function TiraZero( cNumero : String ) : String;

  public
    // Public declarations 
  end;

var
  frm_integra_basf: Tfrm_integra_basf;

implementation

uses PGGP001, PGBF002, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_integra_basf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_integra_basf.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_integra_basf, datm_integra_basf);
end;

procedure Tfrm_integra_basf.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var i: Integer;
begin
  for i := 0 to datm_integra_basf.ComponentCount - 1 do
  begin
     if datm_integra_basf.Components[i] is TQuery then
       ( datm_integra_basf.Components[i] as TQuery ).Close;
     if datm_integra_basf.Components[i] is TTable then
       ( datm_integra_basf.Components[i] as TTable ).Close;
  end;
end;


procedure Tfrm_integra_basf.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integra_basf.btn_file_remessaClick(Sender: TObject);
begin
  if OpenFile.Execute then edt_nm_file_remessa.Text := OpenFile.FileName;
  edt_nm_file_remessaExit( nil );
end;

procedure Tfrm_integra_basf.edt_nm_file_remessaExit(Sender: TObject);
begin
  if edt_nm_file_remessa.Text = '' then
  begin
     pnl_status_remessa.Caption := 'Informe um nome para o arquivo a ser lido, e clique em importar dados...';
     Exit;
  end;
  if FileExists( edt_nm_file_remessa.text ) then
  begin
    pnl_status_remessa.Caption := 'Clique em importar dados...';
  end
  else
  begin
    BoxMensagem('O arquivo não existe.',2);
    edt_nm_file_remessa.SetFocus;
  end;
end;

function Tfrm_integra_basf.UltCod_( cod_emp: String; size: Integer ): String;
var cod_emp_int: Integer;
begin
  cod_emp_int := StrtoInt( cod_emp );
  INC( cod_emp_int );
  cod_emp := InttoStr( cod_emp_int );
  while length( cod_emp ) < Size do cod_emp := '0' + cod_emp;

  UltCod_ := cod_emp;
end;

procedure Tfrm_integra_basf.btn_importar_remessaClick(Sender: TObject);
var f: TextFile;
    reg: String;
    nr_item_int, i: Integer;
    nr_item_str: String;
    cExportador : String[5];
    cGrupoExportador : String[3];
    CodMercadoria, CodMercadoriaRed : String[30];
    nNum1, nNum2, nNum3 : Double;
begin
  with datm_integra_basf do
  begin
    if Not FileExists( edt_nm_file_remessa.Text ) then
    begin
      BoxMensagem('O arquivo não existe ou não foi informado corretamente.',2);
      Exit;
    end
    else
    begin
      AssignFile( f, edt_nm_file_remessa.text );
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
        cExportador := '';

        while Not EOF( f ) do
        begin
          ReadLn( f, reg );

          if Copy( reg, 1,1 ) = '1' then
          begin
            qry_pe_capa_.Close;
            qry_pe_capa_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
            qry_pe_capa_.ParamByName('NR_PROCESSO').AsString := Copy( reg, 6, 10 );
            qry_pe_capa_.Open;

            if Trim( qry_pe_capa_NR_PROCESSO.AsString ) = Copy( reg, 6, 10 ) then
            begin
              if BoxMensagem( 'Processo já existente !! ' + chr(13)+chr(10) + 'Deseja sobrepor ?', 1 ) then
              begin
                qry_pe_capa_.Close;

                qry_limpa_.Close;
                qry_limpa_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
                qry_limpa_.ParamByName('NR_PROCESSO').AsString := Copy( reg, 6, 10 );
                qry_limpa_.ExecSQL;
                qry_limpa_.Close;

                qry_pe_capa_.ParamByName('NR_PROCESSO').AsString := Copy( reg, 6, 10 );
                qry_pe_capa_.Prepare;
                qry_pe_capa_.Open;
              end
              else
                Exit;
            end;

            qry_pe_capa_.Edit;
            qry_pe_capa_NR_PROCESSO.AsString := Copy( reg, 6, 10 );

            // DT. ABERTURA 
            if qry_pe_capa_DT_REGISTRO_PEDIDO.IsNull then
               qry_pe_capa_DT_REGISTRO_PEDIDO.AsDateTime := StrToDate( DateToStr( Date ) );

            // UNIDADE DE NEGOCIO 
            qry_pe_capa_CD_UNID_NEG.AsString := str_cd_unid_neg;

            // Consignatario
            qry_empresa_est_.Close;
            qry_empresa_est_.ParamByName('NM_EMPRESA').AsString := Copy( Reg, 16, 35 );
            qry_empresa_est_.Open;
            if ( qry_empresa_est_.EOF ) and ( Trim( Copy( reg, 16, 35 ) ) <> '' ) then
            begin
              qry_ult_cod_emp_est_.Close;
              qry_ult_cod_emp_est_.Open;
              qry_empresa_est_.Append;
              qry_empresa_est_IN_IMPORTADOR.AsBoolean := True;
              qry_empresa_est_CD_EMPRESA.AsString := UltCod_( qry_ult_cod_emp_est_ULTCOD.AsString, qry_ult_cod_emp_est_ULTCOD.Size );
              qry_ult_cod_emp_est_.Close;
              qry_empresa_est_NM_EMPRESA.AsString := Copy( reg, 16, 35 );
              qry_empresa_est_.Post;
            end;
            qry_pe_capa_TP_CONSIGNATARIO.AsString := '0';
            qry_pe_capa_CD_CONSIGNATARIO.AsString := qry_empresa_est_CD_EMPRESA.AsString;

            // IMPORTADOR 
            qry_empresa_est_.Close;
            qry_empresa_est_.ParamByName('NM_EMPRESA').AsString := Copy( reg, 51, 35 );
            qry_empresa_est_.Open;
            if ( qry_empresa_est_.EOF ) and ( Trim( Copy( reg, 51, 35 ) ) <> '' ) then
            begin
              qry_ult_cod_emp_est_.Close;
              qry_ult_cod_emp_est_.Open;
              qry_empresa_est_.Append;
              qry_empresa_est_IN_IMPORTADOR.AsBoolean := True;
              qry_empresa_est_CD_EMPRESA.AsString := UltCod_( qry_ult_cod_emp_est_ULTCOD.AsString, qry_ult_cod_emp_est_ULTCOD.Size );
              qry_ult_cod_emp_est_.Close;
              qry_empresa_est_NM_EMPRESA.AsString := Copy( reg, 51, 35 );
              qry_empresa_est_.Post;
            end;
            qry_pe_capa_CD_IMPORTADOR.AsString := qry_empresa_est_CD_EMPRESA.AsString;

            // AGENTE 
            qry_empresa_est_.Close;
            qry_empresa_est_.ParamByName('NM_EMPRESA').AsString := Copy( reg, 121, 35 );
            qry_empresa_est_.Open;
            if ( qry_empresa_est_.EOF) and ( Trim( Copy( reg, 121, 35 ) ) <> '' ) then
            begin
              qry_ult_cod_emp_est_.Close;
              qry_ult_cod_emp_est_.Open;
              qry_empresa_est_.Append;
              qry_empresa_est_IN_AGENTE.AsBoolean := True;
              qry_empresa_est_CD_EMPRESA.AsString := UltCod_( qry_ult_cod_emp_est_ULTCOD.AsString, qry_ult_cod_emp_est_ULTCOD.Size );
              qry_ult_cod_emp_est_.Close;
              qry_empresa_est_NM_EMPRESA.AsString := Copy( reg, 121, 35 );
              qry_empresa_est_.Post;
            end;
            qry_pe_capa_CD_AGENTE.AsString := qry_empresa_est_CD_EMPRESA.AsString;

            // PESO BRUTO 
            qry_pe_capa_VL_PESO_BRUTO.AsFloat := StrtoFloat( Copy( reg, 156, 12 ) + ',' + Copy( reg, 168, 3 ) );

            // PESO LIQUIDO 
            qry_pe_capa_VL_PESO_LIQUIDO.AsFloat := StrtoFloat( Copy( reg, 171, 12 ) + ',' + Copy( reg, 183, 3 ) );

            // MOEDA 
            qry_de_para_.Close;
            qry_de_para_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
            qry_de_para_.ParamByName('CD_TABELA').AsString := '02';
            qry_de_para_.ParamByName('CD_EXTERNO').AsString := Trim(Copy( reg, 186,5 ));
            qry_de_para_.Prepare;
            qry_de_para_.Open;
            if Not ( qry_de_para_.EOF ) then
              qry_pe_capa_CD_MOEDA.AsString := qry_de_para_CD_DDBROKER.AsString;

            // VIA DE TRANSPORTE 
            qry_pe_capa_CD_VIA_TRANSPORTE.AsString := ViaTransporte( Copy( reg, 191, 1 ) );

            // INCOTERM 
            qry_pe_capa_CD_INCOTERM.AsString := copy( reg, 211, 3 );

            // FRETE 
            qry_pe_capa_VL_FRETE.AsFloat := StrtoFloat( Copy( reg, 214, 11 ) + ',' + Copy( reg, 225, 2 ) );

            // SEGURO 
            qry_pe_capa_VL_SEGURO.AsFloat := StrtoFloat( Copy( reg, 227, 11 ) + ',' + Copy( reg, 238, 2 ));

            // CGC DA EMPRESA - SEMPRE A MATRIZ 
            qry_cgc1_.Close;
            qry_cgc1_.ParamByName('CGC_EMPRESA').AsString := Copy( reg, 240, 8 ) + '0001';
            qry_cgc1_.Prepare;
            qry_cgc1_.Open;

            if Trim( qry_cgc1_CGC_EMPRESA.AsString ) <> '' then
            begin
              qry_pe_capa_CD_EXPORTADOR.AsString := qry_cgc1_CD_EMPRESA.AsString;
              cExportador                        := qry_cgc1_CD_EMPRESA.AsString;
              cGrupoExportador                   := qry_cgc1_CD_GRUPO.AsString;

              qry_cgc2_.Close;
              qry_cgc2_.ParamByName('CGC_EMPRESA').AsString := Copy( qry_cgc1_CGC_EMPRESA.AsString, 1, 10 ) + Copy( reg, 248, 4 );
              qry_cgc2_.Prepare;
              qry_cgc2_.Open;

              if Trim( qry_cgc2_CGC_EMPRESA.AsString ) <> '' then
                 qry_pe_capa_CD_FABRICANTE.AsString := qry_cgc2_CD_EMPRESA.AsString;
            end;
            qry_pe_capa_.Post;

          end
          else if Copy( reg, 1, 1 ) = '2' then
          begin
            qry_pe_itens_.Close;
            qry_pe_itens_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
            qry_pe_itens_.ParamByName('NR_PROCESSO').AsString := Copy( reg, 6, 10 );
            qry_pe_itens_.Open;

            qry_pe_itens_total_.Close;
            qry_pe_itens_total_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
            qry_pe_itens_total_.ParamByName('NR_PROCESSO').AsString := Copy( reg, 6, 10 );
            qry_pe_itens_total_.Open;

            nr_item_int := qry_pe_itens_total_TOTAL.AsInteger;
            Inc( nr_item_int );
            nr_item_str := InttoStr( nr_item_int );

            while length( nr_item_str ) < 3 do
              nr_item_str := '0' + nr_item_str ;

            qry_pe_itens_.Append;

            // PROCESSO 
            qry_pe_itens_NR_PROCESSO.AsString := Copy( reg, 6, 10 );

            // NR. ITEM 
            qry_pe_itens_NR_ITEM.AsString := nr_item_str;

            // UNIDADE DE NEGOCIO 
            qry_pe_itens_CD_UNID_NEG.AsString := str_cd_unid_neg;

            // QUANTIDADE 
            qry_pe_itens_QT_MERCADORIA.AsFloat := StrtoFloat( Copy( reg, 34, 10 ) + ',' + Copy( reg, 44, 3 ) );

            // QUANTIDADE INFERIOR 
            qry_pe_itens_QT_EMBALAGEM.AsFloat := StrtoFloat(Copy(reg, 47, 5));

            // VALOR UNITARIO 
            qry_pe_itens_VL_UNITARIO.AsFloat := StrtoFloat( Copy( reg, 52, 11 ) + ',' + Copy( reg, 63, 2 ) );

            // VALOR TOTAL 
            qry_pe_itens_VL_TOT_ITEM.AsFloat := qry_pe_itens_VL_UNITARIO.AsFloat *
                                                qry_pe_itens_QT_MERCADORIA.AsFloat;

            qry_pe_itens_VL_MLE.AsFloat := qry_pe_itens_VL_TOT_ITEM.AsFloat;
            qry_pe_itens_VL_MCV.AsFloat := qry_pe_itens_VL_TOT_ITEM.AsFloat;

            // VALOR FRETE
            qry_pe_itens_VL_FRETE.AsFloat := StrtoFloat( Copy( reg, 65, 11 ) + ',' + Copy( reg, 76, 2 ) );

            // PESO BRUTO
            qry_pe_itens_VL_TOT_PESO_BRUTO.AsFloat := StrtoFloat( Copy( reg, 106, 12 ) + ',' + Copy( reg, 118, 3 ) );

            // PESO LIQUIDO - TOTAL
            qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat := StrtoFloat( Copy( reg, 121, 12 ) + ',' + Copy( reg, 133, 3 ) );

            // PESO LIQUIDO - UNITARIO
            if ( qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat <> 0 ) and
               ( qry_pe_itens_QT_MERCADORIA.AsFloat   <> 0 ) then
            begin
              qry_pe_itens_VL_PESO_LIQ_UNIT.AsFloat := qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat /
                                                       qry_pe_itens_QT_MERCADORIA.AsFloat;
            end
            else
            begin
              qry_pe_itens_VL_PESO_LIQ_UNIT.AsFloat := 0;
            end;
            // NCM
            qry_pe_itens_CD_NCM.AsString := Copy( reg, 136, 4 ) + Copy( reg, 141, 2 ) + Copy( reg, 144, 2 );

            // MERCADORIA
            // Em 30/11/2006 o campo CD_MERCADORIA de exportação foi aumentado para 20, mas foi mantido
            // em 15 aqui pq o arquivo lido não foi alterado
            CodMercadoriaRed := '';
            try
              CodMercadoria := IntToStr( StrToInt( Copy( reg, 19, 15 ) ) );
            except
              CodMercadoria := Copy( reg, 19, 15 );
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

            qry_pe_itens_CD_MERCADORIA.AsString := CodMercadoria;
            qry_pe_itens_TX_MERCADORIA.AsString := Copy( reg, 152, 35 );

            // DESCRICAO DA MERCADORIA
            qry_merc_exp_.Close;
            qry_merc_exp_.ParamByName('CD_MERCADORIA').AsString := CodMercadoria;
            qry_merc_exp_.Prepare;
            qry_merc_exp_.Open;
            if qry_merc_exp_.EOF then
            begin
              try
                datm_main.db_broker.StartTransaction;
                qry_merc_exp_.Append;
                qry_merc_exp_CD_MERCADORIA.AsString   := qry_pe_itens_CD_MERCADORIA.AsString;
                qry_merc_exp_AP_MERCADORIA.AsString   := qry_pe_itens_CD_MERCADORIA.AsString;
                qry_merc_exp_VL_UNITARIO.AsFloat      := qry_pe_itens_VL_UNITARIO.asFloat;
                qry_merc_exp_QT_POR_EMBALAGEM.AsFloat := 1;
                qry_merc_exp_PL_MERCADORIA.AsFloat    := qry_pe_itens_VL_PESO_LIQ_UNIT.asFloat;
                qry_merc_exp_NM_MERCADORIA.AsString   := Copy( reg, 152, 35 );
                qry_merc_exp_CD_EXPORTADOR.AsString   := cExportador;
                qry_merc_exp_CD_GRUPO.AsString        := cGrupoExportador;
                qry_merc_exp_.Post;

                datm_main.db_broker.Commit;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end
            else
            begin
              try
                datm_main.db_broker.StartTransaction;
                qry_merc_exp_.Edit;
                if Trim( qry_merc_exp_NM_MERCADORIA.AsString ) = '' then
                   qry_merc_exp_NM_MERCADORIA.AsString := Copy( reg, 152, 35 );

                qry_merc_exp_.Post;
                datm_main.db_broker.Commit;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;

              if qry_pe_itens_CD_UNID_MEDIDA.AsString = '' then
                 qry_pe_itens_CD_UNID_MEDIDA.AsString := qry_merc_exp_CD_UN_MED_COMERC.AsString;

              if qry_pe_itens_CD_EMBALAGEM.AsString = '' then
                 qry_pe_itens_CD_EMBALAGEM.AsString := qry_merc_exp_CD_EMBALAGEM.AsString;

              qry_embalagem_.Close;
              qry_embalagem_.ParamByName('CD_EMBALAGEM').AsString := qry_merc_exp_CD_EMBALAGEM.AsString;
              qry_embalagem_.Prepare;
              qry_embalagem_.Open;
              if Not qry_embalagem_.EOF then
              begin
                // QUANTIDADE INFERIOR 
                if qry_merc_exp_QT_POR_EMBALAGEM.AsInteger = 1 then
                  qry_pe_itens_QT_EMBALAGEM.AsFloat := qry_pe_itens_QT_MERCADORIA.AsFloat;

                if qry_pe_itens_CD_EMBALAGEM_SUP.AsString = '' then
                   qry_pe_itens_CD_EMBALAGEM_SUP.AsString := qry_embalagem_CD_EMBALAGEM_SUP.AsString;

              end;

              if qry_pe_itens_CD_UNID_MEDIDA.AsString <> '103' then
              begin
                if qry_pe_itens_QT_POR_EMB.AsFloat = 0 then
                   qry_pe_itens_QT_POR_EMB.AsFloat := qry_merc_exp_QT_POR_EMBALAGEM.AsFloat;
              end;

              if qry_pe_itens_VL_TOT_ITEM.AsFloat = 0 then
                 qry_pe_itens_VL_TOT_ITEM.AsFloat := qry_pe_itens_QT_MERCADORIA.AsFloat *
                                                     qry_pe_itens_VL_UNITARIO.AsFloat;

              if qry_pe_itens_VL_POR_EMB.AsFloat = 0 then
                 qry_pe_itens_VL_POR_EMB.AsFloat := qry_pe_itens_QT_MERCADORIA.AsFloat *
                                                    qry_pe_itens_QT_POR_EMB.AsFloat;

              if ( Trim( qry_pe_itens_CD_FABR_EXPO.AsString ) = '' ) or
                 ( qry_pe_itens_.State in [dsInsert] ) then
              begin
                qry_pe_itens_CD_FABR_EXPO.AsString := qry_merc_exp_CD_FABR_EXPO.AsString;
              end;

              if qry_pe_itens_CD_FABR_EXPO.AsString = '2' then
              begin
                if Trim( qry_pe_itens_CD_FABRICANTE.AsString ) = '' then
                   qry_pe_itens_CD_FABRICANTE.AsString := qry_merc_exp_CD_FABRICANTE.AsString;
              end;

              // Embalagem Superior
              if qry_pe_itens_CD_EMBALAGEM_SUP.AsString <> '' then
              begin
                if qry_pe_itens_QT_POR_EMB_SUP.AsFloat = 0 then
                   qry_pe_itens_QT_POR_EMB_SUP.AsFloat := qry_embalagem_QT_EMBALAGEM_SUP.AsFloat;

                nNum1 := StrToFloat( TiraPonto( FormatFloat( '#0,.00', qry_pe_itens_QT_EMBALAGEM.AsFloat ) ) );
                nNum2 := StrToFloat( TiraPonto( FormatFloat( '#0,.00', qry_pe_itens_QT_POR_EMB_SUP.AsFloat ) ) );
                if ( nNum1 <> 0 ) and ( nNum2 <> 0 ) then
                begin
                  // Quantidade de Embalagens Superior 
                  if Int( nNum1 * nNum2 ) > 0 then
                  begin
                    qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat := Int( nNum1 / nNum2 );
                    if Int( nNum1 / nNum2 ) <> ( nNum1 / nNum2 ) then
                       qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat := Int( nNum1 / nNum2 ) + 1;

                    if qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat <= 0 then
                       qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat := 1
                  end
                  else
                     qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat := 1;

                  nNum3 := StrToFloat( TiraPonto( FormatFloat( '#0,.00', qry_pe_itens_VL_UNITARIO.AsFloat ) ) );
                  if ( nNum3 <> 0 ) then
                  begin
                    // Valor por Embalagem Superior
                    qry_pe_itens_VL_POR_EMB_SUP.AsFloat := nNum3 * ( qry_pe_itens_VL_POR_EMB.AsFloat * qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat );

                    if qry_pe_itens_QT_POR_EMB_SUP.AsFloat = 0 then
                       qry_pe_itens_QT_POR_EMB_SUP.AsFloat := qry_embalagem_QT_EMBALAGEM_SUP.AsFloat;
                  end;
                end;
              end;
            end;

            //  NR. PEDIDO CLIENTE 
            qry_pe_itens_NR_PEDIDO_IMP.AsString := Copy( reg, 187, 18 );

            //  NR. PEDIDO BASF 
            qry_pe_itens_NR_PEDIDO.AsString := Copy( reg, 222, 10 );

            qry_pe_itens_.Post;

            // INCLUI ALTERACOES NA CAPA 
            qry_pe_capa_.Close;
            qry_pe_capa_.ParamByName('NR_PROCESSO').AsString := Copy( reg, 6, 10 );
            qry_pe_capa_.Prepare;
            qry_pe_capa_.Open;

            qry_pe_capa_.Edit;

            //  QUANTIDADE TOTAL DE ITENS 
            qry_pe_capa_QT_TOTAL_ITENS.AsString  := nr_item_str;

            // QUANTIDADE TOTAL DOS ITENS 
            qry_pe_capa_VL_TOT_QTDE_PROD.AsFloat := qry_pe_capa_VL_TOT_QTDE_PROD.AsFloat +
                                                    qry_pe_itens_QT_MERCADORIA.AsFloat;

            // VALOR TOTAL FOB 
            qry_pe_capa_VL_TOT_FOB.AsFloat       := qry_pe_capa_VL_TOT_FOB.AsFloat +
                                                    qry_pe_itens_VL_TOT_ITEM.asFloat;

            // VALOR TOTAL MCV
            qry_pe_capa_VL_TOT_MCV.AsFloat       := qry_pe_capa_VL_TOT_FOB.AsFloat +
                                                    qry_pe_itens_VL_TOT_ITEM.asFloat;

            qry_pe_capa_.Post;

          end;

        end;

        BoxMensagem( 'Importação de dados para PE executada com sucesso.', 3 );

      end;

      CloseFile(f);
    end;

  end;
end;


function Tfrm_integra_basf.ViaTransporte( cd_via : String ) : String;
begin
  if cd_via = 'S' then ViaTransporte := '01';
  if cd_via = 'Z' then ViaTransporte := '04';
  if cd_via = 'F' then ViaTransporte := '04';
  if cd_via = 'P' then ViaTransporte := '05';
  if cd_via = 'B' then ViaTransporte := '06';
  if cd_via = 'L' then ViaTransporte := '07';
end;

procedure Tfrm_integra_basf.edt_nm_file_remessaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = edt_nm_file_remessa then btn_file_remessaClick(nil);
  end;
end;


procedure Tfrm_integra_basf.FormShow(Sender: TObject);
begin
  edt_nm_file_remessa.Text := 'o:\export\indaia\nfex.t';
  edt_nm_file_remessa.SetFocus;
end;


function Tfrm_integra_basf.TiraZero( cNumero : String ) : String;
begin
  while Pos('0',cNumero) > 0 do
    cNumero := TrocaStr( cNumero, ' ', Pos( '0', cNumero ) );

  TiraZero := Alltrim( cNumero )
end;



end.

