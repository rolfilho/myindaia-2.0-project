unit RootUnit;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItem_01D = class;
  TItem_04D = class;
  TItem_33D = class;
  TItem_34D = class;

  TTB_EXP0001D = class;
//  TTB_EXP0003D = class;
  TTB_EXP0004D = class;
//  TTB_EXP0005S = class;
  TTB_EXP0033D = class;
  TTB_EXP0034D = class;

//  TItem_01D = class
//  private
//    FACCESSKEY: string;
//    FANEXORE: string;
//    FAVERBACAODATE: String;
//    FCONTENT: string;
//    FDDE: string;
//    FDDECHANNEL: string;
//    FDDEDATE: String;
//    FDUEDATE: String;
//    FDUENUMBER: string;
//    FHOUSE: string;
//    FISSUEDATE: String;
//    FMASTER: string;
//    FPARTNER: string;
//    FPARVW: string;
//    FPLANNEDDATESHIP: String;
//    FPROCESSBROKERId: string;
//    FPROCESSNUMBERId: string;
//    FRE: string;
//    FREDATE: String;
//    FRELEASEDATE: String;
//    FRESERVE: string;
//    FRUCDATE: String;
//    FRUCNUMBER: string;
//    FSEQUENCE: Integer;
//    FSHIPDATE: String;
//    FSONUMBER: string;
//    FTRANSITTIME: Integer;
//    FVESSEL: string;
//    FVSART: string;
//  published
//    property ACCESSKEY: string read FACCESSKEY write FACCESSKEY;
//    property ANEXORE: string read FANEXORE write FANEXORE;
//    property AVERBACAODATE: String read FAVERBACAODATE write FAVERBACAODATE;
//    property CONTENT: string read FCONTENT write FCONTENT;
//    property DDE: string read FDDE write FDDE;
//    property DDECHANNEL: string read FDDECHANNEL write FDDECHANNEL;
//    property DDEDATE: String read FDDEDATE write FDDEDATE;
//    property DUEDATE: String read FDUEDATE write FDUEDATE;
//    property DUENUMBER: string read FDUENUMBER write FDUENUMBER;
//    property HOUSE: string read FHOUSE write FHOUSE;
//    property ISSUEDATE: String read FISSUEDATE write FISSUEDATE;
//    property MASTER: string read FMASTER write FMASTER;
//    property PARTNER: string read FPARTNER write FPARTNER;
//    property PARVW: string read FPARVW write FPARVW;
//    property PLANNEDDATESHIP: String read FPLANNEDDATESHIP write FPLANNEDDATESHIP;
//    property PROCESSBROKERId: string read FPROCESSBROKERId write FPROCESSBROKERId;
//    property PROCESSNUMBERId: string read FPROCESSNUMBERId write FPROCESSNUMBERId;
//    property RE: string read FRE write FRE;
//    property REDATE: String read FREDATE write FREDATE;
//    property RELEASEDATE: String read FRELEASEDATE write FRELEASEDATE;
//    property RESERVE: string read FRESERVE write FRESERVE;
//    property RUCDATE: String read FRUCDATE write FRUCDATE;
//    property RUCNUMBER: string read FRUCNUMBER write FRUCNUMBER;
//    property SEQUENCE: Integer read FSEQUENCE write FSEQUENCE;
//    property SHIPDATE: String read FSHIPDATE write FSHIPDATE;
//    property SONUMBER: string read FSONUMBER write FSONUMBER;
//    property TRANSITTIME: Integer read FTRANSITTIME write FTRANSITTIME;
//    property VESSEL: string read FVESSEL write FVESSEL;
//    property VSART: string read FVSART write FVSART;
//  end;

  TItem_01D = class
  private
    FDDE: string;
    FDDEDATE: String;
    FTRANSITTIME: Integer;
    FRESERVE: string;
    FVESSEL: string;
    FDUENUMBER: string;
    FRUCNUMBER: string;
    FPROCESSBROKERId: string;
    FAVERBACAODATE: String;
    FDDECHANNEL: string;
    FSHIPDATE: String;
    FACCESSKEY: string;
    FDUEDATE: String;
    FPROCESSNUMBERId: string;
    FRUCDATE: String;
    FPLANNEDDATESHIP: String;
    FURFCLEARENCE: string;
    FCARRIER: string;
    FPLANNEDDATELOAD: string;
  published
    property ACCESSKEY: string read FACCESSKEY write FACCESSKEY;
    property AVERBACAODATE: String read FAVERBACAODATE write FAVERBACAODATE;
    property DDE: string read FDDE write FDDE;
    property DDECHANNEL: string read FDDECHANNEL write FDDECHANNEL;
    property DDEDATE: String read FDDEDATE write FDDEDATE;
    property DUEDATE: String read FDUEDATE write FDUEDATE;
    property DUENUMBER: string read FDUENUMBER write FDUENUMBER;
    property PLANNEDDATESHIP: String read FPLANNEDDATESHIP write FPLANNEDDATESHIP;
    property PROCESSBROKERId: string read FPROCESSBROKERId write FPROCESSBROKERId;
    property PROCESSNUMBERId: string read FPROCESSNUMBERId write FPROCESSNUMBERId;
    property RESERVE: string read FRESERVE write FRESERVE;
    property RUCDATE: String read FRUCDATE write FRUCDATE;
    property RUCNUMBER: string read FRUCNUMBER write FRUCNUMBER;
    property SHIPDATE: String read FSHIPDATE write FSHIPDATE;
    property TRANSITTIME: Integer read FTRANSITTIME write FTRANSITTIME;
    property VESSEL: string read FVESSEL write FVESSEL;
    property URFCLEARENCE: string read FURFCLEARENCE write FURFCLEARENCE;
    property CARRIER: string read FCARRIER write FCARRIER;
    property PLANNEDDATELOAD: string read FPLANNEDDATELOAD write FPLANNEDDATELOAD;
  end;

  TItem_04D = class
  private
    FISSUEDATE: String;
    FHOUSE: string;
    FRELEASEDATE: String;
    FMASTER: string;
    FPROCESSNUMBERId: string;
  published
    property HOUSE: string read FHOUSE write FHOUSE;
    property ISSUEDATE: String read FISSUEDATE write FISSUEDATE;
    property MASTER: string read FMASTER write FMASTER;
    property PROCESSNUMBERId: string read FPROCESSNUMBERId write FPROCESSNUMBERId;
    property RELEASEDATE: String read FRELEASEDATE write FRELEASEDATE;
  end;

  TItem_33D = class
  private
    FPROCESSNUMBERId: string;
    FSONUMBER: string;
    FVSART: string;
  published
    property PROCESSNUMBERId: string read FPROCESSNUMBERId write FPROCESSNUMBERId;
    property SONUMBER: string read FSONUMBER write FSONUMBER;
    property VSART: string read FVSART write FVSART;
  end;

  TItem_34D = class
  private
    FPARTNER: string;
    FPARVW: string;
    FPROCESSNUMBERId: string;
    FSONUMBER: string;
  published
    property PARTNER: string read FPARTNER write FPARTNER;
    property PARVW: string read FPARVW write FPARVW;
    property PROCESSNUMBERId: string read FPROCESSNUMBERId write FPROCESSNUMBERId;
    property SONUMBER: string read FSONUMBER write FSONUMBER;

  end;

  TTB_EXP0034D = class(TJsonDTO)
  private
    [JSONName('item'), JSONMarshalled(False)]
    FItemArray: TArray<TItem_34D>;
    [GenericListReflect]
    FItem: TObjectList<TItem_34D>;
    function GetItem: TObjectList<TItem_34D>;
  protected
    function GetAsJson: string; override;
  published
    property Item: TObjectList<TItem_34D> read GetItem;
  public
    destructor Destroy; override;
  end;

  TTB_EXP0033D = class(TJsonDTO)
  private
    [JSONName('item'), JSONMarshalled(False)]
    FItemArray: TArray<TItem_33D>;
    [GenericListReflect]
    FItem: TObjectList<TItem_33D>;
    function GetItem: TObjectList<TItem_33D>;
  protected
    function GetAsJson: string; override;
  published
    property Item: TObjectList<TItem_33D> read GetItem;
  public
    destructor Destroy; override;
  end;

//  TTB_EXP0005S = class(TJsonDTO)
//  private
//    [JSONName('item'), JSONMarshalled(False)]
//    FItemArray: TArray<TItem>;
//    [GenericListReflect]
//    FItem: TObjectList<TItem>;
//    function GetItem: TObjectList<TItem>;
//  protected
//    function GetAsJson: string; override;
//  published
//    property Item: TObjectList<TItem> read GetItem;
//  public
//    destructor Destroy; override;
//  end;

  TTB_EXP0004D = class(TJsonDTO)
  private
    [JSONName('item'), JSONMarshalled(False)]
    FItemArray: TArray<TItem_04D>;
    [GenericListReflect]
    FItem: TObjectList<TItem_04D>;
    function GetItem: TObjectList<TItem_04D>;
  protected
    function GetAsJson: string; override;
  published
    property Item: TObjectList<TItem_04D> read GetItem;
  public
    destructor Destroy; override;
  end;

//  TTB_EXP0003D = class(TJsonDTO)
//  private
//    [JSONName('item'), JSONMarshalled(False)]
//    FItemArray: TArray<TItem>;
//    [GenericListReflect]
//    FItem: TObjectList<TItem>;
//    function GetItem: TObjectList<TItem>;
//  protected
//    function GetAsJson: string; override;
//  published
//    property Item: TObjectList<TItem> read GetItem;
//  public
//    destructor Destroy; override;
//  end;

  TTB_EXP0001D = class(TJsonDTO)
  private
    [JSONName('item'), JSONMarshalled(False)]
    FItemArray: TArray<TItem_01D>;
    [GenericListReflect]
    FItem: TObjectList<TItem_01D>;
    function GetItem: TObjectList<TItem_01D>;
  protected
    function GetAsJson: string; override;
  published
    property Item: TObjectList<TItem_01D> read GetItem;
  public
    destructor Destroy; override;
  end;

  TZAPSEXP02 = class
  private
    FTB_EXP0001D: TTB_EXP0001D;
//    FTB_EXP0003D: TTB_EXP0003D;
    FTB_EXP0004D: TTB_EXP0004D;
//    FTB_EXP0005S: TTB_EXP0005S;
    FTB_EXP0033D: TTB_EXP0033D;
    FTB_EXP0034D: TTB_EXP0034D;
  published
    property TB_EXP0001D: TTB_EXP0001D read FTB_EXP0001D;
//    property TB_EXP0003D: TTB_EXP0003D read FTB_EXP0003D;
    property TB_EXP0004D: TTB_EXP0004D read FTB_EXP0004D;
//    property TB_EXP0005S: TTB_EXP0005S read FTB_EXP0005S;
    property TB_EXP0033D: TTB_EXP0033D read FTB_EXP0033D;
    property TB_EXP0034D: TTB_EXP0034D read FTB_EXP0034D;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TRoot = class(TJsonDTO)
  private
    FZAPSEXP02: TZAPSEXP02;
  published
    property ZAPSEXP02: TZAPSEXP02 read FZAPSEXP02;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TTB_EXP0034D }

destructor TTB_EXP0034D.Destroy;
begin
  GetItem.Free;
  inherited;
end;

function TTB_EXP0034D.GetItem: TObjectList<TItem_34D>;
begin
  Result := ObjectList<TItem_34D>(FItem, FItemArray);
end;

function TTB_EXP0034D.GetAsJson: string;
begin
  RefreshArray<TItem_34D>(FItem, FItemArray);
  Result := inherited;
end;

{ TTB_EXP0033D }

destructor TTB_EXP0033D.Destroy;
begin
  GetItem.Free;
  inherited;
end;

function TTB_EXP0033D.GetItem: TObjectList<TItem_33D>;
begin
  Result := ObjectList<TItem_33D>(FItem, FItemArray);
end;

function TTB_EXP0033D.GetAsJson: string;
begin
  RefreshArray<TItem_33D>(FItem, FItemArray);
  Result := inherited;
end;

{ TTB_EXP0005S }

//destructor TTB_EXP0005S.Destroy;
//begin
//  GetItem.Free;
//  inherited;
//end;

//function TTB_EXP0005S.GetItem: TObjectList<TItem>;
//begin
//  Result := ObjectList<TItem>(FItem, FItemArray);
//end;
//
//function TTB_EXP0005S.GetAsJson: string;
//begin
//  RefreshArray<TItem>(FItem, FItemArray);
//  Result := inherited;
//end;

{ TTB_EXP0004D }

destructor TTB_EXP0004D.Destroy;
begin
  GetItem.Free;
  inherited;
end;

function TTB_EXP0004D.GetItem: TObjectList<TItem_04D>;
begin
  Result := ObjectList<TItem_04D>(FItem, FItemArray);
end;

function TTB_EXP0004D.GetAsJson: string;
begin
  RefreshArray<TItem_04D>(FItem, FItemArray);
  Result := inherited;
end;

{ TTB_EXP0003D }

//destructor TTB_EXP0003D.Destroy;
//begin
//  GetItem.Free;
//  inherited;
//end;
//
//function TTB_EXP0003D.GetItem: TObjectList<TItem>;
//begin
//  Result := ObjectList<TItem>(FItem, FItemArray);
//end;
//
//function TTB_EXP0003D.GetAsJson: string;
//begin
//  RefreshArray<TItem>(FItem, FItemArray);
//  Result := inherited;
//end;

{ TTB_EXP0001D }

destructor TTB_EXP0001D.Destroy;
begin
  GetItem.Free;
  inherited;
end;

function TTB_EXP0001D.GetItem: TObjectList<TItem_01D>;
begin
  Result := ObjectList<TItem_01D>(FItem, FItemArray);
end;

function TTB_EXP0001D.GetAsJson: string;
begin
  RefreshArray<TItem_01D>(FItem, FItemArray);
  Result := inherited;
end;

{ TZAPSEXP02 }

constructor TZAPSEXP02.Create;
begin
  inherited;
  FTB_EXP0001D := TTB_EXP0001D.Create;
//  FTB_EXP0003D := TTB_EXP0003D.Create;
  FTB_EXP0004D := TTB_EXP0004D.Create;
//  FTB_EXP0005S := TTB_EXP0005S.Create;
  FTB_EXP0033D := TTB_EXP0033D.Create;
  FTB_EXP0034D := TTB_EXP0034D.Create;
end;

destructor TZAPSEXP02.Destroy;
begin
  FTB_EXP0001D.Free;
//  FTB_EXP0003D.Free;
  FTB_EXP0004D.Free;
//  FTB_EXP0005S.Free;
  FTB_EXP0033D.Free;
  FTB_EXP0034D.Free;
  inherited;
end;

{ TRoot }

constructor TRoot.Create;
begin
  inherited;
  FZAPSEXP02 := TZAPSEXP02.Create;
end;

destructor TRoot.Destroy;
begin
  FZAPSEXP02.Free;
  inherited;
end;

end.
