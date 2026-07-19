unit Aurelius.Mapping.Exceptions;

{$I Aurelius.inc}

interface

uses
  SysUtils, Rtti,
  Aurelius.Mapping.Metadata,
  Aurelius.Global.Exceptions;

type
  TCustomAttributeClass = class of TCustomAttribute;

  EMappingNotFound = class(EOPFBaseException)
  public
    constructor Create(MappingName: string; AClass: TClass);
  end;

  EInvalidAssociation = class(EOPFBaseException)
  public
    constructor Create(ClassName, FieldName: string);
  end;

  EColumnNotFound = class(EOPFBaseException)
  public
    constructor Create(ClassName, ColumnName: string);
  end;

  EPropertyNotFound = class(EOPFBaseException)
  public
    constructor Create(ClassName, PropName: string);
  end;

  EColumnNotFoundForAttribute = class(EOPFBaseException)
  public
    constructor Create(ClassName, AttributeName: string);
  end;

  EMultipleColumnsFoundForAttribute = class(EOPFBaseException)
  public
    constructor Create(ClassName, AttributeName: string);
  end;

  ETooManyJoinColumns = class(EOPFBaseException)
  public
    constructor Create(ClassName, AttributeName: string);
  end;

  ETooManyPrimaryJoinColumns = class(EOPFBaseException)
  public
    constructor Create(ClassName: string);
  end;

  EInvalidDiscriminatorValue = class(EOPFBaseException)
  public
    constructor Create(DiscrValue: Variant);
  end;

  EUnexpectedDiscriminatorType = class(EOPFBaseException)
  public
    constructor Create(DiscrTypeName: string);
  end;

  EUnexpectedEnumValue = class(EOPFBaseException)
    constructor Create(EnumValue: string; EnumTypeName: string);
  end;

  EInvalidUniqueColumnName = class(EOPFBaseException)
  public
    constructor Create(ColumnName, ClassName: string);
  end;

  EInvalidReferencedColumnName = class(EOPFBaseException)
  public
    constructor Create(ColumnName, ClassName: string);
  end;

  EUnexpectedFieldType = class(EOPFBaseException)
  public
    constructor Create(FieldTypeString: string);
  end;

  EInvalidEntity = class(EOPFBaseException)
  public
    constructor Create(ClassName: string);
  end;

  EClassNotRegistered = class(EOPFBaseException)
  public
    constructor Create(Clazz: TClass);
  end;

  EInvalidEnumMapping = class(EOPFBaseException)
  end;

  EMappingInternalError = class(EOPFInternalError)
  end;

  EInvalidIdType = class(EOPFBaseException)
  public
    constructor Create(AClass: TClass);
  end;

  EEnumerationNotMapped = class(EOPFBaseException)
  public
    constructor Create(ATypeName: string);
  end;

  EInvalidIdMemberName = class(EOPFBaseException)
  public
    constructor Create(MemberName, ClassName: string);
  end;

  EInvalidOrderByMemberName = class(EOPFBaseException)
  public
    constructor Create(MemberName, ClassName: string);
  end;

  EIdValueConvertFail = class(EOPFBaseException)
  private
    FClass: TClass;
    FValue: Variant;
    FColumn: TColumn;
  public
    constructor Create(Clazz: TClass; Column: TColumn; AValue: Variant);
    property EntityClass: TClass read FClass;
    property Column: TColumn read FColumn;
    property Value: Variant read FValue;
  end;

  EDBToObjectConvertFail = class(EOPFBaseException)
  private
    FClass: TClass;
    FValue: Variant;
    FColumn: TColumn;
  public
    constructor Create(Clazz: TClass; Column: TColumn; AValue: Variant);
    property EntityClass: TClass read FClass;
    property Column: TColumn read FColumn;
    property Value: Variant read FValue;
  end;

  EDynamicColumnNotSpecified = class(EOPFBaseException)
  public
    constructor Create(Clazz: TClass; PropName: string);
  end;

  EInvalidMappedByReference = class(EOPFBaseException)
  public
    constructor Create(Clazz: TClass; AttributeName: string);
  end;

  EVersionInDynamicProperty = class(EOPFBaseException)
  public
    constructor Create(AMember: TRttiMember);
  end;

  EVersionInInheritedClass = class(EOPFBaseException)
  public
    constructor Create(AMember: TRttiMember);
  end;

  EVersionDuplicated = class(EOPFBaseException)
  public
    constructor Create(AMember: TRttiMember);
  end;

  ECannotSetIdMissingFinder = class(EOPFBaseException)
  public
    constructor Create(AClass: TClass);
  end;

implementation

uses
  Variants,
  Aurelius.Global.Utils;

{ EMappingNotFound }

constructor EMappingNotFound.Create(MappingName: string; AClass: TClass);
var
  ClazzName: string;
begin
  if AClass <> nil then
    ClazzName := AClass.ClassName
  else
    ClazzName := '"nil"';
  inherited CreateFmt('Cannot find mapping [%s] on class %s.',
    [MappingName, ClazzName]);
end;

{ EInvalidAssociation }

constructor EInvalidAssociation.Create(ClassName, FieldName: string);
begin
  inherited CreateFmt('Invalid association attribute on %s.%s.',
    [ClassName, FieldName]);
end;

{ EColumnNotFound }

constructor EColumnNotFound.Create(ClassName, ColumnName: string);
begin
  inherited CreateFmt('Column "%s" not found on class "%s".',
    [ColumnName, ClassName]);
end;

{ EInvalidDiscriminatorValue }

constructor EInvalidDiscriminatorValue.Create(DiscrValue: Variant);
begin
  inherited CreateFmt('Invalid discriminator value: "%s".',
    [VarToStr(DiscrValue)]);
end;

{ EColumnNotFoundForAttribute }

constructor EColumnNotFoundForAttribute.Create(ClassName,
  AttributeName: string);
begin
  inherited CreateFmt('No column found on attribute/property "%s" of class "%s".',
    [AttributeName, ClassName]);
end;

{ EUnexpectedEnumValue }

constructor EUnexpectedEnumValue.Create(EnumValue, EnumTypeName: string);
begin
  inherited CreateFmt('Enum value "%s" read from DB is unexpected for ' +
    'enum type %s.', [EnumValue, EnumTypeName]);
end;

{ EPropertyNotFound }

constructor EPropertyNotFound.Create(ClassName, PropName: string);
begin
  inherited CreateFmt('Property "%s" not found on class "%s".',
    [PropName, ClassName]);
end;

{ EUnexpectedDiscriminatorType }

constructor EUnexpectedDiscriminatorType.Create(DiscrTypeName: string);
begin
  inherited CreateFmt('Unexpected discriminator type: "%s"', [DiscrTypeName]);
end;

{ EInvalidColumnName }

constructor EInvalidUniqueColumnName.Create(ColumnName, ClassName: string);
begin
  inherited CreateFmt('Invalid column name "%s" defined in unique constraint ' +
    'on class %s.', [ColumnName, ClassName]);
end;

{ EUnexpectedFieldType }

constructor EUnexpectedFieldType.Create(FieldTypeString: string);
begin
  inherited CreateFmt('Unexpected field type: %s.', [FieldTypeString]);
end;

{ EInvalidEntity }

constructor EInvalidEntity.Create(ClassName: string);
begin
  inherited CreateFmt('Class %s is not a valid Entity. [Entity] attribute missing.',
    [ClassName]);
end;

{ EClassNotRegistered }

constructor EClassNotRegistered.Create(Clazz: TClass);
begin
  inherited CreateFmt('Class %s is not registered. Register it in the ' +
    'MappedEntities.', [Clazz.ClassName]);
end;

{ EInvalidIdType }

constructor EInvalidIdType.Create(AClass: TClass);
begin
  inherited CreateFmt('Invalid Id type for class %s', [AClass.ClassName]);
end;

{ EMultipleColumnsFoundForAttribute }

constructor EMultipleColumnsFoundForAttribute.Create(ClassName,
  AttributeName: string);
begin
  inherited CreateFmt('Mixed Column, JoinColumn and/or ForeignJoinColumn used in member "%s" of class "%s".',
    [AttributeName, ClassName]);
end;

{ ETooManyJoinColumns }

constructor ETooManyJoinColumns.Create(ClassName, AttributeName: string);
begin
  inherited CreateFmt('Too many JoinColumn or ForeignJoinColumn attributes in member "%s" of class "%s".',
    [AttributeName, ClassName]);
end;

{ ETooManyPrimaryJoinColumns }

constructor ETooManyPrimaryJoinColumns.Create(ClassName: string);
begin
  inherited CreateFmt('Too many PrimaryJoinColumn attributes in class "%s".', [ClassName]);
end;

{ EEnumerationNotMapped }

constructor EEnumerationNotMapped.Create(ATypeName: string);
begin
  inherited CreateFmt('Enumeration "%s" not mapped. Please use either [Enumeration] or [Automapping] attribute, '+
    'or set AutoMappingMode to Full in global configuration', [ATypeName]);
end;

{ EIdValueConvertFail }

constructor EIdValueConvertFail.Create(Clazz: TClass; Column: TColumn; AValue: Variant);
var
  ClassName, ColumnName, AttributeName, DatabaseValue: string;
begin
  FClass := Clazz;
  FColumn := Column;
  FValue := AValue;
  ClassName := Clazz.ClassName;
  ColumnName := Column.Name;
  AttributeName := Column.Optimization.MemberName;
  try
    DatabaseValue := TUtils.VariantToString(AValue);
  except
    DatabaseValue := '(unavailable)';
  end;
  inherited CreateFmt('Could not check/convert Id for null values. '#13#10 +
    'Class name: %s'#13#10 +
    'Column name: %s'#13#10 +
    'Attribute name: %s'#13#10 +
    'Database value: %s',
    [ClassName,
     ColumnName,
     AttributeName,
     DatabaseValue]);
end;

{ EInvalidReferencedColumnName }

constructor EInvalidReferencedColumnName.Create(ColumnName, ClassName: string);
begin
  inherited CreateFmt('Invalid referenced column name "%s" defined in join column ' +
    'on class %s.', [ColumnName, ClassName]);
end;

{ EInvalidIdMemberName }

constructor EInvalidIdMemberName.Create(MemberName, ClassName: string);
begin
  inherited CreateFmt('Invalid member name "%s" defined in Id attribute ' +
    'on class %s.', [MemberName, ClassName]);
end;

{ EDBToObjectConvertFail }

constructor EDBToObjectConvertFail.Create(Clazz: TClass; Column: TColumn;
  AValue: Variant);
var
  ClassName, ColumnName, AttributeName, DatabaseValue: string;
begin
  FClass := Clazz;
  FColumn := Column;
  FValue := AValue;
  ClassName := Clazz.ClassName;
  ColumnName := Column.Name;
  AttributeName := Column.Optimization.MemberName;
  try
    DatabaseValue := TUtils.VariantToString(AValue);
  except
    DatabaseValue := '(unavailable)';
  end;
  inherited CreateFmt('Could not convert database value to object member. '#13#10 +
    'Class name: %s'#13#10 +
    'Column name: %s'#13#10 +
    'Attribute name: %s'#13#10 +
    'Database value: %s',
    [ClassName,
     ColumnName,
     AttributeName,
     DatabaseValue]);
end;

{ EDynamicColumnNotSpecified }

constructor EDynamicColumnNotSpecified.Create(Clazz: TClass; PropName: string);
begin
  inherited CreateFmt('Column not specified in dynamic property %s.%s', [Clazz.ClassName, PropName]);
end;

{ EInvalidMappedByReference }

constructor EInvalidMappedByReference.Create(Clazz: TClass;
  AttributeName: string);
begin
  inherited CreateFmt('Invalid MappedBy parameter in ManyValuedAssociation on %s.%s member',
    [Clazz.ClassName, AttributeName]);
end;

{ EInvalidOrderByMemberName }

constructor EInvalidOrderByMemberName.Create(MemberName, ClassName: string);
begin
  inherited CreateFmt('Invalid member name "%s" defined in OrderBy attribute ' +
    'on class %s.', [MemberName, ClassName]);
end;

{ EVersionInDynamicProperty }

constructor EVersionInDynamicProperty.Create(AMember: TRttiMember);
begin
  inherited CreateFmt('Invalid Version attribute in class member "%s.%s". ' +
    'Dynamic properties are not supported.', [AMember.Parent.Name, AMember.Name]);
end;

{ EVersionInInheritedClass }

constructor EVersionInInheritedClass.Create(AMember: TRttiMember);
begin
  inherited CreateFmt('Invalid Version attribute in class member "%s.%s". ' +
    'Only base class of hierarchy can have Version attribute.', [AMember.Parent.Name, AMember.Name]);
end;

{ EVersionDuplicated }

constructor EVersionDuplicated.Create(AMember: TRttiMember);
begin
  inherited CreateFmt('Invalid Version attribute in class member "%s.%s". ' +
    'Class already has another Version attribute.', [AMember.Parent.Name, AMember.Name]);
end;

{ ECannotSetIdMissingFinder }

constructor ECannotSetIdMissingFinder.Create(AClass: TClass);
begin
  inherited CreateFmt('Cannot set id on entity of type %s: missing Finder object',
    [AClass.ClassName]);
end;

end.
