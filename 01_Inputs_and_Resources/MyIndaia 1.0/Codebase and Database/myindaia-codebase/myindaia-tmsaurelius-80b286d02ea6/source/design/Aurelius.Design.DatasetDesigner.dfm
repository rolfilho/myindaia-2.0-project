object fmFieldLoader: TfmFieldLoader
  Left = 0
  Top = 0
  ActiveControl = edSearch
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'TAureliusDataset Field Loader'
  ClientHeight = 308
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    541
    308)
  PixelsPerInch = 96
  TextHeight = 13
  object btOk: TButton
    Left = 367
    Top = 275
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    Default = True
    TabOrder = 1
    OnClick = btOkClick
  end
  object btCancel: TButton
    Left = 455
    Top = 275
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btCancelClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 525
    Height = 255
    ActivePage = tsClass
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tsClass: TTabSheet
      Caption = 'Class'
      DesignSize = (
        517
        227)
      object Label1: TLabel
        Left = 4
        Top = 14
        Width = 144
        Height = 13
        Caption = 'Select class to load fields from'
      end
      object lvClasses: TListView
        Left = 4
        Top = 34
        Width = 504
        Height = 186
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = 'Class Name'
            Width = 200
          end
          item
            Caption = 'Unit Name'
            Width = 150
          end>
        TabOrder = 1
        ViewStyle = vsReport
        OnDblClick = lvClassesDblClick
      end
      object edSearch: TEdit
        Left = 384
        Top = 6
        Width = 124
        Height = 21
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Search'
        OnChange = edSearchChange
        OnEnter = edSearchEnter
        OnExit = edSearchExit
      end
    end
    object tsPackages: TTabSheet
      Caption = 'Packages'
      ImageIndex = 1
      DesignSize = (
        517
        227)
      object btAddPackage: TSpeedButton
        Left = 486
        Top = 5
        Width = 25
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '+'
        OnClick = btAddPackageClick
        ExplicitLeft = 522
      end
      object btRemovePackage: TSpeedButton
        Left = 486
        Top = 32
        Width = 25
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '-'
        OnClick = btRemovePackageClick
        ExplicitLeft = 522
      end
      object lbPackages: TCheckListBox
        Left = 4
        Top = 6
        Width = 476
        Height = 186
        OnClickCheck = lbPackagesClickCheck
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbPackagesClick
      end
      object edPath: TEdit
        Left = 4
        Top = 200
        Width = 476
        Height = 21
        Anchors = [akLeft, akRight, akBottom]
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.bpl'
    Filter = 'Package Library (*.bpl)|*.bpl'
    Title = 'Add Library'
    Left = 272
    Top = 96
  end
end
