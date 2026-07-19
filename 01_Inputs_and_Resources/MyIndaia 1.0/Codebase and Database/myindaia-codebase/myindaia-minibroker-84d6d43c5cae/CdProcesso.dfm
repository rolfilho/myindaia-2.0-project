inherited formMyCdProcesso: TformMyCdProcesso
  Caption = 'Processos'
  ClientHeight = 437
  ClientWidth = 692
  ExplicitWidth = 708
  ExplicitHeight = 475
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 417
    Width = 692
  end
  inherited PageControl: TPageControl
    Width = 692
    Height = 417
    inherited tshGrid: TTabSheet
      inherited pnlButtonGrid: TPanel
        Left = 581
        Height = 386
        object Bevel1: TBevel [0]
          Left = 14
          Top = 128
          Width = 72
          Height = 2
        end
        inherited cbxAltRapida: TCheckBox
          Left = 14
          Top = 144
          TabOrder = 6
          ExplicitLeft = 14
          ExplicitTop = 144
        end
        object btnNotasFiscais: TButton
          Left = 14
          Top = 176
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Contexto'
          TabOrder = 4
          OnClick = btnNotasFiscaisClick
        end
        object Button1: TButton
          Left = 14
          Top = 207
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Due'
          TabOrder = 5
        end
      end
      inherited pnlGrid: TPanel
        Width = 581
        Height = 386
        inherited cxGrid: TcxGrid
          Width = 581
          Height = 382
          inherited cxGridDBTableView: TcxGridDBTableView
            object cxGridDBTableViewNrProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'NrProcesso'
              Width = 221
            end
          end
        end
        inherited pnlStyle1: TPanel
          Width = 581
        end
      end
    end
    inherited tshEdit: TTabSheet
      inherited pnlEditButon: TPanel
        Left = 581
        Height = 386
      end
      inherited pnlFundo: TPanel
        Width = 581
        Height = 386
        object lblExportador: TLabel [0]
          Left = 169
          Top = 19
          Width = 62
          Height = 16
          Caption = 'Exportador'
        end
        object lblNrProcesso: TLabel [1]
          Left = 9
          Top = 19
          Width = 118
          Height = 16
          Caption = 'N'#250'mero do Processo'
        end
        inherited pnlStyle2: TPanel
          Width = 581
        end
        object btnConsultaProcesso: TBitBtn
          Left = 136
          Top = 36
          Width = 28
          Height = 25
          Caption = '>'
          TabOrder = 1
        end
        object DBEdit1: TDBEdit
          Left = 9
          Top = 38
          Width = 121
          Height = 24
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 169
          Top = 38
          Width = 62
          Height = 24
          DataField = 'CdExportador'
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 237
          Top = 38
          Width = 300
          Height = 24
          DataField = 'NmEmpresa'
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
  end
  inherited dtsMain: TDataSource
    Left = 80
    Top = 128
  end
  inherited adsMain: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Cliente'
        DataType = ftVariant
      end
      item
        Name = 'Servico'
        DataType = ftVariant
      end
      item
        Name = 'Usuario'
        DataType = ftVariant
      end
      item
        Name = 'DtAbertura'
        DataType = ftDateTime
      end
      item
        Name = 'InCancelado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MoedaMle'
        DataType = ftVariant
      end
      item
        Name = 'PaisDestino'
        DataType = ftVariant
      end
      item
        Name = 'LocalDesembarque'
        DataType = ftVariant
      end
      item
        Name = 'DespachanteSda'
        DataType = ftVariant
      end
      item
        Name = 'NrProcessoExpTemp'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'VlPesoLiquido'
        DataType = ftFloat
      end
      item
        Name = 'VlPesoBruto'
        DataType = ftFloat
      end
      item
        Name = 'Incoterm'
        DataType = ftVariant
      end
      item
        Name = 'TpProcesso'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Despachante'
        DataType = ftVariant
      end
      item
        Name = 'NrFatura'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Importador'
        DataType = ftVariant
      end
      item
        Name = 'Exportador'
        DataType = ftVariant
      end
      item
        Name = 'CdRuc'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CdDue'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ProcessoExp'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'UnidNeg'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'Produto'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    Left = 120
    Top = 128
    DesignClass = 'MyEntitiesBroker.TTprocesso'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsMainNrProcesso: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NrProcesso'
      Size = 18
    end
    object adsMainCdCliente: TStringField
      FieldName = 'CdCliente'
      Size = 5
    end
    object adsMainCdServico: TStringField
      FieldName = 'CdServico'
      Size = 3
    end
    object adsMainCdUsuario: TStringField
      FieldName = 'CdUsuario'
      Size = 4
    end
    object adsMainDtAbertura: TDateTimeField
      FieldName = 'DtAbertura'
    end
    object adsMainInCancelado: TStringField
      FieldName = 'InCancelado'
      Size = 1
    end
    object adsMainCdMoedaMle: TStringField
      FieldName = 'CdMoedaMle'
      Size = 3
    end
    object adsMainCdPaisDestino: TStringField
      FieldName = 'CdPaisDestino'
      Size = 3
    end
    object adsMainCdLocalDesembarque: TStringField
      FieldName = 'CdLocalDesembarque'
      Size = 4
    end
    object adsMainCdDespachanteSda: TStringField
      FieldName = 'CdDespachanteSda'
      Size = 3
    end
    object adsMainNrProcessoExpTemp: TStringField
      FieldName = 'NrProcessoExpTemp'
      Size = 5
    end
    object adsMainVlPesoLiquido: TFloatField
      FieldName = 'VlPesoLiquido'
    end
    object adsMainVlPesoBruto: TFloatField
      FieldName = 'VlPesoBruto'
    end
    object adsMainCdIncoterm: TStringField
      FieldName = 'CdIncoterm'
      Size = 3
    end
    object adsMainTpProcesso: TStringField
      FieldName = 'TpProcesso'
      Size = 1
    end
    object adsMainCdDespachante: TStringField
      FieldName = 'CdDespachante'
      Size = 3
    end
    object adsMainNrFatura: TStringField
      FieldName = 'NrFatura'
      Size = 30
    end
    object adsMainCdImportador: TStringField
      FieldName = 'CdImportador'
      Size = 5
    end
    object adsMainCdExportador: TStringField
      FieldName = 'CdExportador'
      Size = 5
    end
    object adsMainCdRuc: TStringField
      FieldName = 'CdRuc'
      Size = 35
    end
    object adsMainCdDue: TStringField
      FieldName = 'CdDue'
      Size = 14
    end
    object adsMainCdUnidNeg: TStringField
      FieldName = 'CdUnidNeg'
      Size = 2
    end
    object adsMainCdProduto: TStringField
      FieldName = 'CdProduto'
      Size = 2
    end
    object adsMainProcessoExp: TAureliusEntityField
      FieldName = 'ProcessoExp'
      Visible = False
    end
    object adsMainUnidNeg: TAureliusEntityField
      FieldName = 'UnidNeg'
      Visible = False
    end
    object adsMainProduto: TAureliusEntityField
      FieldName = 'Produto'
      Visible = False
    end
  end
end
