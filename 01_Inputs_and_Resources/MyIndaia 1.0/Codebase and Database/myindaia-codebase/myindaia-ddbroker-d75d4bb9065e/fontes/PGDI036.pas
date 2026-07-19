unit PGDI036;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, checklst, DBTables, Db, ComCtrls, Funcoes;

const
   // Este é o código do modulo de Gestão de Processo
   // str_cd_modulo = '01';
   str_proc_zeros = '00000000000';

var
   // str_cd_usuario   : String[4];
   str_ap_usuario   : String[10];
   str_nm_usuario   : String[50];
   // str_cd_unid_neg  : String[2];
   str_nm_unid_neg  : String[50];
   // str_cd_produto   : String[2];
   // str_nr_processo  : String[11];
   lControle_Acesso : Boolean;
   lResposta        : Boolean;
   lCancelar        : Boolean;

type
  Tfrm_AtualizaSISCOMEX = class(TForm)
    rgrp_opcao: TRadioGroup;
    btn_atualizar: TButton;
    btn_cancelar: TButton;
    Lista_tabelas: TCheckListBox;
    Bevel2: TBevel;
    gbox_monitor: TGroupBox;
    lbl_tabelas: TLabel;
    lbl_registros: TLabel;
    lsl_Insercoes: TLabel;
    lbl_atualizacoes: TLabel;
    lbl_nr_tabelas: TLabel;
    lbl_nr_registros: TLabel;
    lbl_nr_insercoes: TLabel;
    lbl_nr_atualizacoes: TLabel;
    btn_fechar: TButton;
    lbl_box_mensagem: TLabel;
    bvl_mensagem: TBevel;
    Bevel1: TBevel;
    lbl_mensagem: TLabel;
    chkBox_limpar: TCheckBox;
    ProgressBar1: TProgressBar;
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure rgrp_opcaoClick(Sender: TObject);
    procedure chkBox_limparClick(Sender: TObject);
    procedure Lista_tabelasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaTodas;
    procedure AtualizaEsp;
    procedure AtualizaTabela( i : integer );
    procedure AtualizaTabelaComUmCampoChave( i : Integer );
    procedure AtualizaTabelaComVariasChaves( i : Integer );
    procedure AtualizaTaxaCambio( i : Integer );
    procedure ApagaTabela( i : integer );
    procedure DesmarcarTodas;
    procedure AtualizaTabelaDI( i : integer );
    function UsuarioSelecionou : Boolean;
    procedure grava_nivel( tabela: TTable; Codigo, Descricao: String );
  end;

var
  frm_AtualizaSISCOMEX: Tfrm_AtualizaSISCOMEX;

  // Matrizes com os nomes das Tabelas e Indice de Atualização 
  aTabelaSISCOMEX : Array[0..35] of String;
  aTabelaBroker   : Array[0..35] of String;
  aTabelaINDICE   : Array[0..35] of String;
  aCampos         : Array[0..2]  of String;

  // Contadores para atualização da Janela 
  nTabelas, nRegistros, nInsercoes, nAtualizacoes : Integer;

implementation

uses GSMLIB, PGGP001, PGGP017, PGDI037;

{$R *.DFM}

procedure Tfrm_AtualizaSISCOMEX.AtualizaTabelaDI( i : Integer );
var
  str_chave : String;
begin
  with datm_AtualizaSISCOMEX do
  begin
    if i = 0 then
    begin
      try
        tbl_siscomex.Close;
        tbl_broker.Close;
        tbl_siscomex.TableName     := 'TAB_ACRESC_VR_ADUANEIRA';
        tbl_broker.TableName       := 'TAB_ACRESCIMO';
        tbl_broker.IndexFieldNames := 'CODIGO';
        tbl_siscomex.Open;
        tbl_broker.Open;
      except
        Exit;
      end;
      while Not( tbl_siscomex.EOF ) do
      begin
        str_chave := IntToStr( tbl_siscomex.FieldByName('CODIGO').AsInteger );
        if tbl_broker.FindKey([ str_chave ]) then
           tbl_broker.Edit
        else
        begin
          tbl_broker.Append;
          tbl_broker.fields[0].AsString := str_chave;
        end;
        Application.ProcessMessages;
        // Atualiza a descrição correspodente
        tbl_broker.fields[1].AsString := tbl_siscomex.Fields[1].AsString;
        // Passa o controle para o Windows NT
        Application.ProcessMessages;
        tbl_broker.Post;
        tbl_siscomex.Next;
      end;
    end
    else // i = 1
    begin
      try
        tbl_siscomex.Close;
        tbl_broker.Close;
        tbl_siscomex.TableName     := 'TAB_DEDUCAO_VR_ADUANEIRA';
        tbl_broker.TableName       := 'TAB_DEDUCAO';
        tbl_broker.IndexFieldNames := 'CODIGO';
        tbl_broker.Open;
        tbl_siscomex.Open;
      except
        Exit;
      end;
      while Not( tbl_siscomex.EOF ) do
      begin
        str_chave := IntToStr( tbl_siscomex.FieldByName('CODIGO').AsInteger );
        if tbl_broker.FindKey([ str_chave ]) then
           tbl_broker.Edit
        else
        begin
          tbl_broker.Append;
          tbl_broker.fields[0].AsString := str_chave;
        end;
        Application.ProcessMessages;
        // Atualiza a descrição correspodente
        tbl_broker.fields[1].AsString := tbl_siscomex.Fields[1].AsString;
        // Passa o controle para o Windows NT
        Application.ProcessMessages;
        tbl_broker.Post;
        tbl_siscomex.Next;
      end;
    end;
    tbl_siscomex.Close;
  end;
end;

function Tfrm_AtualizaSISCOMEX.UsuarioSelecionou : Boolean;
var
  i : Integer;
begin
  Result := False;
  for i := 0 to Lista_tabelas.Items.Count - 1 do
  begin
    if Lista_tabelas.Checked[i] then Result := True;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.DesmarcarTodas;
var
  i : Integer;
begin
  for i := 0 to Lista_tabelas.Items.Count - 1 do
  begin
    Lista_tabelas.Checked[i] := False;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.ApagaTabela( i : integer );
var Erro : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    Erro := False;
    with datm_AtualizaSISCOMEX do
    begin
      lbl_mensagem.Caption := 'Limpando a Tabela '+ Lista_tabelas.Items.Strings[i] +'... ';
      Application.ProcessMessages;
      // tbl_broker.Refresh;
      while (( tbl_broker.RecordCount > 0 ) and ( Not Erro ) ) do
      begin
        try
          tbl_broker.Delete;
          Application.ProcessMessages;
        except
          Erro := True;
        end;
      end;
    end;
    datm_main.db_broker.Commit;
  except
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.AtualizaTabelaComUmCampoChave( i : Integer );
var
  j : Integer;
begin
  with datm_AtualizaSISCOMEX do
  begin
    if lCancelar then
    begin
      ProgressBar1.Position := 0;
      Exit;
    end;

    tbl_siscomex.Close;
    tbl_broker.Close;

    tbl_siscomex.TableName     := aTabelaSISCOMEX[i];
    tbl_broker.TableName       := aTabelaBroker[i];

    if i = 15 then tbl_broker.IndexFieldNames := 'CD_MOEDA'
    else tbl_broker.IndexFieldNames := aTabelaINDICE[i];
    if i <> 21 then
    begin
      tbl_siscomex.Open;
      try
        tbl_broker.Open;
      except
        if chkBox_limpar.Checked then
           lbl_mensagem.Caption:= 'Você optou por limpar a Tabela previamente. Verifique se outro usuario esta usando o sistema.';
           ProgressBar1.Position := 0;
           Exit;
      end;
      if ( chkBox_limpar.Checked ) and ( i <> 20 ) then ApagaTabela(i);
    end;

    lbl_mensagem.Caption:= 'Atualizando Tabela '+ Lista_tabelas.Items.Strings[i] +'... ';
    Application.ProcessMessages;

    if i <> 21 then
    begin
      try
        datm_main.db_broker.StartTransaction;
        while Not( tbl_siscomex.EOF ) do
        begin
          Inc( nRegistros );
          lbl_nr_Registros.Caption := IntToStr( nRegistros );
          if i = 34 then
          begin
            if tbl_broker.FindKey([ '0' + tbl_siscomex.FieldByName( tbl_siscomex.Fields[0].FieldName ).AsString ]) then
            begin
              Inc( nAtualizacoes );
              lbl_nr_Atualizacoes.Caption := IntToStr( nAtualizacoes );
              tbl_broker.Edit;
            end
            else
            begin
              Inc( nInsercoes );
              lbl_nr_Insercoes.Caption := IntToStr( nInsercoes );
              tbl_broker.Append;
              tbl_broker.fields[0].AsString := '0' + tbl_siscomex.Fields[0].AsString;
            end;
          end
          else
          begin
            if tbl_broker.FindKey([tbl_siscomex.FieldByName(tbl_siscomex.Fields[0].FieldName).AsString]) then
            begin
              Inc( nAtualizacoes );
              lbl_nr_Atualizacoes.Caption := IntToStr( nAtualizacoes );
              tbl_broker.Edit;
            end
            else
            begin
              Inc( nInsercoes );
              lbl_nr_Insercoes.Caption := IntToStr( nInsercoes );
              tbl_broker.Append;
              tbl_broker.fields[0].AsString := tbl_siscomex.Fields[0].AsString;
              if i = 15 then tbl_broker.fields[2].AsString := tbl_siscomex.Fields[1].AsString;
            end;
          end;
          Application.ProcessMessages;

          // Processa todos os registros
          for j := 1 to tbl_siscomex.fielddefs.Count - 1 do
          begin
            if ( i = 20 ) and ( j = 2 ) then  // N.C.M. ==> Campo Unid. Medida Est.
              tbl_broker.fields[j].AsString := '0' + tbl_siscomex.Fields[j].AsString
            else
              tbl_broker.fields[j].AsString := tbl_siscomex.Fields[j].AsString;
            // Passa o controle para o Windows NT
            Application.ProcessMessages;
          end;

          // Passa o controle para o Windows NT
          Application.ProcessMessages;

          if lCancelar then
          begin
            tbl_siscomex.Last;
          end;
          tbl_broker.Post;
           // Próximo
          tbl_siscomex.Next;
        end;
        datm_main.db_broker.Commit;
      except
      on E: Exception do
       begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem('Ocorreu erro na atualização - comunique ao Suporte!',2);
        lbl_mensagem.Caption:= 'Ocorreu erro na atualização - comunique ao Suporte';
        ProgressBar1.Position := 0;
        Exit;
       end;
     end;
    end
    else
    begin
      try
        tbl_broker.Open;
        if tbl_broker.RecordCount = 0 then
        begin
          Application.ProcessMessages;
          datm_main.db_broker.StartTransaction;
          grava_nivel( tbl_broker, 'C','Capítulo' );
          grava_nivel( tbl_broker, 'P','Posição' );
          grava_nivel( tbl_broker, 'N','Item' );
          grava_nivel( tbl_broker, 'SA','Sub-posição nível 1' );
          grava_nivel( tbl_broker, 'SB','Sub-posição nível 2' );
          grava_nivel( tbl_broker, 'U','Sub-item' );
          datm_main.db_broker.Commit;
        end;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
    end;
    tbl_siscomex.Close;
    tbl_broker.Close;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.grava_nivel( tabela: TTable; Codigo, Descricao: String );
begin
  with tabela do
  begin
     Append;
     Fields[0].asString := Codigo;
     Fields[1].AsString := Descricao;
     Post;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.AtualizaTaxaCambio( i : Integer );
var lOk : Boolean;
begin
  with datm_AtualizaSISCOMEX do
  begin
    if lCancelar then
    begin
      ProgressBar1.Position := 0;
      Exit;
    end;

    tbl_siscomex.Close;
    tbl_broker.Close;

    tbl_siscomex.TableName     := aTabelaSISCOMEX[i];
    tbl_broker.TableName       := 'TTAXA_CAMBIO';
    tbl_broker.IndexFieldNames := 'CD_MOEDA;DT_INICIO_VIGENCIA;DT_TERMINO_VIGENCIA';

    tbl_siscomex.Open;

    try
      tbl_broker.Open;
    except
      if ( i = 30 ) and ( chkBox_limpar.Checked ) then
        lbl_mensagem.Caption:= 'Você optou por limpar a Tabela previamente. Verifique se outro usuario esta usando o sistema.';
      ProgressBar1.Position := 0;
      Exit;
    end;

    lbl_mensagem.Caption:= 'Atualizando Tabela ' + Lista_tabelas.Items.Strings[i] + '... ';
    Application.ProcessMessages;

    while Not( tbl_siscomex.EOF ) do
    begin
      if (tbl_siscomex.FieldByName('CODIGO').AsString <> '790') or chkBox_limpar.Checked then // Não atualizar a moeda Real - Michel - 06/02/2014
      begin
        Inc( nRegistros );
        lbl_nr_Registros.Caption := IntToStr( nRegistros );

        if tbl_siscomex.FieldByName( 'CODIGO' ).AsString > '500' then
          Application.ProcessMessages;

        aCampos[0] := tbl_siscomex.FieldByName( 'CODIGO' ).AsString;
        aCampos[1] := tbl_siscomex.FieldByName( 'VIGENCIA_INICIO_TAXA' ).AsString;
        aCampos[2] := tbl_siscomex.FieldByName( 'VIGENCIA_FIM_TAXA' ).AsString;

        lOk := False;
        if i = 31 then // Histórico - Verifica se possui data do dia seguinte
        begin
          if ( StrToDate( tbl_siscomex.Fields[3].AsString ) = dt_server + 1 ) or
             ( ( StrToDate( tbl_siscomex.Fields[3].AsString ) = dt_server + 3 ) and ( DayOfWeek( dt_server ) = 6 ) ) then
            lOk := True;
        end
        else
        begin
          lOk := True;
        end;

        if lOk then
        begin
          if tbl_broker.FindKey([ aCampos[0], aCampos[1], aCampos[2] ]) then
          begin
            Inc( nAtualizacoes );
            lbl_nr_Atualizacoes.Caption := IntToStr( nAtualizacoes );
            tbl_broker.Edit;
          end
          else
          begin
            Inc( nInsercoes );
            lbl_nr_Insercoes.Caption := IntToStr( nInsercoes );
            tbl_broker.Append;
            tbl_broker.Fields[0].AsString := tbl_siscomex.Fields[0].AsString;
          end;

          // Processa todos os registros
          tbl_broker.Fields[0].AsString := tbl_siscomex.Fields[0].AsString;
          if (tbl_siscomex.FieldByName('CODIGO').AsString = '790') then
            tbl_broker.Fields[3].AsString := '1'
          else
            tbl_broker.Fields[3].AsString := tbl_siscomex.Fields[2].AsString;
          tbl_broker.Fields[1].AsString := tbl_siscomex.Fields[3].AsString;
          tbl_broker.Fields[2].AsString := tbl_siscomex.Fields[4].AsString;
          tbl_broker.Post;
          // Passa o controle para o Windows NT
          Application.ProcessMessages;

          if lCancelar then
          begin
            tbl_siscomex.Last;
          end;

        end;
      end;
      
      // Próximo
      tbl_siscomex.Next;
    end;

    tbl_siscomex.Close;
    tbl_broker.Close;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.AtualizaTabelaComVariasChaves( i : Integer );
var
  j : Integer;
begin
  with datm_AtualizaSISCOMEX do
  begin
    if lCancelar then
    begin
      ProgressBar1.Position := 0;
      Exit;
    end;

    tbl_siscomex.Close;
    tbl_broker.Close;

    tbl_siscomex.TableName     := aTabelaSISCOMEX[i];
    tbl_broker.TableName       := aTabelaBroker[i];
    tbl_broker.IndexFieldNames := aTabelaINDICE[i];

    tbl_siscomex.Open;

    try
      tbl_broker.Open;
    except
      if chkBox_limpar.Checked then
      lbl_mensagem.Caption:= 'Você optou por limpar a Tabela previamente. Verifique se outro usuario esta usando o sistema.';
      ProgressBar1.Position := 0;
      Exit;
    end;

    if chkBox_limpar.Checked then ApagaTabela(i);

    lbl_mensagem.Caption:= 'Atualizando Tabela '+ Lista_tabelas.Items.Strings[i] +'... ';
    Application.ProcessMessages;

    while Not( tbl_siscomex.EOF ) do
    begin
      Inc( nRegistros );
      lbl_nr_Registros.Caption := IntToStr( nRegistros );

      if i = 26 then
      begin
        aCampos[0] := tbl_siscomex.FieldByName( 'ORGAO' ).AsString;
        aCampos[1] := tbl_siscomex.FieldByName( 'RECINTO' ).AsString;
        aCampos[2] := tbl_siscomex.FieldByName( 'SETOR' ).AsString;
      end;

      if i = 3 then
      begin
        aCampos[0] := tbl_siscomex.FieldByName( 'CD_NOMENC_NCM' ).AsString;
        aCampos[1] := tbl_siscomex.FieldByName( 'CD_ATRIBUTO_NCM' ).AsString;
      end;

      if i = 8 then
      begin
        aCampos[0] := tbl_siscomex.FieldByName( 'CD_NOMENC_NCM' ).AsString;
        aCampos[1] := tbl_siscomex.FieldByName( 'CD_ATRIBUTO_NCM' ).AsString;
        aCampos[2] := tbl_siscomex.FieldByName( 'CD_ESPECIF_NCM' ).AsString;
      end;

      if ( i = 3 ) then
      begin
        if tbl_broker.FindKey([ aCampos[0], aCampos[1] ]) then
        begin
          Inc( nAtualizacoes );
          lbl_nr_Atualizacoes.Caption := IntToStr( nAtualizacoes );
          tbl_broker.Edit;
        end
        else
        begin
          Inc( nInsercoes );
          lbl_nr_Insercoes.Caption := IntToStr( nInsercoes );
          tbl_broker.Append;
          tbl_broker.fields[0].AsString := tbl_siscomex.Fields[0].AsString;
        end;
      end
      else
      begin
        if tbl_broker.FindKey([ aCampos[0], aCampos[1], aCampos[2] ]) then
        begin
          Inc( nAtualizacoes );
          lbl_nr_Atualizacoes.Caption := IntToStr( nAtualizacoes );
          tbl_broker.Edit;
        end
        else
        begin
          Inc( nInsercoes );
          lbl_nr_Insercoes.Caption := IntToStr( nInsercoes );
          tbl_broker.Append;
          tbl_broker.fields[0].AsString := tbl_siscomex.Fields[0].AsString;
        end;
      end;

      // Processa todos os registros
      for j := 1 to tbl_siscomex.FieldDefs.Count - 1 do
      begin
        tbl_broker.fields[j].AsString := tbl_siscomex.Fields[j].AsString;
        // Passa o controle para o Windows NT
        Application.ProcessMessages;
      end;

      tbl_broker.Post;

      // Passa o controle para o Windows NT
      Application.ProcessMessages;

      if lCancelar then
      begin
        tbl_siscomex.Last;
      end;

      // Próximo
      tbl_siscomex.Next;
    end;

    tbl_siscomex.Close;
    tbl_broker.Close;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.AtualizaTodas;
var
  i : Integer;
begin
  with datm_AtualizaSISCOMEX do
  begin
    // Verifica qual tabela da Lista esta selecionada e manda processar a atualização
    for i := 0 To Lista_tabelas.Items.Count - 1 do
    begin
      ProgressBar1.Position := i;
      lbl_mensagem.Caption:= 'Acessando SQL Server ... ';
      Application.ProcessMessages;

      // Incrementa o contador de tabelas processadas
      Inc( nTabelas );

      // Atualizaja a display na janela
      lbl_nr_Tabelas.Caption := IntToStr( nTabelas );

      // Dispara a atualização da Tabela
      AtualizaTabela(i);

      // Passa o controle para o NT
      Application.ProcessMessages;

      if lCancelar then
      begin
        ProgressBar1.Position := 0;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.AtualizaEsp;
var
  i : Integer;
begin
  // Verifica qual tabela da Lista esta selecionada e manda processar a atualização
  for i := 0 to Lista_tabelas.Items.Count - 1 do
  begin
    ProgressBar1.Position := i;
    if Lista_tabelas.Checked[i] then
    begin
      lbl_mensagem.Caption:= 'Acessando SQL Server ... ';
      Application.ProcessMessages;

      // Incrementa o contador de tabelas processadas
      Inc( nTabelas );

      // Atualizaja a display na janela
      lbl_nr_Tabelas.Caption := IntToStr( nTabelas );

      // Dispara a atualização da Tabela
      AtualizaTabela(i);

      // Passa o controle para o NT
      Application.ProcessMessages;

    end;

    if lCancelar then
    begin
       ProgressBar1.Position := 0;
       Exit;
    end;
  end
end;

procedure Tfrm_AtualizaSISCOMEX.btn_atualizarClick(Sender: TObject);
begin
  ProgressBar1.Max := Lista_tabelas.Items.Count;
  ProgressBar1.Min := 0;
  lCancelar := False;

  btn_atualizar.Enabled := False;
  btn_cancelar.Enabled  := True;

  nTabelas      := 0;
  nRegistros    := 0;
  nInsercoes    := 0;
  nAtualizacoes := 0;

  lbl_nr_tabelas.Caption      := IntToStr( nTabelas );
  lbl_nr_registros.Caption    := IntToStr( nRegistros );
  lbl_nr_insercoes.Caption    := IntToStr( nInsercoes );
  lbl_nr_atualizacoes.Caption := IntToStr( nAtualizacoes );

  lbl_mensagem.Caption:= 'Iniciando atualização ... ';
  Application.ProcessMessages;

  case rgrp_opcao.ItemIndex of
  0 : AtualizaTodas;
  1 : begin
        if UsuarioSelecionou then
           AtualizaEsp
        else
        begin
          lbl_mensagem.Caption:= 'Nenhuma tabela foi selecionada.';
          Application.ProcessMessages;
        end;
      end;
  end;

  ProgressBar1.Position := 0;
  lbl_mensagem.Caption:= 'Atualização finalizada.';
  Application.ProcessMessages;

  if rgrp_opcao.ItemIndex = 1 then DesmarcarTodas;

  btn_atualizar.Enabled := False;
  btn_cancelar.Enabled  := False;
  btn_fechar.SetFocus;
end;

procedure Tfrm_AtualizaSISCOMEX.btn_fecharClick(Sender: TObject);
begin
  with datm_AtualizaSISCOMEX do
  begin
    lCancelar := False;
    with frm_AtualizaSISCOMEX do
    begin
      tbl_siscomex.Close;
      tbl_broker.Close;
      db_siscomex.Close;
    end;
    Close;
    Release;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // datm_AtualizaSISCOMEX.Destroy;
  datm_AtualizaSISCOMEX.Free;
  Action := caFree;
end;

procedure Tfrm_AtualizaSISCOMEX.FormShow(Sender: TObject);
begin
  str_nr_processo := str_proc_zeros;
end;

procedure Tfrm_AtualizaSISCOMEX.btn_cancelarClick(Sender: TObject);
begin
  lbl_mensagem.Caption:= 'Atualização abortada. Tabelas Ok!';
  Application.ProcessMessages;

  btn_atualizar.Enabled := True;
  btn_cancelar.Enabled  := False;

  lCancelar := True;
end;

procedure Tfrm_AtualizaSISCOMEX.AtualizaTabela( i : Integer );
begin
  case i of
    0, 5: begin  // Acréscimo/Dedução
            AtualizaTabelaComUmCampoChave(i);
            AtualizaTabelaDI(i);
          end;
    1, 2, 4, 6, 7, 9, 10, 11, 12, 13,
    14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29, 32, 33, 34, 35 : AtualizaTabelaComUmCampoChave(i);
    3, 8, 26 : AtualizaTabelaComVariasChaves(i);
    30 : begin
           AtualizaTabelaComUmCampoChave(i);
           AtualizaTaxaCambio(i);
         end;
    31 : begin
           AtualizaTaxaCambio(i);
         end;
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.rgrp_opcaoClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to Lista_tabelas.Items.Count - 1 do
  begin
    Lista_tabelas.Checked[i] := rgrp_opcao.ItemIndex = 0;
  end;

  if rgrp_opcao.ItemIndex = 0 then
  begin
    Lista_tabelas.Font.Color := clGray;
    Lista_tabelas.Enabled    := False;
    btn_atualizar.Enabled    := True;
  end
  else
  begin
    Lista_tabelas.Font.Color := clWindowText;
    Lista_tabelas.Enabled    := True;
    btn_atualizar.Enabled    := False;
  end
end;

procedure Tfrm_AtualizaSISCOMEX.chkBox_limparClick(Sender: TObject);
begin
  if chkBox_limpar.Checked then gbox_monitor.SetFocus;
end;

procedure Tfrm_AtualizaSISCOMEX.Lista_tabelasClick(Sender: TObject);
begin
  if rgrp_opcao.ItemIndex = 1 then
  begin
    if UsuarioSelecionou then
    begin
      btn_atualizar.Enabled := True;
    end
    else
    begin
      btn_atualizar.Enabled := False;
    end
  end;
end;

procedure Tfrm_AtualizaSISCOMEX.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_AtualizaSISCOMEX, datm_AtualizaSISCOMEX);
end;

Initialization

  nTabelas      := 0;
  nRegistros    := 0;
  nInsercoes    := 0;
  nAtualizacoes := 0;

  aTabelaSISCOMEX[0] := 'TAB_ACRESC_VR_ADUANEIRA';
  aTabelaBroker[0]   := 'TACRESCIMO';
  aTabelaINDICE[0]   := 'CODIGO';

  aTabelaSISCOMEX[1] := 'TAB_ALADI';
  aTabelaBroker[1]   := 'TAB_ALADI';
  aTabelaINDICE[1]   := 'CODIGO';

  aTabelaSISCOMEX[2] := 'TAB_ATIV_ECONOMICA';
  aTabelaBroker[2]   := 'TAB_ATIV_ECONOMICA';
  aTabelaINDICE[2]   := 'CODIGO';

  aTabelaSISCOMEX[3] := 'TAB_ATRIB_VALORACAO_NVE';
  aTabelaBroker[3]   := 'TATRIB_VALORACAO_NVE';
  aTabelaINDICE[3]   := 'CD_NOMENC_NCM;CD_ATRIBUTO_NCM';

  aTabelaSISCOMEX[4] := 'TAB_CAPITULO';
  aTabelaBroker[4]   := 'TAB_CAPITULO';
  aTabelaINDICE[4]   := 'CODIGO';

  aTabelaSISCOMEX[5] := 'TAB_DEDUCAO_VR_ADUANEIRA';
  aTabelaBroker[5]   := 'TDEDUCAO';
  aTabelaINDICE[5]   := 'CODIGO';

  aTabelaSISCOMEX[6] := 'TAB_DOC_INSTRUÇAO_DESPACHO';
  aTabelaBroker[6]   := 'TDOC_INSTRUCAO_DESPACHO';
  aTabelaINDICE[6]   := 'CODIGO';

  aTabelaSISCOMEX[7] := 'TAB_TP_EMBALAGEM';
  aTabelaBroker[7]   := 'TTP_EMBALAGEM';
  aTabelaINDICE[7]   := 'CODIGO';

  aTabelaSISCOMEX[8] := 'TAB_ESPECIF_VALORACAO_NVE';
  aTabelaBroker[8]   := 'TAB_ESPECIF_VALORACAO_NVE';
  aTabelaINDICE[8]   := 'CD_NOMENC_NCM;CD_ATRIBUTO_NCM;CD_ESPECIF_NCM';

  aTabelaSISCOMEX[9] := 'TAB_FUND_LEG_REG_TRIBUT';
  aTabelaBroker[9]   := 'TFUND_LEG_REG_TRIBUT';
  aTabelaINDICE[9]   := 'CODIGO';

  aTabelaSISCOMEX[10] := 'TAB_FUND_LEGAL_PIS_COFINS';
  aTabelaBroker[10]   := 'TFUND_LEG_TRIB_PIS_COFINS';
  aTabelaINDICE[10]   := 'CODIGO';

  aTabelaSISCOMEX[11] := 'TAB_INCOTERMS_VENDA';
  aTabelaBroker[11]   := 'TINCOTERMS_VENDA';
  aTabelaINDICE[11]   := 'CODIGO';

  aTabelaSISCOMEX[12] := 'TAB_INST_FINANC_INTERNACIONAL';
  aTabelaBroker[12]   := 'TINST_FINANC_INTERNACIONAL';
  aTabelaINDICE[12]   := 'CODIGO';

  aTabelaSISCOMEX[13] := 'TAB_METODO_VALOR_ADUANEIRA';
  aTabelaBroker[13]   := 'TMETODO_VALOR_ADUANEIRA';
  aTabelaINDICE[13]   := 'CODIGO';

  aTabelaSISCOMEX[14] := 'TAB_MODALID_PAGAMENTO';
  aTabelaBroker[14]   := 'TMODALID_PAGAMENTO';
  aTabelaINDICE[14]   := 'CODIGO';

  aTabelaSISCOMEX[15] := 'TAB_MOEDA';
  aTabelaBroker[15]   := 'TMOEDA_BROKER';
  aTabelaINDICE[15]   := 'CODIGO';

  aTabelaSISCOMEX[16] := 'TAB_MOT_ADMISSAO_TEMP';
  aTabelaBroker[16]   := 'TMOT_ADMISSAO_TEMP';
  aTabelaINDICE[16]   := 'CODIGO';

  aTabelaSISCOMEX[17] := 'TAB_MOT_SEM_COBERT_CAMBIAL';
  aTabelaBroker[17]   := 'TMOT_SEM_COBERT_CAMBIAL';
  aTabelaINDICE[17]   := 'CODIGO';

  aTabelaSISCOMEX[18] := 'TAB_NALADINCCA';
  aTabelaBroker[18]   := 'TNALADINCCA';
  aTabelaINDICE[18]   := 'CODIGO';

  aTabelaSISCOMEX[19] := 'TAB_NALADISH';
  aTabelaBroker[19]   := 'TNALADISH';
  aTabelaINDICE[19]   := 'CODIGO';

  aTabelaSISCOMEX[20] := 'TAB_NCM';
  aTabelaBroker[20]   := 'TNCM';
  aTabelaINDICE[20]   := 'CODIGO';

  aTabelaSISCOMEX[21] := '';
  aTabelaBroker[21]   := 'TAB_NIVEL';
  aTabelaINDICE[21]   := '';

  aTabelaSISCOMEX[22] := 'TAB_ORGAO_EMISS_ATO_LEGAL';
  aTabelaBroker[22]   := 'TORGAO_EMISS_ATO_LEGAL';
  aTabelaINDICE[22]   := 'CODIGO';

  aTabelaSISCOMEX[23] := 'TAB_ORGAO_ANUENTES';
  aTabelaBroker[23]   := 'TORGAO_ANUENTES';
  aTabelaINDICE[23]   := 'CODIGO';

  aTabelaSISCOMEX[24] := 'TAB_PAIS';
  aTabelaBroker[24]   := 'TPAIS';
  aTabelaINDICE[24]   := 'CODIGO';

  aTabelaSISCOMEX[25] := 'TAB_REC_ALFANDEGADO';
  aTabelaBroker[25]   := 'TREC_ALFANDEGADO';
  aTabelaINDICE[25]   := 'CODIGO';

  aTabelaSISCOMEX[26] := 'TAB_RECINTO_SETORES_IMPORTACAO';
  aTabelaBroker[26]   := 'TRECINTO_SETORES_IMPORTACAO';
  aTabelaINDICE[26]   := 'ORGAO;RECINTO;SETOR';

  aTabelaSISCOMEX[27] := 'TAB_RECIPIENTE';
  aTabelaBroker[27]   := 'TRECIPIENTE';
  aTabelaINDICE[27]   := 'CODIGO';

  aTabelaSISCOMEX[28] := 'TAB_REG_TRIBUTARIO';
  aTabelaBroker[28]   := 'TREG_TRIBUTARIO';
  aTabelaINDICE[28]   := 'CODIGO';

  aTabelaSISCOMEX[29] := 'TAB_AGENCIA_SECEX';
  aTabelaBroker[29]   := 'TAB_AGENCIA_SECEX';
  aTabelaINDICE[29]   := 'CODIGO';

  aTabelaSISCOMEX[30] := 'TAB_CONVERSAO_CAMBIO';
  aTabelaBroker[30]   := 'TCONVERSAO_CAMBIO';
  aTabelaINDICE[30]   := 'CODIGO';

  aTabelaSISCOMEX[31] := 'TAB_CONVERSAO_CAMBIO_HIST';
  aTabelaBroker[31]   := 'TCONVERSAO_CAMBIO';
  aTabelaINDICE[31]   := 'CODIGO';

  aTabelaSISCOMEX[32] := 'TAB_TP_ATO_LEGAL';
  aTabelaBroker[32]   := 'TTP_ATO_LEGAL';
  aTabelaINDICE[32]   := 'CODIGO';

  aTabelaSISCOMEX[33] := 'TAB_TIPO_DECLARACAO';
  aTabelaBroker[33]   := 'TTIPO_DECLARACAO';
  aTabelaINDICE[33]   := 'CODIGO';

  aTabelaSISCOMEX[34] := 'TAB_UNID_MEDIDA';
  aTabelaBroker[34]   := 'TUNID_MEDIDA_BROKER';
  aTabelaINDICE[34]   := 'CD_UNID_MEDIDA';

  aTabelaSISCOMEX[35] := 'TAB_URF';
  aTabelaBroker[35]   := 'TURF';
  aTabelaINDICE[35]   := 'CODIGO';


end.
