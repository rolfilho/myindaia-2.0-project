unit uAgendaComercial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ComCtrls, ExtCtrls, Mask, ToolEdit, RXDBCtrl, Buttons,
  Grids, DBGrids, DB, Menus,DbTables, ppBands, ppCache, ppClass, ppEndUsr,
  ppComm, ppRelatv, ppProd, ppReport, ppTypes, ppModule, raCodMod, ppMemo,
  ppStrtch, ppRegion, ppVar, ppCtrls, ppPrnabl, ppParameter, Funcoes;

type
  Tfrm_agenda_comercial = class(TForm)
    pgctrl_agenda_comercial: TPageControl;
    ts_consulta_ag: TTabSheet;
    DBGrid_agenda_comerc: TDBGrid;
    Panel3: TPanel;
    Label31: TLabel;
    Label1: TLabel;
    btn_co_vendedor: TSpeedButton;
    msk_cd_vendedor: TMaskEdit;
    edt_nm_vendedor: TEdit;
    ts_mov_ag: TTabSheet;
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    DateEditData: TDateEdit;
    DBGrid_agenda_semanal: TDBGrid;
    DBGrid_agenda_mensal: TDBGrid;
    lb_mes: TLabel;
    Edit_agenda_mes: TEdit;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_Cancelar: TMenuItem;
    mi_Excluir: TMenuItem;
    mi_Sair: TMenuItem;
    btn_print_: TSpeedButton;
    pp_agenda: TppReport;
    ppDesigner: TppDesigner;
    msk_cd_unid_neg: TMaskEdit;
    Label2: TLabel;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    edit_nm_usuario: TEdit;
    Label7: TLabel;
    Panel1: TPanel;
    rdgrp_tp_agenda: TRadioGroup;
    pnl_semana: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditData2: TEdit;
    EditData1: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    btn_co_vend: TSpeedButton;
    Label11: TLabel;
    btn_co_proc_comerc: TSpeedButton;
    dbrg_in_periodo: TDBRadioGroup;
    dbedt_cd_vendedor: TDBEdit;
    dbedt_nm_vendedor: TDBEdit;
    DBRadioGroup_tp_agenda: TDBRadioGroup;
    dbedt_hr_agenda: TDBEdit;
    dbedt_cliente: TDBEdit;
    DBDateEdit_DT_agenda: TDBDateEdit;
    dbedt_nm_Cliente: TDBEdit;
    dbedt_contato: TDBEdit;
    Label4: TLabel;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppRegion1: TppRegion;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppDBMemo1: TppDBMemo;
    ppLabel2: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppFooterBand1: TppFooterBand;
    raCodeModule1: TraCodeModule;
    Label12: TLabel;
    dbmemo_obs_agenda: TDBMemo;
    pnl2: TPanel;
    dbgrid_mov_agenda: TDBGrid;
    pnl: TPanel;
    shp2: TShape;
    shp3: TShape;
    lbl1: TLabel;
    shp4: TShape;
    lbl2: TLabel;
    shp5: TShape;
    lbl3: TLabel;
    shp6: TShape;
    lbl4: TLabel;
    shp7: TShape;
    lbl5: TLabel;
    pnl1: TPanel;
    shp1: TShape;
    txt1: TStaticText;
    lbl6: TLabel;
    pnl3: TPanel;
    chkCancelada: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_vendedorClick(Sender: TObject);
    procedure msk_cd_vendedorExit(Sender: TObject);
    procedure encontrar_semana(st_ano_num:string; int_mes_corrente:integer;st_dia_sem:string);
    procedure verificar_semana(int_dias_mes_atual:integer;st_dia_sem:string;int_dias_mes_ant:integer);
    procedure verificar_dia(int_dia_min:integer; int_dia_max:integer;
                             int_qta_dias_ant:integer;int_qta_dias_post:integer;int_dias_mes_ant:integer);
    procedure rdgrp_tp_agendaClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_agenda_comercialChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure DateEditDataExit(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure btn_co_proc_comercClick(Sender: TObject);
    procedure dbedt_clienteExit(Sender: TObject);
    procedure dbedt_cd_vendedorExit(Sender: TObject);
    procedure btn_co_vendClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_cd_vendedorChange(Sender: TObject);
    procedure dbrg_in_periodoClick(Sender: TObject);
    procedure DBRadioGroup_tp_agendaClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure msk_cd_vendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_mov_agendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Dt_agendaChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dbmemo_obs_agendaChange(Sender: TObject);
    procedure btn_print_Click(Sender: TObject);
    procedure pgctrl_agenda_comercialChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure chkCanceladaClick(Sender: TObject);
  private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    in_salva,st_modificar, st_incluir, st_excluir: Boolean;
    procedure Cancelar;
    function Consiste : Boolean;
    function Grava    : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function VerAlt   : Boolean;
 //   procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );

  public
    { Public declarations }
  end;

var
  frm_agenda_comercial: Tfrm_agenda_comercial;
  st_dia_semana,st_ano_numero:string;//variaveis para o verificar o
  int_dia_numero:integer;          //intervalo da semana da data desejada
  int_mes_numero:integer;
  vIncluiu: Boolean;

implementation

uses dAgendaComercial, GSMLIB, PGSM096, PGSM018, PGGP001, PGGP017, {PGSM265, }ConsOnLineEx{, PGSM990}, PGSM024,
  PGSM990;

{$R *.DFM}

procedure Tfrm_agenda_comercial.FormCreate(Sender: TObject);
begin
  st_modificar:=false;
  st_incluir:=false;
  st_excluir:=false;
  in_salva  :=false;
  vIncluiu := false;
  Application.CreateForm(Tdatm_agenda_comercial, datm_agenda_comercial);
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  msk_cd_unid_neg.Text := ConsultaLookUPSQL('SELECT (U.CD_UNID_NEG) AS UNID FROM TUSUARIO_HABILITACAO UH (nolock) ' +
                                            ' LEFT JOIN TUNID_NEG U  ON (U.CD_UNID_NEG = UH.CD_UNID_NEG) ' +
                                            ' WHERE UH.CD_USUARIO= ''' + str_cd_usuario + ''' AND ' +
                                            ' UH.IN_DEFAULT= "1" ', 'UNID');
  if msk_cd_unid_neg.Text = '' then msk_cd_unid_neg.Text := '01';

  edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'AP_UNID_NEG');

  {  with datm_agenda_comercial do
   begin
     qry_traz_default_.Close;
     qry_traz_default_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
     qry_traz_default_.Prepare;
     qry_traz_default_.Open;
     msk_cd_unid_neg.text:=qry_traz_default_CD_UNID_NEG.AsString;
     edt_nm_unid_neg.text:=qry_traz_default_NM_UNID_NEG.AsString;


   end;}
 edit_nm_usuario.text:= str_nm_usuario;
 btn_mi(st_incluir,false,false,st_excluir);
 pgctrl_agenda_comercial.ActivePage:=ts_consulta_ag;

 DateEditData.Date := Now;
end;

procedure Tfrm_agenda_comercial.msk_cd_unid_negExit(Sender: TObject);
begin
{ with datm_agenda_comercial do
  begin
    if msk_cd_unid_neg.text <> '' then
     begin
       ValCodEdt( msk_cd_unid_neg );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG ');
       qry_pesquisa_.Sql.Add('WHERE IN_ATIVO = "1" AND CD_UNID_NEG="'+ msk_cd_unid_neg.text +'"');
       qry_pesquisa_.Sql.Add(' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG');
       qry_pesquisa_.Sql.Add(' from TUSUARIO_HABILITACAO where CD_USUARIO ="'+str_cd_usuario+'")');
       qry_pesquisa_.Active:=true;

      if qry_pesquisa_.RecordCount > 0  then
        begin
         edt_nm_unid_neg.text:=qry_pesquisa_.Fields[0].AsString;
         qry_pesquisa_.Close;
        end
       else
        begin
         edt_nm_unid_neg.text:='';
         qry_pesquisa_.Close;
         BoxMensagem('Unidade não Habilitada ou Código Inválido!',2);
         msk_cd_unid_neg.SetFocus;
        end;
     end
    else edt_nm_unid_neg.text:='';
 end;  }
   // Unidade
  if (Trim(msk_cd_unid_neg.text) <> '') then begin
    msk_cd_unid_neg.Text :=  Copy('00' , 1, 2- Length(Trim(msk_cd_unid_neg.Text))) + Trim(msk_cd_unid_neg.Text);
    edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT U.AP_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                              '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                              ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                              '   AND U.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ' +
                                              'GROUP BY U.CD_UNID_NEG, U.AP_UNID_NEG',
                                              'AP_UNID_NEG');

    if edt_nm_unid_neg.text = '' then begin
      ShowMessage('Unidade de Negócio não cadastrada ou Usuário sem direitos de acesso!');
      msk_cd_unid_neg.Text := '';
      edt_nm_unid_neg.Text := '';
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

  end;

end;

procedure Tfrm_agenda_comercial.btn_co_unid_negClick(Sender: TObject);
begin
{
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);

  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;

//  vStr_cd_modulo := '01';
//  str_cd_rotina := '0102';

msk_cd_unid_negExit(nil); }

  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineExSQL('SELECT (U.CD_UNID_NEG) AS UNID, U.NM_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                                '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                                '  WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                                'GROUP BY U.CD_UNID_NEG, U.NM_UNID_NEG '  ,
                                                'Unidades de Negócio', ['UNID', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'UNID', nil, msk_cd_unid_neg.text )
  else
    edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT U.AP_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                              '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                              ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                              '   AND U.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ' +
                                              'GROUP BY U.AP_UNID_NEG',
                                              'AP_UNID_NEG');



end;

procedure Tfrm_agenda_comercial.btn_co_vendedorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_vendedor.Text := ConsultaOnLineEx('TVENDEDOR','Vendedores',['CD_VENDEDOR','NM_VENDEDOR'],['Código','Nome'],'CD_VENDEDOR',nil)
  else
    edt_nm_vendedor.Text := ConsultaLookUP('TVENDEDOR','CD_VENDEDOR', msk_cd_vendedor.Text,'NM_VENDEDOR')

{  Cons_On_line_Texto( 'DBBROKER', 'TVENDEDOR',
                       msk_cd_vendedor, 'Vedndedores', 64, '' );
  msk_cd_vendedorExit(nil); }
end;

procedure Tfrm_agenda_comercial.msk_cd_vendedorExit(Sender: TObject);
begin
{  with datm_agenda_comercial do
  begin
    if msk_cd_vendedor.text <> '' then
    begin

            if DateEditData.text <> '  /  /    ' then  rdgrp_tp_agendaClick(nil);
      ValCodEdt( msk_cd_vendedor );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_VENDEDOR FROM TVENDEDOR');
      qry_pesquisa_.Sql.Add('WHERE CD_UNID_NEG="'+ msk_cd_unid_neg.text +'"');
      qry_pesquisa_.Sql.Add(' AND CD_VENDEDOR ="'+msk_cd_vendedor.text+'"');
      qry_pesquisa_.Active:=true;
{      if qry_pesquisa_.RecordCount > 0  then
      begin
        edt_nm_vendedor.text:=qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
          qry_agenda_comercial_.Close;
          qry_agenda_comercial_.ParamByName('CD_VENDEDOR').AsString:=msk_cd_vendedor.text;
          qry_agenda_comercial_.ParamByName('DT_AGENDA').AsDate  := StrToDate( DateEditData.Text );  //DateEditData.Text;
          qry_agenda_comercial_.Open;


      end
      else
      begin
        edt_nm_vendedor.text:='';
        qry_pesquisa_.Close;
        BoxMensagem('Vendedor não Habilitado para a Unidade de Negócio ou Código Inválido!',2);
        msk_cd_vendedor.SetFocus;
      end;
    end;
    else edt_nm_unid_neg.text:='';
  end; }

  if msk_cd_vendedor.text <> '' then begin
    msk_cd_vendedor.Text := Copy('0000', 1, 4 - Length(msk_cd_vendedor.text)) + msk_cd_vendedor.text;
    edt_nm_vendedor.Text := ConsultaLookUPSQL('SELECT NM_VENDEDOR FROM TVENDEDOR (NOLOCK) ' +
                                              ' WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.text + '" ' +
                                              '   AND CD_VENDEDOR = "' + msk_cd_vendedor.text + '" ', 'NM_VENDEDOR');

    if edt_nm_vendedor.Text = '' then begin
      edt_nm_vendedor.text:='';
      ShowMessage('Vendedor não Habilitado para a Unidade de Negócio ou Código Inválido!');
      msk_cd_vendedor.SetFocus;
    end else begin
      if DateEditData.text <> '  /  /    ' then begin
       { with datm_agenda_comercial do begin
          qry_agenda_comercial_.Close;
          qry_agenda_comercial_.ParamByName('CD_VENDEDOR').AsString:= msk_cd_vendedor.text;
          qry_agenda_comercial_.ParamByName('DT_AGENDA').AsDate := StrToDate( DateEditData.Text );
          qry_agenda_comercial_.Open;
        end; }
        rdgrp_tp_agendaClick(nil);
      end;
    end;
  end;
end;

procedure Tfrm_agenda_comercial.encontrar_semana(st_ano_num: string;
  int_mes_corrente: integer; st_dia_sem: string);

 var

     int_dias_mes_anterior,int_dias_mes_posterior:integer;//quantidade de dias dos meses anteriores posteriores

     int_dia_mes_corrente:integer;


  begin
 case int_mes_corrente of
   1: begin
        int_dia_mes_corrente:=31;  int_dias_mes_anterior:=31; //int_dias_mes_posterior:=28;
        verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
   2: begin
        if (StrToInt(st_ano_numero) MOD 4 = 0 )then
         begin
           int_dia_mes_corrente:=29;  int_dias_mes_anterior:=31;//int_dias_mes_posterior:=31;
           verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
         end
         else
           begin
             int_dia_mes_corrente:=28;  int_dias_mes_anterior:=31;//int_dias_mes_posterior:=31;
             verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
           end;
       end;
    3:begin
        int_dia_mes_corrente:=31;  int_dias_mes_anterior:=28;//int_dias_mes_posterior:=30;
        verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
    4: begin
         int_dia_mes_corrente:=30; int_dias_mes_anterior:=31;//int_dias_mes_posterior:=31;
         verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
     5: begin
         int_dia_mes_corrente:=31; int_dias_mes_anterior:=30;//int_dias_mes_posterior:=30;
         verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
     6: begin
         int_dia_mes_corrente:=30; int_dias_mes_anterior:=31;//int_dias_mes_posterior:=31;
         verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
    7: begin
         int_dia_mes_corrente:=31; int_dias_mes_anterior:=30;//int_dias_mes_posterior:=31;
         verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
     8: begin
          int_dia_mes_corrente:=30;int_dias_mes_anterior:=31;//int_dias_mes_posterior:=30;
          verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
     9: begin
          int_dia_mes_corrente:=30;int_dias_mes_anterior:=30;//int_dias_mes_posterior:=31;
          verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
     10: begin
          int_dia_mes_corrente:=31;int_dias_mes_anterior:=30;//int_dias_mes_posterior:=30;
          verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
      11: begin
          int_dia_mes_corrente:=30;int_dias_mes_anterior:=31;//int_dias_mes_posterior:=31;
          verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;
      12: begin
          int_dia_mes_corrente:=31;int_dias_mes_anterior:=30;//int_dias_mes_posterior:=31;
          verificar_semana(int_dia_mes_corrente, st_dia_semana, int_dias_mes_anterior);
      end;

 end;
end;

procedure Tfrm_agenda_comercial.verificar_dia(int_dia_min, int_dia_max,
  int_qta_dias_ant, int_qta_dias_post, int_dias_mes_ant: integer);

  var

     int_dia_num_posterior:integer;
     int_dia_num_anterior:integer;
     st_dia_posterior:string;
     st_dia_anterior:string;
begin
              if (int_dia_numero >= int_dia_min) AND (int_dia_numero <= (int_dia_max)) then
                  begin
                      int_dia_num_anterior:=int_dia_numero - (int_dia_min - 1);
                      st_dia_anterior:=IntToStr(int_dia_num_anterior)+ ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;

                      int_dia_num_posterior:=int_dia_numero + int_qta_dias_post;
                      st_dia_posterior:=IntToStr(int_dia_num_posterior)+ ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;

                      EditData1.text:=FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_anterior));
                      EditData2.text:=FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_posterior));
                  end
                else
                  if(int_dia_numero < int_dia_min)then
                    begin
                     if (int_mes_numero = 1) then
                       begin
                         int_dia_num_posterior:= int_qta_dias_post + int_dia_numero;
                         st_dia_posterior:= IntToStr(int_dia_num_posterior) + ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;

                         EditData2.text:= FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_posterior));

                         int_dia_num_anterior:= int_dias_mes_ant - (int_dia_min -  int_dia_numero) + 1;
                         int_mes_numero:= 12;
                         st_ano_numero:= IntToStr(StrToInt(st_ano_numero) - 1);
                         st_dia_anterior:= IntToStr(int_dia_num_anterior)+ ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;


                         EditData1.text:= FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_anterior));
                        end
                      else
                      begin
                         int_dia_num_posterior:= int_qta_dias_post + int_dia_numero;
                         st_dia_posterior:= IntToStr(int_dia_num_posterior) + ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;

                         EditData2.text:= FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_posterior));

                         int_dia_num_anterior:= int_dias_mes_ant - (int_dia_min -  int_dia_numero) + 1;
                         int_mes_numero:= int_mes_numero - 1;

                         st_dia_anterior:= IntToStr(int_dia_num_anterior)+ ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;


                         EditData1.text:= FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_anterior));
                        end;


                 end
                  else
                     if(int_dia_numero > (int_dia_max)) then  //(int_dia_max - int_qta_dias_post

                          if (int_mes_numero = 12) then
                           begin
                           int_dia_num_anterior:= int_dia_numero - int_dia_min + 1;
                           st_dia_anterior:=IntToStr(int_dia_num_anterior)+ ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;

                           EditData1.text:=FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_anterior));

                           int_dia_num_posterior:= int_qta_dias_post;
                           int_mes_numero:= 1;
                           st_ano_numero:= IntToStr(StrToInt(st_ano_numero) + 1);
                           st_dia_posterior:=IntToStr(int_dia_num_posterior)+ ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;

                           EditData2.text:=FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_posterior));
                        end
                        else
                           begin
                           int_dia_num_anterior:= int_dia_numero - int_dia_min + 1;
                           st_dia_anterior:=IntToStr(int_dia_num_anterior)+ ' / ' +inttostr(int_mes_numero) + ' / '+ st_ano_numero;

                           EditData1.text:=FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_anterior));

                           int_dia_num_posterior:= int_qta_dias_post;
                           int_mes_numero:= int_mes_numero + 1;

                           st_dia_posterior:=IntToStr(int_dia_num_posterior)+ ' /' +inttostr(int_mes_numero) + ' /'+ st_ano_numero;

                           EditData2.text:=FormatDateTime('dd/ mm/ yyyy', StrToDateTime(st_dia_posterior));
                           end;

end;

procedure Tfrm_agenda_comercial.verificar_semana(
  int_dias_mes_atual: integer; st_dia_sem: string;
  int_dias_mes_ant: integer);

  var
     int_qta_dias_anteriores,int_qta_dias_posteriores:integer;

     int_dia_minino,int_dia_maximo:integer;

begin
  if  st_dia_sem ='dom' then
     begin
      int_qta_dias_anteriores:= 6;   int_qta_dias_posteriores:= 0;
      int_dia_minino:= 7;    int_dia_maximo:= int_dias_mes_atual - 0 ;

      verificar_dia(int_dia_minino,int_dia_maximo,int_qta_dias_anteriores,int_qta_dias_posteriores,
                     int_dias_mes_ant);
     end;

  if  st_dia_sem ='sáb' then
     begin
      int_qta_dias_anteriores:= 5;   int_qta_dias_posteriores:= 1;
      int_dia_minino:= 6;    int_dia_maximo:= int_dias_mes_atual - 1;

      verificar_dia(int_dia_minino,int_dia_maximo,int_qta_dias_anteriores,int_qta_dias_posteriores,
                     int_dias_mes_ant);
     end;

     if  st_dia_sem ='sex' then
     begin
      int_qta_dias_anteriores:= 4;   int_qta_dias_posteriores:= 2;
      int_dia_minino:= 5;    int_dia_maximo:= int_dias_mes_atual - 2;

      verificar_dia(int_dia_minino,int_dia_maximo,int_qta_dias_anteriores,int_qta_dias_posteriores,
                     int_dias_mes_ant);
     end;

     if  st_dia_sem ='qui' then
     begin
      int_qta_dias_anteriores:= 3;   int_qta_dias_posteriores:= 3;
      int_dia_minino:= 4;    int_dia_maximo:= int_dias_mes_atual - 3;

      verificar_dia(int_dia_minino,int_dia_maximo,int_qta_dias_anteriores,int_qta_dias_posteriores,
                     int_dias_mes_ant);
     end;

     if  st_dia_sem ='qua' then
     begin
      int_qta_dias_anteriores:= 2;   int_qta_dias_posteriores:= 4;
      int_dia_minino:= 3;    int_dia_maximo:= int_dias_mes_atual - 4;

      verificar_dia(int_dia_minino,int_dia_maximo,int_qta_dias_anteriores,int_qta_dias_posteriores,
                     int_dias_mes_ant);
     end;

     if  st_dia_sem ='ter' then
     begin
      int_qta_dias_anteriores:= 1;   int_qta_dias_posteriores:= 5;
      int_dia_minino:= 2;    int_dia_maximo:= int_dias_mes_atual - 5;

      verificar_dia(int_dia_minino,int_dia_maximo,int_qta_dias_anteriores,int_qta_dias_posteriores,
                     int_dias_mes_ant);
     end;

     if  st_dia_sem ='seg' then
     begin
      int_qta_dias_anteriores:= 0;   int_qta_dias_posteriores:= 6;
      int_dia_minino:= 1;    int_dia_maximo:= int_dias_mes_atual - 6;

      verificar_dia(int_dia_minino,int_dia_maximo,int_qta_dias_anteriores,int_qta_dias_posteriores,
                     int_dias_mes_ant);
     end;

end;

procedure Tfrm_agenda_comercial.rdgrp_tp_agendaClick(Sender: TObject);
begin
 with datm_agenda_comercial do
  begin
   if (msk_cd_vendedor.text= '')  and (DateEditData.text = '  /  /    ') then begin
     ShowMessage('Digite uma data e um vendedor válidos!');
     exit;
   end else if (msk_cd_vendedor.text = '')  and (DateEditData.text <> '  /  /    ') then begin
     ShowMessage('Digite um vendedor válido!');
     exit;
   end else if (msk_cd_vendedor.text <> '')  and (DateEditData.text = '  /  /    ') then begin
     ShowMessage('Digite uma data válida!');
     exit;
   end;

   if rdgrp_tp_agenda.ItemIndex = 0 then  //diario
    begin
     qry_agenda_diaria_.Close;
     qry_agenda_diaria_.ParamByName('CD_VENDEDOR').AsString:=msk_cd_vendedor.text;
     qry_agenda_diaria_.ParamByName('DT_AGENDA').AsDate  := StrToDate( DateEditData.Text );  //DateEditData.Text;
     qry_agenda_diaria_.Open;

     DBGrid_agenda_semanal.Visible:=false;
     DBGrid_agenda_mensal.Visible:=false;
     DBGrid_agenda_comerc.Visible:=true;
     pnl_semana.Visible:=false;
     lb_mes.Visible:=false;
     Edit_agenda_mes.Visible:=false;
    end;
   if rdgrp_tp_agenda.ItemIndex = 1 then //semanal
    begin
     qry_agenda_semanal_.Close;
     qry_agenda_semanal_.ParamByName('CD_VENDEDOR').AsString:=msk_cd_vendedor.text;
     qry_agenda_semanal_.ParamByName('DT_AGENDA1').AsDate:=StrToDate(EditData1.text);
     qry_agenda_semanal_.ParamByName('DT_AGENDA2').AsDate:= StrToDate( EditData2.Text );  //DateEditData.Text;
     qry_agenda_semanal_.Open;

     DBGrid_agenda_semanal.Visible:=true;
     DBGrid_agenda_mensal.Visible:=false;
     DBGrid_agenda_comerc.Visible:=false;

     pnl_semana.Visible:=true;
     lb_mes.Visible:=false;
     Edit_agenda_mes.Visible:=false;
    end;
   if rdgrp_tp_agenda.ItemIndex = 2 then  //mensal
    begin
     qry_agenda_mensal_.Close;
     qry_agenda_mensal_.ParamByName('CD_VENDEDOR').AsString:=msk_cd_vendedor.text;
     qry_agenda_mensal_.ParamByName('MES').AsInteger:= StrToInt(FormatDateTime('mm',StrToDateTime(DateEditData.text)));;
     qry_agenda_mensal_.Open;

     DBGrid_agenda_semanal.Visible:=false;
     DBGrid_agenda_mensal.Visible:=true;
     DBGrid_agenda_comerc.Visible:=false;
     pnl_semana.Visible:=false;
     lb_mes.Visible:=true;
     Edit_agenda_mes.Visible:=true;

    end;
  end;//with
end;

procedure Tfrm_agenda_comercial.btn_incluirClick(Sender: TObject);
begin
 with datm_agenda_comercial do
   begin
    pgctrl_agenda_comercial.ActivePage:=ts_mov_ag;
    pgctrl_agenda_comercialChange(nil);
    
    qry_agenda_comercial_.DisableControls;
    qry_agenda_comercial_.Cancel;
    qry_agenda_comercial_.Append;
    qry_agenda_comercial_.EnableControls;

    qry_agenda_comercial_IN_PARTICULAR.AsString:= '0';//agenda Profissional
    qry_agenda_comercial_IN_PERIODO.AsString:='1'; //primeiro periodo
    qry_agenda_comercial_IN_CANCELADO.AsString:='0';//STATUS..
   end;//with
  btn_mi(false,st_modificar, st_modificar, false);
  DBRadioGroup_tp_agenda.enabled:=true;
  vIncluiu := True;
end;

procedure Tfrm_agenda_comercial.btn_salvarClick(Sender: TObject);
begin
 if not consiste then exit;
 if not grava then exit;
end;

function Tfrm_agenda_comercial.Consiste: Boolean;
begin
  Consiste:=true;
  // vendedor
  if (Trim(dbedt_cd_vendedor.text) = '') or (ConsultaLookUPSQL('SELECT NM_VENDEDOR FROM TVENDEDOR ' +
                                                               'WHERE CD_UNID_NEG="'+ msk_cd_unid_neg.text +'" ' +
                                                               ' AND CD_VENDEDOR ="'+dbedt_cd_vendedor.text+'" ',
                                                               'NM_VENDEDOR') = '') then begin
    ShowMessage('Um Vendedor válido deve ser Inserido.');
    consiste:=false;
    dbedt_cd_vendedor.Setfocus;
  end;
  // cliente
  if datm_agenda_comercial.qry_agenda_comercial_IN_PARTICULAR.AsString = '0' then begin
    if (Trim(dbedt_cliente.text) = '')   then begin
       ShowMessage('O Cliente deve ser Inserido.');
       consiste:=false;
       dbedt_cd_vendedor.Setfocus;
    end;
  end;

  // data
  if  DBDateEdit_DT_agenda.Text = '  /  /    ' then begin
    ShowMessage('Uma data válida deve ser inserida!');
    consiste:=false;
    DBDateEdit_DT_agenda.Setfocus;
  end;
end;

function Tfrm_agenda_comercial.Grava: Boolean;
var data, periodo:string;
begin
    data:= DBDateEdit_DT_agenda.Text;
    periodo:=dbrg_in_periodo.Value;
    with datm_agenda_comercial do
     begin

      if (not (vIncluiu)) and (qry_agenda_comercial_.State <> dsEdit) then begin
        ShowMessage('Clique em incluir antes de inserir novos dados!' + #13#10 + 'Ou selecione um registro para editá-lo!');
        Exit;
      end;
      //pesquisa compromisso marcado
      if (qry_agenda_comercial_.State in [dsInsert]) and not(in_salva) then
       begin
         with TQuery.Create(Application) do
          begin
           DatabaseName:='DBBROKER';
           Sql.clear;
           Sql.Add('SELECT COUNT (CD_AGENDA) FROM TAGENDA_COMERC WHERE CD_VENDEDOR="'+datm_agenda_comercial.qry_agenda_comercial_CD_VENDEDOR.AsString+'" AND ');
           Sql.Add('DT_AGENDA=CONVERT(DATETIME,"'+data+'",103) AND IN_PERIODO="'+dbrg_in_periodo.Value+'" AND IN_CANCELADO="0"');
           Open;
           if Fields[0].AsInteger > 0 then
             begin
              BoxMensagem('Vendedor já possui compromisso agendado para esta DATA e PERÍODO!',2);
              Exit;
            end;
          end;
        qry_pesquisa_.Close;
       end;
       // se não tem compromisso, salva
       try
         if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
         if qry_agenda_comercial_.State in [dsInsert,dsEdit]then
            qry_agenda_comercial_.Post;
         in_salva:=false;
         datm_main.db_broker.Commit;
         Grava := True;
         except
         on E: Exception do
          begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          qry_agenda_comercial_.Cancel;
          TrataErro(E);
          Grava := False;
         end;
      end;
     end;//with
  btn_mi(st_incluir, false, false, st_excluir);
  DBRadioGroup_tp_agenda.enabled:=false;
end;

procedure Tfrm_agenda_comercial.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_agenda_comercial.pgctrl_agenda_comercialChange(
  Sender: TObject);
begin
  With datm_agenda_comercial do
   begin
   if qry_agenda_comercial_.State in [dsEdit,dsInsert] then exit;
   if pgctrl_agenda_comercial.ActivePage = ts_mov_ag then
    begin
      chkCanceladaClick(nil);
      btn_print_.Enabled := False;
    end else
      btn_print_.Enabled := True;
   end;//with
end;

procedure Tfrm_agenda_comercial.btn_sairClick(Sender: TObject);
begin
datm_agenda_comercial.Free;
Close;
end;



procedure Tfrm_agenda_comercial.DateEditDataExit(Sender: TObject);
begin
 {if msk_cd_vendedor.text = '' then
    begin
     with datm_agenda_comercial do
       begin
         qry_agenda_diaria_.Close;
         qry_agenda_diaria_.ParamByName('CD_VENDEDOR').AsString:=msk_cd_vendedor.text;
         qry_agenda_diaria_.ParamByName('DT_AGENDA').AsDate  := StrToDate( DateEditData.Text );  //DateEditData.Text;
         qry_agenda_diaria_.Open;
       end;
       exit;
     end;  }

  if DateEditData.text <> '  /  /    ' then
   begin
      st_dia_semana := FormatDateTime('ddd',StrToDateTime(DateEditData.text));

      int_dia_numero := StrToInt(FormatDateTime('dd',StrToDateTime(DateEditData.text)));

      int_mes_numero := StrToInt(FormatDateTime('mm',StrToDateTime(DateEditData.text)));

      st_ano_numero := FormatDateTime('yyyy',StrToDateTime(DateEditData.text));

      encontrar_semana(st_ano_numero,int_mes_numero,st_dia_semana);

       Edit_agenda_mes.text:= '  '+ FormatDateTime('mmmm',StrToDateTime(DateEditData.text));

       rdgrp_tp_agendaClick(nil);
   end;


end;

procedure Tfrm_agenda_comercial.msk_cd_unid_negChange(Sender: TObject);
begin
  btn_co_unid_negClick(nil);
  msk_cd_vendedor.Text:='';
  edt_nm_vendedor.Text:='';
end;

procedure Tfrm_agenda_comercial.btn_co_proc_comercClick(Sender: TObject);
var
  cliente:string;
begin
  cliente:= ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],['Código','Cliente', 'CGC', 'End. Empresa'],'CD_EMPRESA',frm_main.mi_cad_emp_nac);
  if (cliente <> '' ) then
  begin
    If Not ( datm_agenda_comercial.qry_agenda_comercial_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_agenda_comercial.qry_agenda_comercial_.Edit;
    datm_agenda_comercial.qry_agenda_comercial_CD_EMPRESA.AsString:=cliente;

  end;
 dbedt_clienteExit(Sender);
end;

procedure Tfrm_agenda_comercial.dbedt_clienteExit(Sender: TObject);
Var mensagem:string;
begin


 with datm_agenda_comercial do
  begin
   if  not(qry_agenda_comercial_.State in [dsInsert,dsEdit]) then exit;
   
   if dbedt_cliente.text<> '' then
    begin
     ValidCodigo(dbedt_cliente);
     mensagem:='Este Registro de Manutenção não existe para esta Unidade';
     qry_pesquisa_.Active:=false;
     qry_pesquisa_.Sql.Clear;
     qry_pesquisa_.Sql.Add('SELECT TPV.CD_VENDEDOR, TP.NR_PROC_COMERC, TV.NM_VENDEDOR, ');
     qry_pesquisa_.Sql.Add('(SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA = TP.CD_EMPRESA )NM_EMPRESA');
     qry_pesquisa_.Sql.Add(' FROM TPROC_VENDEDOR TPV LEFT JOIN TVENDEDOR TV ON(TV.CD_VENDEDOR= TPV.CD_VENDEDOR)');
     qry_pesquisa_.Sql.Add(' LEFT JOIN TPROC_COMERC TP ON(TP.NR_PROC_COMERC = TPV.NR_PROC_COMERC) ');
     qry_pesquisa_.Sql.Add(' WHERE TP.CD_EMPRESA="'+dbedt_cliente.text+'"');

     if qry_agenda_comercial_CD_VENDEDOR.AsString <>'' then
       begin
        qry_pesquisa_.Sql.Add(' AND TPV.CD_VENDEDOR="'+qry_agenda_comercial_CD_VENDEDOR.AsString+'"');
        mensagem:=mensagem + ' ou para o Vendedor';
       end
     else
        qry_pesquisa_.Sql.Add(' AND TV.CD_UNID_NEG="'+msk_cd_unid_neg.TEXT+'"');
     //showmessage(qry_pesquisa_.Sql.text);
     qry_pesquisa_.Active:=true;

     if qry_pesquisa_.RecordCount > 0 then
      begin
       qry_agenda_comercial_NM_EMPRESA.AsString:=qry_pesquisa_.Fields[3].AsString;
       qry_agenda_comercial_NR_PROC_COMERC.AsString:=qry_pesquisa_.Fields[1].AsString;
       qry_agenda_comercial_CD_VENDEDOR.AsString:=qry_pesquisa_.Fields[0].AsString;
       qry_agenda_comercial_NM_VENDEDOR.AsString:=qry_pesquisa_.Fields[2].AsString;
      end
     else
       begin
        BoxMensagem(mensagem + '!',2);
        qry_pesquisa_.close;
        dbedt_nm_Cliente.text:='';
        dbedt_cliente.Setfocus;
       end;

    end
    else
      dbedt_nm_Cliente.text:='';  end; //with
end;

procedure Tfrm_agenda_comercial.dbedt_cd_vendedorExit(Sender: TObject);
begin
  with datm_agenda_comercial do
  begin
    if not(qry_agenda_comercial_.State in [dsEdit, dsInsert]) then exit;
    if dbedt_cd_vendedor.text <> '' then begin
      dbedt_cd_vendedor.Text := Copy('000', 1, 4 - Length(dbedt_cd_vendedor.Text)) + dbedt_cd_vendedor.Text;
      dbedt_nm_vendedor.Text := ConsultaLookUPSQL('SELECT NM_VENDEDOR FROM TVENDEDOR ' +
                                                  'WHERE CD_UNID_NEG="'+ msk_cd_unid_neg.text +'" ' +
                                                  ' AND CD_VENDEDOR ="'+dbedt_cd_vendedor.text+'" ',
                                                  'NM_VENDEDOR');

    if dbedt_nm_vendedor.Text  = ''  then
      begin
        ShowMessage('Vendedor não Habilitado para a Unidade de Negócio ou Código Inválido!');
        dbedt_cd_vendedor.SetFocus;
      end else begin
        qry_agenda_comercial_CD_VENDEDOR.AsString := dbedt_cd_vendedor.Text;
        qry_agenda_comercial_NM_VENDEDOR.AsString := dbedt_nm_vendedor.Text;
      end;
   end else dbedt_nm_vendedor.text:='';
 end;
end;

procedure Tfrm_agenda_comercial.btn_co_vendClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    datm_agenda_comercial.qry_agenda_comercial_CD_VENDEDOR.AsString := ConsultaOnLineExFiltro('TVENDEDOR', 'Vendedores', ['CD_VENDEDOR', 'NM_VENDEDOR'], ['Código', 'Nome'], 'CD_VENDEDOR', ' CD_UNID_NEG="'+ msk_cd_unid_neg.text +'" ' ,nil,  dbedt_cd_vendedor.Text )
  else
    dbedt_nm_vendedor.Text := ConsultaLookUPSQL('SELECT NM_VENDEDOR FROM TVENDEDOR ' +
                                                'WHERE CD_UNID_NEG="'+ msk_cd_unid_neg.text +'" ' +
                                                ' AND CD_VENDEDOR ="'+ datm_agenda_comercial.qry_agenda_comercial_CD_VENDEDOR. AsString +'" ',
                                                'NM_VENDEDOR');

{Cons_On_line( 'DBBROKER', 'TVENDEDOR',
                datm_agenda_comercial.qry_agenda_comercial_CD_VENDEDOR,
                'Vendedores', 64, 'CD_UNID_NEG ='+msk_cd_unid_neg.text+'' ,'TTable');
 dbedt_cd_vendedorExit(nil); }
end;

procedure Tfrm_agenda_comercial.btn_cancelarClick(Sender: TObject);
begin
Cancelar;

end;

procedure Tfrm_agenda_comercial.Cancelar;
begin
  with datm_agenda_comercial do
    begin
     if qry_agenda_comercial_.State in [dsEdit, dsInsert] then
        qry_agenda_comercial_.Cancel;
    end;
 btn_mi(st_incluir, false, false, st_excluir);
    
end;

procedure Tfrm_agenda_comercial.dbedt_cd_vendedorChange(Sender: TObject);
begin
   btn_co_vendClick(nil);
   if datm_agenda_comercial.qry_agenda_comercial_.State in [dsEdit, dsInsert] then begin
     btn_mi(false,st_modificar, st_modificar, false);
   end;
end;

procedure Tfrm_agenda_comercial.dbrg_in_periodoClick(Sender: TObject);
begin
with datm_agenda_comercial do
 begin
   if not(qry_agenda_comercial_.State in[dsEdit,dsInsert]) then exit;
   if dbrg_in_periodo.ItemIndex = 0 then
    begin
      dbedt_hr_agenda.text:=FormatDateTime('hh:nn',(StrToTime('08:00')));
    end;
   if dbrg_in_periodo.ItemIndex = 1 then
    begin
    dbedt_hr_agenda.text:=FormatDateTime('hh:nn',(StrToTime('10:00')));
    end;
   if dbrg_in_periodo.ItemIndex = 2 then
    begin
    dbedt_hr_agenda.text:=FormatDateTime('hh:nn',(StrToTime('14:00')));
    end;
   if dbrg_in_periodo.ItemIndex = 3 then
    begin
    dbedt_hr_agenda.text:=FormatDateTime('hh:nn',(StrToTime('16:00')));
    end;
 end;//with

end;

procedure Tfrm_agenda_comercial.DBRadioGroup_tp_agendaClick(
  Sender: TObject);
begin
 with datm_agenda_comercial do
  begin
    if qry_agenda_comercial_IN_PARTICULAR.AsString = '1' then //particular
      begin
       btn_co_proc_comerc.Enabled:=false;
       dbedt_cliente.Enabled:=false;
      end;
    if qry_agenda_comercial_IN_PARTICULAR.AsString = '0' then//Profissional
      begin
       btn_co_proc_comerc.Enabled:=True;
       dbedt_cliente.Enabled:=True;
      end;
 end;

end;

procedure Tfrm_agenda_comercial.btn_excluirClick(Sender: TObject);
begin
   with datm_agenda_comercial do  begin
     if pgctrl_agenda_comercial.ActivePage <> ts_mov_ag then exit;
     if qry_agenda_comercial_IN_CANCELADO.AsString = '0' then  begin
       if BoxMensagem('Este visita será Cancelada. Deseja continuar?',1) then begin
              if not(qry_agenda_comercial_.State in [dsEdit]) then qry_agenda_comercial_.Edit;
              qry_agenda_comercial_IN_CANCELADO.AsString:='1';
              try
               if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
               if qry_agenda_comercial_.State in [dsInsert,dsEdit]then
                  qry_agenda_comercial_.Post;
               datm_main.db_broker.Commit;
               exit;
               except
                 on E: Exception do
                 begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 qry_agenda_comercial_.Cancel;
                 TrataErro(E);
                 exit;
                 end;
               end;//try
          end
       end else
            ShowMessage('Esta visita já está cancelada!');
      // Proibição da exclusão da visita (Kleber - 01/06/2006)
      { if qry_agenda_comercial_IN_CANCELADO.AsString = '1' then
       begin
       if BoxMensagem('Este visita será excluída em definito. Deseja continuar?',1) then
         begin
          try
               if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
               qry_agenda_comercial_.Delete;
               datm_main.db_broker.Commit;
               except
                 on E: Exception do
                 begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 qry_agenda_comercial_.Cancel;
                 TrataErro(E);
                 end;
               end;//try


         end;
       end; }



  end;  //with
end;

procedure Tfrm_agenda_comercial.msk_cd_vendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_F5 then
  begin
    if Sender = msk_cd_vendedor     then btn_co_vendedorClick(nil);
    if Sender = msk_cd_unid_neg     then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = dbedt_cliente   then btn_co_proc_comercClick(nil);
    if Sender = dbedt_cd_vendedor   then btn_co_vendClick(btn_co_vend);
  end;
end;

procedure Tfrm_agenda_comercial.dbgrid_mov_agendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (datm_agenda_comercial.qry_agenda_comercial_IN_CANCELADO.AsString='1') then begin
    dbgrid_mov_agenda.Canvas.Font.Color:= clred;
    dbgrid_mov_agenda.DefaultDrawDataCell(Rect, dbgrid_mov_agenda.columns[datacol].field, State);
  end else begin
    dbgrid_mov_agenda.Canvas.Font.Color:= clblack;
    dbgrid_mov_agenda.DefaultDrawDataCell(Rect, dbgrid_mov_agenda.columns[datacol].field, State);
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '0' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00E2E2C7;
    end else
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '1' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00B9FFB9;
    end else
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '2' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00A8C5FF;
    end else
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '3' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00FFC891;
    end else
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '4' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $009393FF;
    end;
    TDBGrid(Sender).Canvas.TextOut(Rect.Left + 2 ,Rect.Top+2, Column.Field.Text );
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure Tfrm_agenda_comercial.Dt_agendaChange(Sender: TObject);
begin
   if not(datm_agenda_comercial.qry_agenda_comercial_.State in [dsEdit, dsInsert]) then
    begin
      datm_agenda_comercial.qry_agenda_comercial_.Edit;
      btn_mi(false,st_modificar, st_modificar, false);
    end;
end;

procedure Tfrm_agenda_comercial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 27 then
  begin
    if Not VerAlt then Exit;
    Close;
  end;
end;

function Tfrm_agenda_comercial.VerAlt: Boolean;
begin
VerAlt := True;

 with datm_agenda_comercial do
  begin
    if qry_agenda_comercial_.State in [dsEdit,dsInsert] then
     begin
       if BoxMensagem('A Agenda foi alterada.' + #13#10 +
         'Deseja salvar as informações?', 1) then
       if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end
      else
        Cancelar;
     end;
   end;
end;

procedure Tfrm_agenda_comercial.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//VerAlt;
end;

procedure Tfrm_agenda_comercial.FormShow(Sender: TObject);
begin
  pnl_manut_proc.Color := clMenuBroker;
  msk_cd_vendedor.SetFocus;
end;

procedure Tfrm_agenda_comercial.dbmemo_obs_agendaChange(Sender: TObject);
begin
    if datm_agenda_comercial.qry_agenda_comercial_.State in [dsEdit, dsInsert] then
      begin
       btn_mi(false,st_modificar, st_modificar, false);
       in_salva:=true;
       end;
end;

procedure Tfrm_agenda_comercial.btn_print_Click(Sender: TObject);
begin



     { Application.CreateForm(TFrm_impressao, Frm_impressao );
      //Frm_impressao.cd_emp_nac:=datm_proposta.qry_proposta_CD_EMPRESA.AsString;
      Frm_impressao.cd_unid_neg:=msk_cd_unid_neg.text;
      Frm_impressao.cd_modulo:='3103';
      Frm_impressao.ShowModal;}
     {if rdgrp_tp_agenda.ItemIndex = 0 then
      begin
      pp_agenda.Reset;
      pp_agenda.Template.FileName := cDir_Rpt+ '\rel_agenda_diaria.RTM';//cDir_Rpt + '\mast020.rtm';//ReportPath + ReportFileName;
      pp_agenda.Template.LoadFromFile;
      pp_agenda.Template.FileName := cDir_Rpt+'\rel_agenda_diaria.RTM';//cDir_Rpt + '\mast020.rtm';//ReportPath + ReportFileName;
      pp_agenda.Device:=dvScreen;
      pp_agenda.Print;
      //ppDesigner.ShowModal;
      end;

     if rdgrp_tp_agenda.ItemIndex = 1 then
      begin
      pp_agenda.Reset;
      pp_agenda.Template.FileName :=cDir_Rpt +'\rel_agenda_semanal.RTM';//cDir_Rpt + '\mast020.rtm';//ReportPath + ReportFileName;
      pp_agenda.Template.LoadFromFile;
      pp_agenda.Template.FileName := cDir_Rpt+ '\rel_agenda_semanal.RTM';//cDir_Rpt + '\mast020.rtm';//ReportPath + ReportFileName;
      pp_agenda.Device:=dvScreen;
      pp_agenda.Print;
     // ppDesigner.ShowModal;
      end;

      if rdgrp_tp_agenda.ItemIndex = 2 then
      begin
      pp_agenda.Reset;
      pp_agenda.Template.FileName := cDir_Rpt+'\rel_agenda_mensal.RTM';//cDir_Rpt + '\mast020.rtm';//ReportPath + ReportFileName;
      pp_agenda.Template.LoadFromFile;
      pp_agenda.Template.FileName := cDir_Rpt+'\rel_agenda_mensal.RTM';//cDir_Rpt + '\mast020.rtm';//ReportPath + ReportFileName;
      pp_agenda.Device:=dvScreen;
      pp_agenda.Print;
      //ppDesigner.ShowModal;
      end;
   end; }


  //impressão pelo Form de Impressão!!
  if (pgctrl_agenda_comercial.ActivePage = ts_consulta_ag) and
     (((rdgrp_tp_agenda.ItemIndex = 0) and (not datm_agenda_comercial.qry_agenda_diaria_.IsEmpty)) or
      ((rdgrp_tp_agenda.ItemIndex = 1) and (not datm_agenda_comercial.qry_agenda_semanal_.IsEmpty)) or
      ((rdgrp_tp_agenda.ItemIndex = 2) and (not datm_agenda_comercial.qry_agenda_mensal_.IsEmpty))   ) then begin
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg   := '01';
    frm_impressao.cd_produto    := '';
    frm_impressao.cd_via_transp := '';
    frm_impressao.cd_modulo     := '3103';
    frm_impressao.vApenas_email := false;
    frm_impressao.ShowModal;
    frm_impressao.Release;
  end else
    ShowMessage('Não há dados para exibir!');
end;

procedure Tfrm_agenda_comercial.pgctrl_agenda_comercialChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := (datm_agenda_comercial.qry_agenda_comercial_.State in [dsBrowse, dsInactive]);

  if not AllowChange then begin
    if Application.MessageBox('Uma movimentação da Agenda está sendo criada/modificada!' +
                              #13#10 + 'Deseja salvar as Alterações?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes then
      btn_salvarClick(btn_salvar)
    else
      btn_cancelarClick(btn_cancelar);
  end;
end;

procedure Tfrm_agenda_comercial.chkCanceladaClick(Sender: TObject);
begin
  with datm_agenda_comercial do begin
    qry_agenda_comercial_.Close;
    if chkCancelada.Checked then
      qry_agenda_comercial_.SQL.Strings[6] := ''
    else
      qry_agenda_comercial_.SQL.Strings[6] := 'AND IN_CANCELADO = "0"';
    qry_agenda_comercial_.ParamByName('CD_VENDEDOR').AsString:=msk_cd_vendedor.text;
    qry_agenda_comercial_.Prepare;
    qry_agenda_comercial_.Open;
  end;
end;

end.
