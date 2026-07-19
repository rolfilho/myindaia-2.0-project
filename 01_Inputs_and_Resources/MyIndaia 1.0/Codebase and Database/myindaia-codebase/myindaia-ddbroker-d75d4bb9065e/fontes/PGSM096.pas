unit PGSM096;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, Buttons, ComCtrls, Grids,
  DBGrids, Db, DBTables, PGGP001, Funcoes;

type
  Tfrm_consulta_padrao = class(TForm)
    pnl_cadastro: TPanel;
    dbnav_cadastro: TDBNavigator;
    btn_fechar: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbg_cadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    nCodigo : Integer;
    st_modificar : Boolean;
    { Public declarations }
  end;

var
  frm_consulta_padrao: Tfrm_consulta_padrao;

implementation

uses GSMLIB, PGSM117, PGSM148, PGPG021, PGPG022;

{$R *.DFM}

procedure Tfrm_consulta_padrao.FormCreate(Sender: TObject);
begin
  st_modificar := True;
 // Inicializa o Data Module para Consulta Padrão
  Application.CreateForm( Tdatm_consulta_padrao, datm_consulta_padrao );
end;

procedure Tfrm_consulta_padrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  datm_consulta_padrao.Free;
end;

procedure Tfrm_consulta_padrao.btn_fecharClick(Sender: TObject);
begin
  datm_consulta_padrao.Tabela.Close;
  Close;
end;

procedure Tfrm_consulta_padrao.edt_chaveChange(Sender: TObject);
begin
  with datm_consulta_padrao do
  begin
    if Tabela.Active then
    begin
      Tabela.FindNearest( [UpperCase( edt_chave.Text )] );
    end
    else
    begin
      Query.Locate( a_str_indices[cb_ordem.ItemIndex], UpperCase( edt_chave.Text ) , [loPartialKey, loCaseInsensitive] );
    end;
  end;
end;

procedure Tfrm_consulta_padrao.cb_ordemClick(Sender: TObject);
begin
  with datm_consulta_padrao do
  begin
    // Apaga o campo de pesquisa 
    edt_chave.Text := '';
    if Tabela.Active then
    begin
      Tabela.Close;
      Tabela.IndexFieldNames := a_str_indices[cb_ordem.ItemIndex];
      Tabela.Open;
    end
    else
    begin
      Query.Close;
      if Query.SQL.Count > 1 then
      begin
        Query.SQL[2] := a_str_indices[cb_ordem.ItemIndex]
      end
      else
      begin
        Query.SQL.Add('ORDER BY');
        Query.SQL.Add(a_str_indices[cb_ordem.ItemIndex]);
      end;
      Query.Prepare;
      Query.Open;
    end;
  end;
end;

procedure Tfrm_consulta_padrao.dbg_cadastroDblClick(Sender: TObject);
begin
  with datm_consulta_padrao do
  begin
    if Tabela.Active then
    begin
      if lCons_OnLine then
      begin
        with Cons_OnLine do
        begin
          if nCodigo in [8, 10, 12, 14, 15, 16, 18, 21, 22, 23, 24, 25, 26, 32, 33, 36, 37, 38, 44, 45, 47, 54, 56, 57, 59, 60] then //Cons_OnLine_Texto
          begin
            case nCodigo of
              8, 12, 18, 25, 32, 37, 47:
                begin
                  try
                    if Not( DataSet.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
                       DataSet.Edit;
                    if nCodigo in [18,25,32,36,37,47] then AsString := Tabela.Fields[0].AsString;
                    if nCodigo in [8, 12]  then AsString := Tabela.Fields[1].AsString;
                  except
                    try
                      if nCodigo in [18,25,32,36,37] then Cons_Online_Texto := Tabela.Fields[0].AsString;
                      if nCodigo in [8]  then Cons_Online_Texto := Tabela.Fields[1].AsString;
                    except
                      BoxMensagem('Não foi possível retornar o Código!', 2);
                    end;
                  end;
                end;
              15, 23:
                Cons_Online_Texto := Tabela.Fields[1].AsString;
            else
                Cons_Online_Texto := Tabela.Fields[0].AsString;
            end;
          end
          else
          begin
            if Not TTable(DataSet).ReadOnly then
            begin
              try
                if Not( DataSet.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
                   DataSet.Edit;
                if nCodigo in [1, 2, 6, 7, 17, 19, 20, 27, 30, 35, 36, 47, 55, 60] then
                   AsString := Tabela.Fields[0].AsString;
                if nCodigo in [4, 9, 11, 12, 28, 13] then
                   AsString := Tabela.Fields[1].AsString;
                if nCodigo in [3, 5] then
                   AsString := Tabela.Fields[2].AsString;
                if nCodigo in [29] then
                   AsString := Tabela.Fields[2].AsString;
                if nCodigo in [34] then
                   AsString := Tabela.Fields[5].AsString;
              except
                BoxMensagem('Não consegui retornar Código!', 2);
              end;
            end
            else Exit;
          end;
        end;
        try
          Tabela.Close;
        finally
          Close;
        end;
      end;
    end
    else
    if Query.Active then
    begin
      if lCons_OnLine then
      begin
        with Cons_OnLine do
        begin
          if nCodigo in [1, 8, 10, 14, 15, 16, 21, 22, 23, 24, 25, 26, 36, 47, 57] then //Cons_OnLine_Texto
          begin
            case nCodigo of
              1, 8, 25, 36:
                begin
                  try
                    if Not( DataSet.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
                       DataSet.Edit;
                    if nCodigo in [1, 25, 36] then AsString := Query.Fields[0].AsString;
                    if nCodigo in [8]  then AsString := Query.Fields[1].AsString;
                  except
                    try
                      if nCodigo in [1, 25, 36] then Cons_Online_Texto := Query.Fields[0].AsString;
                      if nCodigo in [8]  then Cons_Online_Texto := Query.Fields[1].AsString;
                    except
                      BoxMensagem('Não foi possível retornar o Código!', 2);
                    end;
                  end;
                end;
              15, 23:
                Cons_Online_Texto := Query.Fields[1].AsString;
            else
                Cons_Online_Texto := Query.Fields[0].AsString;
            end;
          end
          else
          begin
            if Not TTable(DataSet).ReadOnly then
            begin
              try
                if Not( DataSet.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
                   DataSet.Edit;
                if nCodigo in [1, 2, 6, 7, 17, 18, 19, 20, 27, 31, 32, 34, 35, 38, 39, 40, 41, 42, 43, 44, 45, 46, 50, 51, 52, 53, 55] then
                   AsString := Query.Fields[0].AsString;
                if nCodigo in [4, 9, 11, 12, 13] then
                   AsString := Query.Fields[1].AsString;
                if nCodigo in [3, 5] then
                   AsString := Query.Fields[2].AsString;
                if nCodigo in [28] then
                begin
                  str_cd_nomenc_ncm := Query.Fields[0].AsString;
                  AsString          := Query.Fields[1].AsString;
                end;
                if nCodigo in [29] then
                begin
                  str_cd_nomenc_ncm   := Query.Fields[0].AsString;
                  str_cd_atributo_ncm := Query.Fields[1].AsString;
                  AsString            := Query.Fields[2].AsString;
                end;
                if nCodigo in [48] then
                begin
                  AsString            := Query.Fields[0].AsString;
                  nr_seq_ncm_doc_exp  := Query.Fields[2].AsInteger;
                end;
                if nCodigo in [49] then
                begin
                  AsString              := Query.Fields[0].AsString;
                  nr_seq_naladi_doc_exp := Query.Fields[2].AsInteger;
                end;
              except
                BoxMensagem('Não consegui retornar Código!', 2);
              end;
            end
            else Exit;
          end;
        end;
        Query.Close;
        Close;
      end;
    end;
  end;
end;

procedure Tfrm_consulta_padrao.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_consulta_padrao.FormShow(Sender: TObject);
var
nr_identificador : integer;
begin
  with datm_consulta_padrao do
  begin
    case nCodigo of
      1, 10, 33: //Diversas do SISCOMEX
        begin
          dbg_cadastro.Columns[0].FieldName := 'Codigo';
          dbg_cadastro.Columns[1].FieldName := 'Descricao';

          a_str_indices[0] := 'CODIGO';
          a_str_indices[1] := 'DESCRICAO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;
      2:
        begin
          dbg_cadastro.Columns[0].FieldName := 'Codigo';
          dbg_cadastro.Columns[1].FieldName := 'Descricao';

          a_str_indices[0] := 'CODIGO';
          a_str_indices[1] := 'DESCRICAO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      3: // Recinto Alfandegado
        begin
          dbg_cadastro.Columns[0].FieldName := 'Setor';
          dbg_cadastro.Columns[1].FieldName := 'Nome';

          a_str_indices[0] := 'Orgao,Recinto,Setor';
          a_str_indices[1] := 'Recinto,Setor';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      4: // Atributo NCM
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_ATRIBUTO_NCM';
          dbg_cadastro.Columns[1].FieldName := 'NM_ATRIBUTO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_NOMENC_NCM;CD_ATRIBUTO_NCM';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Atributo');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      5: // Especificação do NCM
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_ESPECIF_NCM';
          dbg_cadastro.Columns[1].FieldName := 'NM_ESPECIF_NCM';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_NOMENC_NCM;CD_ATRIBUTO_NCM;CD_ESPECIF_NCM';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Especificação');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      6: // Via de Transporte
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_VIA_TRANSPORTE';
          dbg_cadastro.Columns[1].FieldName := 'NM_VIA_TRANSPORTE';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Nome';

          a_str_indices[0] := 'CD_VIA_TRANSPORTE';
          a_str_indices[1] := 'NM_VIA_TRANSPORTE';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Nome');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;
      7: // Cálculo
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_CALCULO';
          dbg_cadastro.Columns[1].FieldName := 'NM_CALCULO';

          a_str_indices[0] := 'CD_CALCULO';
          a_str_indices[1] := 'NM_CALCULO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      8: // Contas Contábeis - RM
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_CT_CONTABIL';
          dbg_cadastro.Columns[1].FieldName := 'NM_CT_CONTABIL';

          a_str_indices[0] := 'CD_CT_CONTABIL';
          a_str_indices[1] := 'NM_CT_CONTABIL';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      9: // Histórico
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_HISTORICO';
          dbg_cadastro.Columns[1].FieldName := 'NM_HISTORICO';

          a_str_indices[0] := 'CD_HISTORICO';
          a_str_indices[1] := 'NM_HISTORICO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      11, 15: // Contas
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_CONTA';
          dbg_cadastro.Columns[1].FieldName := 'NM_CONTA';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_CONTA';
          a_str_indices[1] := 'NM_CONTA';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      12: // Custo
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_CT_CUSTO';
          dbg_cadastro.Columns[1].FieldName := 'NM_CT_CUSTO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_CT_CUSTO';
          a_str_indices[1] := 'NM_CT_CUSTO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      13: // Distribuição Gerencial - RM
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_CT_GERENCIAL';
          dbg_cadastro.Columns[1].FieldName := 'NM_CT_GERENCIAL';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_CT_GERENCIAL';
          a_str_indices[1] := 'NM_CT_GERENCIAL';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      14: // Coligada
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_COLIGADA';
          dbg_cadastro.Columns[1].FieldName := 'NM_COLIGADA';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_COLIGADA';
          a_str_indices[1] := 'NM_COLIGADA';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      16: // Grupo_Item
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_GRUPO_ITEM';
          dbg_cadastro.Columns[1].FieldName := 'NM_GRUPO_ITEM';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_GRUPO_ITEM';
          a_str_indices[1] := 'NM_GRUPO_ITEM';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      17: // Modelo de Followup
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_NUMERARIO';
          dbg_cadastro.Columns[1].FieldName := 'NM_NUMERARIO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_NUMERARIO';
          a_str_indices[1] := 'NM_NUMERARIO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      18: // Tributacao do ICMS
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_TRIBUTACAO_ICMS';
          dbg_cadastro.Columns[1].FieldName := 'NM_TRIBUTACAO_ICMS';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_TRIBUTACAO_ICMS';
          a_str_indices[1] := 'NM_TRIBUTACAO_ICMS';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      19: // Tipo de Follow_up
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_TP_FOLLOW_UP';
          dbg_cadastro.Columns[1].FieldName := 'NM_TP_FOLLOW_UP';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_TP_FOLLOW_UP';
          a_str_indices[1] := 'NM_TP_FOLLOW_UP';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      20: // Motivo Retificação
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_MOTIVO_RETIF';
          dbg_cadastro.Columns[1].FieldName := 'NM_MOTIVO_RETIF';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_MOTIVO_RETIF';
          a_str_indices[1] := 'NM_MOTIVO_RETIF';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      21: // Tabela
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_TABELA';
          dbg_cadastro.Columns[1].FieldName := 'NM_TABELA';

          a_str_indices[0] := 'CD_TABELA';
          a_str_indices[1] := 'NM_TABELA';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;
      22: // Modulo
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_MODULO';
          dbg_cadastro.Columns[1].FieldName := 'NM_MODULO';

          a_str_indices[0] := 'CD_MODULO';
          a_str_indices[1] := 'NM_MODULO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;
      23: // Rotina
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_ROTINA';
          dbg_cadastro.Columns[1].FieldName := 'NM_ROTINA';

          a_str_indices[0] := 'CD_ROTINA';
          a_str_indices[1] := 'NM_ROTINA';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;
      24: // Movimento LOG
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_MOVIMENTO';
          dbg_cadastro.Columns[1].FieldName := 'NM_MOVIMENTO';

          a_str_indices[0] := 'CD_MOVIMENTO';
          a_str_indices[1] := 'NM_MOVIMENTO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;
      25: // Código de Recolhimento de IR
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_RECOL';
          dbg_cadastro.Columns[1].FieldName := 'NM_NATUREZA';

          a_str_indices[0] := 'CD_RECOL';
          a_str_indices[1] := 'NM_NATUREZA';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;
      26: // Serviço
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_SERVICO';
          dbg_cadastro.Columns[1].FieldName := 'NM_SERVICO';

          a_str_indices[0] := 'CD_SERVICO';
          a_str_indices[1] := 'NM_SERVICO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;

      27 : // Nivel NVE
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_NIVEL_NVE';
          dbg_cadastro.Columns[0].Title.Caption := 'Código do nível';
          dbg_cadastro.Columns[1].FieldName := 'NM_NIVEL';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_NIVEL_NVE';
          a_str_indices[1] := 'NM_NIVEL';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      28 : // Atributo NVE
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_ATRIBUTO_NCM';
          dbg_cadastro.Columns[1].FieldName := 'NM_ATRIBUTO';
          dbg_cadastro.Columns[0].Title.Caption := 'Cód. atributo';
          dbg_cadastro.Columns[1].Title.Caption := 'Atributo';

          a_str_indices[0] := 'CD_ATRIBUTO_NCM';
          a_str_indices[1] := 'NM_ATRIBUTO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          // cb_ordemClick(nil);
        end;

      29 : // Especificação NVE
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_ESPECIF_NCM';
          dbg_cadastro.Columns[1].FieldName := 'NM_ESPECIF_NCM';
          dbg_cadastro.Columns[0].Title.Caption := 'Cód. especificação';
          dbg_cadastro.Columns[1].Title.Caption := 'Especificação';

          a_str_indices[0] := 'CD_ESPECIF_NCM';
          a_str_indices[1] := 'NM_ESPECIF_NCM';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          // cb_ordemClick(nil);
        end;

      30 : // Instalação 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_INSTALACAO';
          dbg_cadastro.Columns[1].FieldName := 'AP_INSTALACAO';
          dbg_cadastro.Columns[0].Title.Caption := 'Cód. Instalação';
          dbg_cadastro.Columns[1].Title.Caption := 'Instalação';

          a_str_indices[0] := 'CD_INSTALACAO';
          a_str_indices[1] := 'NM_INSTALACAO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Instalação');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      31 : // Dispositivo Legal 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_EX';
          dbg_cadastro.Columns[1].FieldName := 'NM_EX';
          dbg_cadastro.Columns[0].Title.Caption := 'Cód.';
          dbg_cadastro.Columns[1].Title.Caption := 'Dispositivo Legal';

          a_str_indices[0] := 'CD_EX';
          a_str_indices[1] := 'NM_EX';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Cód.');
            Items.Add('Dispositivo Legal');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      32 : // Unidade Medida Broker 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_UNID_MEDIDA';
          dbg_cadastro.Columns[1].FieldName := 'NM_UNID_MEDIDA';

          a_str_indices[0] := 'CD_UNID_MEDIDA';
          a_str_indices[1] := 'NM_UNID_MEDIDA';

          dbg_cadastro.Columns[0].Title.Caption := 'Cód.';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Cód.');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      34 : // Agente transportador 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_AGENTE';
          dbg_cadastro.Columns[1].FieldName := 'NM_AGENTE';

          a_str_indices[0] := 'CD_AGENTE';
          a_str_indices[1] := 'NM_AGENTE';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      35 : // UF 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_UF';
          dbg_cadastro.Columns[1].FieldName := 'NM_UF';

          a_str_indices[0] := 'CD_UF';
          a_str_indices[1] := 'NM_UF';

          dbg_cadastro.Columns[0].Title.Caption := 'Sigla';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Sigla');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      36 : // Mes 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_MES';
          dbg_cadastro.Columns[1].FieldName := 'NM_MES';

          a_str_indices[0] := 'CD_MES';
          a_str_indices[1] := 'NM_MES';

          dbg_cadastro.Columns[0].Title.Caption := 'Número';
          dbg_cadastro.Columns[1].Title.Caption := 'Mês';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Número');
            Items.Add('Mês');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      37: // Contas Contábeis 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_CT_CONTABIL';
          dbg_cadastro.Columns[1].FieldName := 'NM_CT_CONTABIL';

          a_str_indices[0] := 'CD_CT_CONTABIL';
          a_str_indices[1] := 'NM_CT_CONTABIL';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      38:  // Exportador / Importador 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_EMPRESA';
          dbg_cadastro.Columns[1].FieldName := 'NM_EMPRESA';

          a_str_indices[0] := 'CD_EMPRESA';
          a_str_indices[1] := 'NM_EMPRESA';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;

      39 : // Instrumento de Negociacao 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_INST_NEGOC';
          dbg_cadastro.Columns[1].FieldName := 'NM_INST_NEGOC';

          a_str_indices[0] := 'CD_INST_NEGOC';
          a_str_indices[1] := 'NM_INST_NEGOC';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      40 : // Termo de Pagamento 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_TERMO_PAGTO';
          dbg_cadastro.Columns[1].FieldName := 'NM_TERMO_PAGTO';

          a_str_indices[0] := 'CD_TERMO_PAGTO';
          a_str_indices[1] := 'NM_TERMO_PAGTO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      41 : // Despachante 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_DESPACHANTE';
          dbg_cadastro.Columns[1].FieldName := 'NM_DESPACHANTE';

          a_str_indices[0] := 'CD_DESPACHANTE';
          a_str_indices[1] := 'NM_DESPACHANTE';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      42 : // Banco 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_BANCO';
          dbg_cadastro.Columns[1].FieldName := 'NM_BANCO';

          a_str_indices[0] := 'CD_BANCO';
          a_str_indices[1] := 'NM_BANCO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      43 : // Embalagem 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_EMBALAGEM';
          dbg_cadastro.Columns[1].FieldName := 'NM_EMBALAGEM_S';

          a_str_indices[0] := 'CD_EMBALAGEM';
          a_str_indices[1] := 'NM_EMBALAGEM_S';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      44 : // Mercadoria 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_MERCADORIA';
          dbg_cadastro.Columns[1].FieldName := 'AP_MERCADORIA';

          a_str_indices[0] := 'CD_MERCADORIA';
          a_str_indices[1] := 'AP_MERCADORIA';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descr.Resumida';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição Resumida');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      45 : // Analistas / Usuários 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_USUARIO';
          dbg_cadastro.Columns[1].FieldName := 'NM_USUARIO';

          a_str_indices[0] := 'CD_USUARIO';
          a_str_indices[1] := 'NM_USUARIO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Nome';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Nome');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      46 : // Acordo / Normas 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CODIGO';
          dbg_cadastro.Columns[1].FieldName := 'NOME';

          a_str_indices[0] := 'CODIGO';
          a_str_indices[1] := 'NOME';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Nome';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Nome');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      47 : // Bancos 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_BCO';
          dbg_cadastro.Columns[1].FieldName := 'NM_BCO';

          a_str_indices[0] := 'CD_BCO';
          a_str_indices[1] := 'NM_BCO';

          dbg_cadastro.Columns[0].Title.Caption := 'Nº';
          dbg_cadastro.Columns[1].Title.Caption := 'Nome';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Número');
            Items.Add('Nome');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      48,49 : // NCM / NALADI Documentos Exportacao 
        begin
          dbg_cadastro.Columns[0].FieldName := 'CODIGO';
          dbg_cadastro.Columns[1].FieldName := 'DESCRICAO';

          a_str_indices[0] := 'CODIGO';
          a_str_indices[1] := 'DESCRICAO';

          dbg_cadastro.Columns[0].Title.Caption := 'Cód.';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      50: // Via de Transporte do Broker
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_VIA_TRANSP';
          dbg_cadastro.Columns[1].FieldName := 'NM_VIA_TRANSP';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Nome';

          a_str_indices[0] := 'CD_VIA_TRANSP';
          a_str_indices[1] := 'NM_VIA_TRANSP';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Nome');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;

      51: // Moeda Broker
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_MOEDA';
          dbg_cadastro.Columns[1].FieldName := 'NM_MOEDA';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Nome';

          a_str_indices[0] := 'CD_MOEDA';
          a_str_indices[1] := 'NM_MOEDA';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Nome');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;

      52: // Unidade de Negocio
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_UNID_NEG';
          dbg_cadastro.Columns[1].FieldName := 'NM_UNID_NEG';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Nome';

          a_str_indices[0] := 'CD_UNID_NEG';
          a_str_indices[1] := 'NM_UNID_NEG';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Nome');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;

      53: // TMOEDA_BROKER
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_MOEDA';
          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].FieldName := 'NM_MOEDA';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_MOEDA';
          a_str_indices[1] := 'NM_MOEDA';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;

      54: // Relação de Despesas - TREL_DESP
        begin
          dbg_cadastro.Columns[0].FieldName     := 'NR_REL_DESP';
          dbg_cadastro.Columns[0].Title.Caption := 'Número da Relação';
          dbg_cadastro.Columns[1].FieldName     := 'NR_PROCESSO';
          dbg_cadastro.Columns[1].Title.Caption := 'Processo';

          a_str_indices[0] := 'NR_REL_DESP';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Nr. Rel. Desp.');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;

      55: // Distribuição Gerencial - Broker
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_CT_GERENCIAL';
          dbg_cadastro.Columns[1].FieldName := 'NM_CT_GERENCIAL';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_CT_GERENCIAL';
          a_str_indices[1] := 'NM_CT_GERENCIAL';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      56: // Via de Transporte
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_VIA_TRANSPORTE';
          dbg_cadastro.Columns[1].FieldName := 'NM_VIA_TRANSPORTE';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_VIA_TRANSPORTE';
          a_str_indices[1] := 'NM_VIA_TRANSPORTE';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      57: // Item X Área
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_ITEM';
          dbg_cadastro.Columns[1].FieldName := 'NM_ITEM';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_ITEM';
          a_str_indices[1] := 'NM_ITEM';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;
          cb_ordemClick(nil);
        end;
      58: // Itens sem Grupo
        begin
          nr_identificador := datm_sel_unid_cli_grupo_item.qry_trel_erro_resumo_fat_NR_IDENTIFICADOR.AsInteger;
          QUERY.Close;
          QUERY.SQL.Clear;
          QUERY.SQL.Add('SELECT * FROM TREL_ERRO_RESUMO_FAT WHERE NR_IDENTIFICADOR ='+inttostr(nr_identificador));
          QUERY.Prepare;
          QUERY.Open;

          dbg_cadastro.Columns[0].FieldName := 'CD_ITEM';
          dbg_cadastro.Columns[1].FieldName := 'NM_DESPESA';
          //dbg_cadastro.Columns[2].FieldName := 'VL_LANCAMENTO';
          //dbg_cadastro.Columns[3].FieldName := 'NR_PROCESSO';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';
          //dbg_cadastro.Columns[2].Title.Caption := 'Valor Lançamento';
          //dbg_cadastro.Columns[3].Title.Caption := 'Processo';

          a_str_indices[0] := 'CD_ITEM';
          a_str_indices[1] := 'NM_ITEM';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;
        end;
      59: // País
        begin
          dbg_cadastro.Columns[0].FieldName := 'Codigo';
          dbg_cadastro.Columns[1].FieldName := 'Descricao';

          a_str_indices[0] := 'CODIGO';
          a_str_indices[1] := 'DESCRICAO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      60: // Transportador
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_TRANSP_ROD';
          dbg_cadastro.Columns[1].FieldName := 'AP_TRANSP_ROD';

          dbg_cadastro.Columns[0].Title.Caption := 'Código';
          dbg_cadastro.Columns[1].Title.Caption := 'Descrição';

          a_str_indices[0] := 'CD_TRANSP_ROD';
          a_str_indices[1] := 'AP_TRANSP_ROD';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 0;
          end;

          cb_ordemClick(nil);
        end;
      61:
        begin
          dbg_cadastro.Columns[0].FieldName := 'CD_BANCO';
          dbg_cadastro.Columns[1].FieldName := 'NM_BANCO';

          a_str_indices[0] := 'CD_BANCO';
          a_str_indices[1] := 'NM_BANCO';

          with cb_ordem do
          begin
            Clear;
            Items.Add('Código');
            Items.Add('Descrição');
            ItemIndex := 1;
          end;

          cb_ordemClick(nil);
        end;

    end;

    if Tabela.Active then
       Tabela.First
    else
    if Query.Active then
       Query.First;

    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_consulta_padrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_consulta_padrao.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
