unit DevExpressBR;

interface

uses dxCore, cxLocalization, cxFilterControlStrs, cxGridStrs, dxExtCtrlsStrs,
  cxFilterConsts, dxPSRes;

implementation

procedure SetResorceGridStrs;
begin
  //cxGrid
  cxSetResourceString(@scxGridRecursiveLevels, 'Você não pode criar níveis recusivos');
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText,'Deletar registro?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText,'Deletar tods os registros selecionandos?');
  cxSetResourceString(@scxGridNoDataInfoText,'<Não há dados para exibir>');
  cxSetResourceString(@scxGridFilterRowInfoText, 'Click aqui para definir o filtro');
  cxSetResourceString(@scxGridNewItemRowInfoText, 'Click aqui para adicionar nova linha');

  cxSetResourceString(@scxGridFilterIsEmpty, '<Filtros em Branco>');
  cxSetResourceString(@scxGridCustomizationFormCaption, 'Customização');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Colunas');
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Arraste um cabeçalho de coluna aqui para agrupar por essa coluna');
  cxSetResourceString(@scxGridFilterApplyButtonCaption, 'Aplicar Filtro');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Customize...');
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, 'Click aqui para exibir/ocultar/mover colunas');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Bands');
  cxSetResourceString(@scxGridBandsQuickCustomizationHint, 'Click aqui para exibir/ocultar/mover bands');
  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, 'Linhas');

  cxSetResourceString(@scxGridConverterIntermediaryMissing, 'Missing an intermediary component!'#13#10'Please add a %s component to the form.');
  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid does not exist');
  cxSetResourceString(@scxGridConverterNotExistComponent, 'Component does not exist');
  cxSetResourceString(@scxImportErrorCaption, 'Import error');

  cxSetResourceString(@scxNotExistGridView, 'Grid view does not exist');
//  cxSetResourceString(@scxNotExistGridLevel, 'Active grid level does not exist');
//  cxSetResourceString(@scxCantCreateExportOutputFile, 'Can''t create the export output file');

  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem, 'ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control');

  // date ranges

  cxSetResourceString(@scxGridYesterday, 'Yesterday');
  cxSetResourceString(@scxGridToday, 'Today');
  cxSetResourceString(@scxGridTomorrow, 'Tomorrow');
  cxSetResourceString(@scxGridLast30Days, 'Last 30 days');
  cxSetResourceString(@scxGridLast14Days, 'Last 14 days');
  cxSetResourceString(@scxGridLast7Days, 'Last 7 days');
  cxSetResourceString(@scxGridNext7Days, 'Next 7 days');
  cxSetResourceString(@scxGridNext14Days, 'Next 14 days');
  cxSetResourceString(@scxGridNext30Days, 'Next 30 days');
  cxSetResourceString(@scxGridLastTwoWeeks, 'Last two weeks');
  cxSetResourceString(@scxGridLastWeek, 'Last week');
  cxSetResourceString(@scxGridThisWeek, 'This week');
  cxSetResourceString(@scxGridNextWeek, 'Next week');
  cxSetResourceString(@scxGridNextTwoWeeks, 'Next two weeks');
  cxSetResourceString(@scxGridLastMonth, 'Last month');
  cxSetResourceString(@scxGridThisMonth, 'This month');
  cxSetResourceString(@scxGridNextMonth, 'Next month');
  cxSetResourceString(@scxGridLastYear, 'Last year');
  cxSetResourceString(@scxGridThisYear, 'This year');
  cxSetResourceString(@scxGridNextYear, 'Next year');
  cxSetResourceString(@scxGridPast, 'Past');
  cxSetResourceString(@scxGridFuture, 'Future');

  cxSetResourceString(@scxGridMonthFormat, 'mmmm yyyy');
  cxSetResourceString(@scxGridYearFormat, 'yyyy');

  // ChartView

  cxSetResourceString(@scxGridChartCategoriesDisplayText, 'Data');

  cxSetResourceString(@scxGridChartValueHintFormat , '%s for %s is %s');  // series display text, category, value
  cxSetResourceString(@scxGridChartPercentValueTickMarkLabelFormat, '0%');

  cxSetResourceString(@scxGridChartToolBoxDataLevels, 'Data Levels:');
  cxSetResourceString(@scxGridChartToolBoxDataLevelSelectValue, 'select value');
  cxSetResourceString(@scxGridChartToolBoxCustomizeButtonCaption, 'Customize Chart');

  cxSetResourceString(@scxGridChartNoneDiagramDisplayText, 'No diagram');
  cxSetResourceString(@scxGridChartColumnDiagramDisplayText, 'Column diagram');
  cxSetResourceString(@scxGridChartBarDiagramDisplayText, 'Bar diagram');
  cxSetResourceString(@scxGridChartLineDiagramDisplayText, 'Line diagram');
  cxSetResourceString(@scxGridChartAreaDiagramDisplayText, 'Area diagram');
  cxSetResourceString(@scxGridChartPieDiagramDisplayText, 'Pie diagram');
  cxSetResourceString(@scxGridChartStackedBarDiagramDisplayText, 'Stacked Bars diagram');
  cxSetResourceString(@scxGridChartStackedColumnDiagramDisplayText, 'Stacked Columns diagram');
  cxSetResourceString(@scxGridChartStackedAreaDiagramDisplayText, 'Stacked Area diagram');

  cxSetResourceString(@scxGridChartCustomizationFormSeriesPageCaption, 'Series');
  cxSetResourceString(@scxGridChartCustomizationFormSortBySeries, 'Sort by:');
  cxSetResourceString(@scxGridChartCustomizationFormNoSortedSeries , '<none series>');
  cxSetResourceString(@scxGridChartCustomizationFormDataGroupsPageCaption, 'Data Groups');
  cxSetResourceString(@scxGridChartCustomizationFormOptionsPageCaption, 'Options');

  cxSetResourceString(@scxGridChartLegend, 'Legend');
  cxSetResourceString(@scxGridChartLegendKeyBorder, 'Key Border');
  cxSetResourceString(@scxGridChartPosition, 'Position');
  cxSetResourceString(@scxGridChartPositionDefault, 'Default');
  cxSetResourceString(@scxGridChartPositionNone, 'None');
  cxSetResourceString(@scxGridChartPositionLeft, 'Left');
  cxSetResourceString(@scxGridChartPositionTop, 'Top');
  cxSetResourceString(@scxGridChartPositionRight, 'Right');
  cxSetResourceString(@scxGridChartPositionBottom, 'Bottom');
  cxSetResourceString(@scxGridChartAlignment, 'Alignment');
  cxSetResourceString(@scxGridChartAlignmentDefault, 'Default');
  cxSetResourceString(@scxGridChartAlignmentStart, 'Start');
  cxSetResourceString(@scxGridChartAlignmentCenter, 'Center');
  cxSetResourceString(@scxGridChartAlignmentEnd, 'End');
  cxSetResourceString(@scxGridChartOrientation, 'Orientation');
  cxSetResourceString(@scxGridChartOrientationDefault, 'Default');
  cxSetResourceString(@scxGridChartOrientationHorizontal, 'Horizontal');
  cxSetResourceString(@scxGridChartOrientationVertical, 'Vertical');
  cxSetResourceString(@scxGridChartBorder, 'Border');
  cxSetResourceString(@scxGridChartTitle, 'Title');
  cxSetResourceString(@scxGridChartToolBox, 'ToolBox');
  cxSetResourceString(@scxGridChartDiagramSelector, 'Diagram Selector');
  cxSetResourceString(@scxGridChartOther, 'Other');
  cxSetResourceString(@scxGridChartValueHints, 'Value Hints');

  cxSetResourceString(@scxGridLayoutViewCustomizeFormOk, 'OK');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormCancel, 'Cancel');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormApply, 'Apply');
  cxSetResourceString(@scxGridLayoutViewCustomizeWarningDialogCaption, 'Warning');
  cxSetResourceString(@scxGridLayoutViewCustomizeWarningDialogMessage, 'The layout has been changed. Do you want to save changes?');
  cxSetResourceString(@scxGridLayoutViewCustomizeLayoutButtonCaption, 'Layout Editor');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormTemplateCard, 'Template Card');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormViewLayout, 'View Layout');
  cxSetResourceString(@scxGridLayoutViewRecordCaptionDefaultMask , '[RecordIndex] of [RecordCount]');

  cxSetResourceString(@scxGridLockedStateImageText, 'Please wait...');


end;

procedure SetResorceFilterControlStrs;
begin
  // cxFilterBoolOperator
  cxSetResourceString(@cxSFilterBoolOperatorAnd, 'E');        // all
  cxSetResourceString(@cxSFilterBoolOperatorOr, 'OU');          // any
  cxSetResourceString(@cxSFilterBoolOperatorNotAnd, 'NÂO E'); // not all
  cxSetResourceString(@cxSFilterBoolOperatorNotOr, 'NÃO OU');   // not any
  //
  cxSetResourceString(@cxSFilterRootButtonCaption, 'Filtro');
  cxSetResourceString(@cxSFilterAddCondition, 'Add &Condição');
  cxSetResourceString(@cxSFilterAddGroup, 'Add &Grupo');
  cxSetResourceString(@cxSFilterRemoveRow , '&Remover Linha');
  cxSetResourceString(@cxSFilterClearAll, 'Limpar &Todos');
  cxSetResourceString(@cxSFilterFooterAddCondition, 'Clique aqui para adicionar uma nova condição');

  cxSetResourceString(@cxSFilterGroupCaption, 'aplica-se às seguintes condições');
  cxSetResourceString(@cxSFilterRootGroupCaption , '<root>');
  cxSetResourceString(@cxSFilterControlNullString , '<empty>');

  cxSetResourceString(@cxSFilterErrorBuilding, 'Can''t build filter from source');

  //FilterDialog
  cxSetResourceString(@cxSFilterDialogCaption, 'Custom Filter');
  cxSetResourceString(@cxSFilterDialogInvalidValue, 'Invalid value');
  cxSetResourceString(@cxSFilterDialogUse, 'Use');
  cxSetResourceString(@cxSFilterDialogSingleCharacter, 'to represent any single character');
  cxSetResourceString(@cxSFilterDialogCharactersSeries, 'to represent any series of characters');
  cxSetResourceString(@cxSFilterDialogOperationAnd, 'E');
  cxSetResourceString(@cxSFilterDialogOperationOr, 'OU');
  cxSetResourceString(@cxSFilterDialogRows, 'Show rows where:');

  // FilterControlDialog
  cxSetResourceString(@cxSFilterControlDialogCaption, 'Filter builder');
  cxSetResourceString(@cxSFilterControlDialogNewFile, 'untitled.flt');
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, 'Open an existing filter');
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, 'Save the active filter to file');
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , '&Save As...');
  cxSetResourceString(@cxSFilterControlDialogActionSaveHint, 'Save As|Saves the active filter with a new name');
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , '&Open...');
  cxSetResourceString(@cxSFilterControlDialogActionOpenHint, 'Open|Opens an existing filter');
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , '&Apply');
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, 'OK');
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, 'Cancel');
  cxSetResourceString(@cxSFilterControlDialogFileExt, 'flt');
  cxSetResourceString(@cxSFilterControlDialogFileFilter, 'Filters (*.flt)|*.flt');
end;

procedure SetResourcesPSRes;
begin

  cxSetResourceString(@sdxBtnOK, 'OK');
  cxSetResourceString(@sdxBtnOKAccelerated , '&OK');
  cxSetResourceString(@sdxBtnCancel, 'Cancel');
  cxSetResourceString(@sdxBtnClose, 'Close');
  cxSetResourceString(@sdxBtnApply , '&Apply');
  cxSetResourceString(@sdxBtnHelp , '&Help');
  cxSetResourceString(@sdxBtnFix , '&Fix');
  cxSetResourceString(@sdxBtnNew , '&New...');
  cxSetResourceString(@sdxBtnIgnore , '&Ignore');
  cxSetResourceString(@sdxBtnYes , '&Yes');
  cxSetResourceString(@sdxBtnNo , '&No');
  cxSetResourceString(@sdxBtnEdit , '&Edit...');
  cxSetResourceString(@sdxBtnReset , '&Reset');
  cxSetResourceString(@sdxBtnAdd , '&Add');
  cxSetResourceString(@sdxBtnAddComposition, 'Add &Composition');
  cxSetResourceString(@sdxBtnDefault , '&Default...');
  cxSetResourceString(@sdxBtnDelete , '&Delete...');
  cxSetResourceString(@sdxBtnDescription , '&Description...');
  cxSetResourceString(@sdxBtnCopy , '&Copy...');
  cxSetResourceString(@sdxBtnYesToAll, 'Yes To &All');
  cxSetResourceString(@sdxBtnFootnoteProperties, 'Footnote Properties...');
  cxSetResourceString(@sdxBtnRestoreDefaults , '&Restore Defaults');
  cxSetResourceString(@sdxBtnRestoreOriginal, 'Restore &Original');
  cxSetResourceString(@sdxBtnTitleProperties, 'Title Properties...');
  cxSetResourceString(@sdxBtnProperties, 'P&roperties...');
  cxSetResourceString(@sdxBtnNetwork, 'Net&work...');
  cxSetResourceString(@sdxBtnBrowse , '&Browse...');
  cxSetResourceString(@sdxBtnPageSetup, 'Pa&ge Setup...');
  cxSetResourceString(@sdxBtnPrintPreview, 'Print Pre&view...');
  cxSetResourceString(@sdxBtnPreview, 'Pre&view...');
  cxSetResourceString(@sdxBtnPrint, 'Print...');
  cxSetResourceString(@sdxBtnOptions , '&Options...');
  cxSetResourceString(@sdxBtnStyleOptions, 'Style Options...');
  cxSetResourceString(@sdxBtnDefinePrintStyles , '&Define Styles...');
  cxSetResourceString(@sdxBtnPrintStyles, 'Print Styles');
  cxSetResourceString(@sdxBtnBackground, 'Background');
  cxSetResourceString(@sdxBtnShowToolBar, 'Show &ToolBar');
  cxSetResourceString(@sdxBtnDesign, 'D&esign...');
  cxSetResourceString(@sdxBtnMoveUp, 'Move &Up');
  cxSetResourceString(@sdxBtnMoveDown, 'Move Dow&n');

  cxSetResourceString(@sdxBtnMoreColors , '&More Colors...');
  cxSetResourceString(@sdxBtnFillEffects , '&Fill Effects...');
  cxSetResourceString(@sdxBtnNoFill , '&No Fill');
  cxSetResourceString(@sdxBtnAutomatic , '&Automatic');
  cxSetResourceString(@sdxBtnNone , '&None');

  cxSetResourceString(@sdxBtnOtherTexture, 'Other Te&xture...');
  cxSetResourceString(@sdxBtnInvertColors, 'I&nvert Colors');
  cxSetResourceString(@sdxBtnSelectPicture, 'Se&lect Picture...');

  cxSetResourceString(@sdxEditReports, 'Edit Reports');
  cxSetResourceString(@sdxComposition, 'Composition');
  cxSetResourceString(@sdxReportFootnotesDlgCaption, 'Report Footnotes');
  cxSetResourceString(@sdxReportTitleDlgCaption, 'Report Title');
  cxSetResourceString(@sdxMode , '&Mode:');
  cxSetResourceString(@sdxText , '&Text');
  cxSetResourceString(@sdxProperties , '&Properties');
  cxSetResourceString(@sdxAdjustOnScale , '&Adjust on Scale');

  // Report Title mode
  cxSetResourceString(@sdxTitleModeNone, 'None');
  cxSetResourceString(@sdxTitleModeOnEveryTopPage, 'On Every Top Page');
  cxSetResourceString(@sdxTitleModeOnFirstPage, 'On First Page');

  // Report Footnotes mode
  cxSetResourceString(@sdxFootnotesModeNone, 'None');
  cxSetResourceString(@sdxFootnotesModeOnEveryBottomPage, 'On Every Bottom Page');
  cxSetResourceString(@sdxFootnotesModeOnLastPage, 'On Last Page');

  cxSetResourceString(@sdxEditDescription, 'Edit Description');
  cxSetResourceString(@sdxRename, 'Rena&me');
  cxSetResourceString(@sdxSelectAll , '&Select All');

  cxSetResourceString(@sdxAddReport, 'Add Report');
  cxSetResourceString(@sdxAddAndDesignReport, 'Add and D&esign Report...');
  cxSetResourceString(@sdxNewCompositionCaption, 'New Composition');
  cxSetResourceString(@sdxName , '&Name:');
  cxSetResourceString(@sdxCaption , '&Caption:');
  cxSetResourceString(@sdxAvailableSources , '&Available Source(s)');
  cxSetResourceString(@sdxOnlyComponentsInActiveForm, 'Only Components in Active &Form');
  cxSetResourceString(@sdxOnlyComponentsWithoutLinks, 'Only Components &without Existing ReportLinks');
  cxSetResourceString(@sdxItemName, 'Name');
  cxSetResourceString(@sdxItemDescription, 'Description');

  cxSetResourceString(@sdxConfirmDeleteItem, 'Do you want to delete next items: %s ?');
  cxSetResourceString(@sdxAddItemsToComposition, 'Add Items to Composition');
  cxSetResourceString(@sdxHideAlreadyIncludedItems, 'Hide Already &Included Items');
  cxSetResourceString(@sdxAvailableItems, 'A&vailable Items');
  cxSetResourceString(@sdxItems , '&Items');
  cxSetResourceString(@sdxEnable , '&Enable');
  cxSetResourceString(@sdxOptions, 'Options');
  cxSetResourceString(@sdxShow, 'Show');
  cxSetResourceString(@sdxPaintItemsGraphics , '&Paint Item Graphics');
  cxSetResourceString(@sdxDescription , '&Description:');

  cxSetResourceString(@sdxNewReport, 'NewReport');

  cxSetResourceString(@sdxOnlySelected, 'Only &Selected');
  cxSetResourceString(@sdxExtendedSelect , '&Extended Select');
  cxSetResourceString(@sdxIncludeFixed , '&Include Fixed');

  cxSetResourceString(@sdxFonts, 'Fonts');
  cxSetResourceString(@sdxBtnFont, 'Fo&nt...');
  cxSetResourceString(@sdxBtnEvenFont, 'E&ven Font...');
  cxSetResourceString(@sdxBtnOddFont, 'Odd Fo&nt...');
  cxSetResourceString(@sdxBtnFixedFont, 'F&ixed Font...');
  cxSetResourceString(@sdxBtnGroupFont, 'Grou&p Font...');
  cxSetResourceString(@sdxBtnChangeFont, 'Change Fo&nt...');

  cxSetResourceString(@sdxFont, 'Font');
  cxSetResourceString(@sdxOddFont, 'Odd Font');
  cxSetResourceString(@sdxEvenFont, 'Even Font');
  cxSetResourceString(@sdxPreviewFont, 'Preview Font');
  cxSetResourceString(@sdxCaptionNodeFont, 'Level Caption Font');
  cxSetResourceString(@sdxGroupNodeFont, 'Group Node Font');
  cxSetResourceString(@sdxGroupFooterFont, 'Group Footer Font');
  cxSetResourceString(@sdxHeaderFont, 'Header Font');
  cxSetResourceString(@sdxFooterFont, 'Footer Font');
  cxSetResourceString(@sdxBandFont, 'Band Font');

  cxSetResourceString(@sdxTransparent , '&Transparent');
  cxSetResourceString(@sdxFixedTransparent, 'Fi&xed Transparent');
  cxSetResourceString(@sdxCaptionTransparent, 'Caption Transparent');
  cxSetResourceString(@sdxGroupTransparent, 'Group Transparent');

  cxSetResourceString(@sdxGraphicAsTextValue , '(GRAPHIC)');
  cxSetResourceString(@sdxColors, 'Colors');
  cxSetResourceString(@sdxColor, 'Co&lor:');
  cxSetResourceString(@sdxOddColor, 'Odd Co&lor:');
  cxSetResourceString(@sdxEvenColor, 'E&ven Color:');
  cxSetResourceString(@sdxPreviewColor , '&Preview Color:');
  cxSetResourceString(@sdxBandColor , '&Band Color:');
  cxSetResourceString(@sdxLevelCaptionColor, 'Le&vel Caption Color:');
  cxSetResourceString(@sdxHeaderColor, 'H&eader Color:');
  cxSetResourceString(@sdxGroupNodeColor, 'Group &Node Color:');
  cxSetResourceString(@sdxGroupFooterColor , '&Group Footer Color:');
  cxSetResourceString(@sdxFooterColor, 'Foo&ter Color:');
  cxSetResourceString(@sdxFixedColor, 'F&ixed Color:');
  cxSetResourceString(@sdxGroupColor, 'Grou&p Color:');
  cxSetResourceString(@sdxCaptionColor, 'Caption Color:');
  cxSetResourceString(@sdxGridLinesColor, 'Gri&d Line Color:');

  cxSetResourceString(@sdxBands , '&Bands');
  cxSetResourceString(@sdxLevelCaptions, 'Levels &Caption');
  cxSetResourceString(@sdxHeaders, 'H&eaders');
  cxSetResourceString(@sdxFooters, 'Foote&rs');
  cxSetResourceString(@sdxGroupFooters , '&Group Footers');
  cxSetResourceString(@sdxPreview, 'Previe&w');
  cxSetResourceString(@sdxPreviewLineCount, 'Preview Line Coun&t:');
  cxSetResourceString(@sdxAutoCalcPreviewLineCount, 'A&uto Calculate Preview Lines');

  cxSetResourceString(@sdxGrid, 'Grid Lines');
  cxSetResourceString(@sdxNodesGrid, 'Node Grid Lines');
  cxSetResourceString(@sdxGroupFooterGrid, 'GroupFooter Grid Lines');

  cxSetResourceString(@sdxStateImages , '&State Images');
  cxSetResourceString(@sdxImages , '&Images');

  cxSetResourceString(@sdxTextAlign, 'Text&Align');
  cxSetResourceString(@sdxTextAlignHorz, 'Hori&zontally');
  cxSetResourceString(@sdxTextAlignVert , '&Vertically');
  cxSetResourceString(@sdxTextAlignLeft, 'Left');
  cxSetResourceString(@sdxTextAlignCenter, 'Center');
  cxSetResourceString(@sdxTextAlignRight, 'Right');
  cxSetResourceString(@sdxTextAlignTop, 'Top');
  cxSetResourceString(@sdxTextAlignVCenter, 'Center');
  cxSetResourceString(@sdxTextAlignBottom, 'Bottom');
  cxSetResourceString(@sdxBorderLines , '&Border');
  cxSetResourceString(@sdxHorzLines, 'Hori&zontal Lines');
  cxSetResourceString(@sdxVertLines , '&Vertical Lines');
  cxSetResourceString(@sdxFixedHorzLines, 'Fi&xed Horizontal Lines');
  cxSetResourceString(@sdxFixedVertLines, 'Fixe&d Vertical Lines');
  cxSetResourceString(@sdxFlatCheckMarks, 'F&lat CheckMarks');
  cxSetResourceString(@sdxCheckMarksAsText , '&Display CheckMarks as Text');

  cxSetResourceString(@sdxRowAutoHeight, 'Ro&w AutoHeight');
  cxSetResourceString(@sdxEndEllipsis , '&EndEllipsis');

  cxSetResourceString(@sdxDrawBorder , '&Draw Border');
  cxSetResourceString(@sdxFullExpand, 'Full &Expand');
  cxSetResourceString(@sdxBorderColor , '&Border Color:');
  cxSetResourceString(@sdxAutoNodesExpand, 'A&uto Nodes Expand');
  cxSetResourceString(@sdxExpandLevel, 'Expand &Level:');
  cxSetResourceString(@sdxFixedRowOnEveryPage, 'Fixed Rows');

  cxSetResourceString(@sdxDrawMode, 'Draw &Mode:');
  cxSetResourceString(@sdxDrawModeStrict, 'Strict');
  cxSetResourceString(@sdxDrawModeOddEven, 'Odd/Even Rows Mode');
  cxSetResourceString(@sdxDrawModeChess, 'Chess Mode');
  cxSetResourceString(@sdxDrawModeBorrow, 'Borrow From Source');

  cxSetResourceString(@sdx3DEffects, '3D Effects');
  cxSetResourceString(@sdxUse3DEffects, 'Use &3D Effects');
  cxSetResourceString(@sdxSoft3D, 'Sof&t3D');

  cxSetResourceString(@sdxBehaviors, 'Behaviors');
  cxSetResourceString(@sdxMiscellaneous, 'Miscellaneous');
  cxSetResourceString(@sdxOnEveryPage, 'On Every Page');
  cxSetResourceString(@sdxNodeExpanding, 'Node Expanding');
  cxSetResourceString(@sdxSelection, 'Selection');
  cxSetResourceString(@sdxNodeAutoHeight , '&Node Auto Height');
  cxSetResourceString(@sdxTransparentGraphics , '&Transparent Graphics');
  cxSetResourceString(@sdxAutoWidth, 'Auto &Width');

  cxSetResourceString(@sdxDisplayGraphicsAsText, 'Display Graphic As &Text');
  cxSetResourceString(@sdxTransparentColumnGraphics, 'Transparent &Graphics');

  cxSetResourceString(@sdxBandsOnEveryPage, 'Bands');
  cxSetResourceString(@sdxHeadersOnEveryPage, 'Headers');
  cxSetResourceString(@sdxFootersOnEveryPage, 'Footers');
  cxSetResourceString(@sdxGraphics , '&Graphics');

  // Common messages

  cxSetResourceString(@sdxOutOfResources, 'Out of Resources');
  cxSetResourceString(@sdxFileAlreadyExists, 'File "%s" Already Exists.');
  cxSetResourceString(@sdxConfirmOverWrite, 'File "%s" already exists. Overwrite ?');
  cxSetResourceString(@sdxInvalidFileName, 'Invalid File Name "%s"');
  cxSetResourceString(@sdxRequiredFileName, 'Enter file name.');
  cxSetResourceString(@sdxOutsideMarginsMessage,
    'One or more margins are set outside the printable area of the page.' + #13#10 +
    'Do you want to continue ?');
  cxSetResourceString(@sdxOutsideMarginsMessage2,
    'One or more margins are set outside the printable area of the page.' + #13#10 +
    'Choose the Fix button to increase the appropriate margins.');
  cxSetResourceString(@sdxInvalidMarginsMessage,
    'One or more margins are set to the invalid values.' + #13#10 +
    'Choose the Fix button to correct this problem.' + #13#10 +
    'Choose the Restore button to restore original values.');
  cxSetResourceString(@sdxInvalidMargins, 'One or more margins have invalid values');
  cxSetResourceString(@sdxOutsideMargins, 'One or more margins are set outside the printable area of the page');
  cxSetResourceString(@sdxReportCellClassNotRegistered, '%s class is not registered. ' +
    'Make sure that the corresponding report link unit is added to the application');
  cxSetResourceString(@sdxThereAreNowItemsForShow, 'There are no items in this view');

  // Color palette

  cxSetResourceString(@sdxPageBackground,  'Page Background');
  cxSetResourceString(@sdxPenColor, 'Pen Color');
  cxSetResourceString(@sdxFontColor, 'Font Color');
  cxSetResourceString(@sdxBrushColor, 'Brush Color');
  cxSetResourceString(@sdxHighLight, 'HighLight');

  // Color names

  cxSetResourceString(@sdxColorBlack, 'Black');
  cxSetResourceString(@sdxColorDarkRed, 'Dark Red');
  cxSetResourceString(@sdxColorRed, 'Red');
  cxSetResourceString(@sdxColorPink, 'Pink');
  cxSetResourceString(@sdxColorRose, 'Rose');
  cxSetResourceString(@sdxColorBrown, 'Brown');
  cxSetResourceString(@sdxColorOrange, 'Orange');
  cxSetResourceString(@sdxColorLightOrange, 'Light Orange');
  cxSetResourceString(@sdxColorGold, 'Gold');
  cxSetResourceString(@sdxColorTan, 'Tan');
  cxSetResourceString(@sdxColorOliveGreen, 'Olive Green');
  cxSetResourceString(@sdxColorDrakYellow, 'Dark Yellow');
  cxSetResourceString(@sdxColorLime, 'Lime');
  cxSetResourceString(@sdxColorYellow, 'Yellow');
  cxSetResourceString(@sdxColorLightYellow, 'Light Yellow');
  cxSetResourceString(@sdxColorDarkGreen, 'Dark Green');
  cxSetResourceString(@sdxColorGreen, 'Green');
  cxSetResourceString(@sdxColorSeaGreen, 'Sea Green');
  cxSetResourceString(@sdxColorBrighthGreen, 'Bright Green');
  cxSetResourceString(@sdxColorLightGreen, 'Light Green');
  cxSetResourceString(@sdxColorDarkTeal, 'Dark Teal');
  cxSetResourceString(@sdxColorTeal, 'Teal');
  cxSetResourceString(@sdxColorAqua, 'Aqua');
  cxSetResourceString(@sdxColorTurquoise, 'Turquoise');
  cxSetResourceString(@sdxColorLightTurquoise, 'Light Turquoise');
  cxSetResourceString(@sdxColorDarkBlue, 'Dark Blue');
  cxSetResourceString(@sdxColorBlue, 'Blue');
  cxSetResourceString(@sdxColorLightBlue, 'Light Blue');
  cxSetResourceString(@sdxColorSkyBlue, 'Sky Blue');
  cxSetResourceString(@sdxColorPaleBlue, 'Pale Blue');
  cxSetResourceString(@sdxColorIndigo, 'Indigo');
  cxSetResourceString(@sdxColorBlueGray, 'Blue Gray');
  cxSetResourceString(@sdxColorViolet, 'Violet');
  cxSetResourceString(@sdxColorPlum, 'Plum');
  cxSetResourceString(@sdxColorLavender, 'Lavender');
  cxSetResourceString(@sdxColorGray80, 'Gray-80%');
  cxSetResourceString(@sdxColorGray50, 'Gray-50%');
  cxSetResourceString(@sdxColorGray40, 'Gray-40%');
  cxSetResourceString(@sdxColorGray25, 'Gray-25%');
  cxSetResourceString(@sdxColorWhite, 'White');

  // FEF Dialog

  cxSetResourceString(@sdxTexture , '&Texture');
  cxSetResourceString(@sdxPattern , '&Pattern');
  cxSetResourceString(@sdxPicture, 'P&icture');
  cxSetResourceString(@sdxForeground , '&Foreground');
  cxSetResourceString(@sdxBackground , '&Background');
  cxSetResourceString(@sdxSample, 'Sample:');

  cxSetResourceString(@sdxFEFCaption, 'Fill Effects');
  cxSetResourceString(@sdxPaintMode, 'Paint &Mode');
  cxSetResourceString(@sdxPaintModeCenter, 'Center');
  cxSetResourceString(@sdxPaintModeStretch, 'Stretch');
  cxSetResourceString(@sdxPaintModeTile, 'Tile');
  cxSetResourceString(@sdxPaintModeProportional, 'Proportional');

  // Pattern names

  cxSetResourceString(@sdxPatternGray5, '5%');
  cxSetResourceString(@sdxPatternGray10, '10%');
  cxSetResourceString(@sdxPatternGray20, '20%');
  cxSetResourceString(@sdxPatternGray25, '25%');
  cxSetResourceString(@sdxPatternGray30, '30%');
  cxSetResourceString(@sdxPatternGray40, '40%');
  cxSetResourceString(@sdxPatternGray50, '50%');
  cxSetResourceString(@sdxPatternGray60, '60%');
  cxSetResourceString(@sdxPatternGray70, '70%');
  cxSetResourceString(@sdxPatternGray75, '75%');
  cxSetResourceString(@sdxPatternGray80, '80%');
  cxSetResourceString(@sdxPatternGray90, '90%');
  cxSetResourceString(@sdxPatternLightDownwardDiagonal, 'Light downward diagonal');
  cxSetResourceString(@sdxPatternLightUpwardDiagonal, 'Light upward diagonal');
  cxSetResourceString(@sdxPatternDarkDownwardDiagonal, 'Dark downward diagonal');
  cxSetResourceString(@sdxPatternDarkUpwardDiagonal, 'Dark upward diagonal');
  cxSetResourceString(@sdxPatternWideDownwardDiagonal, 'Wide downward diagonal');
  cxSetResourceString(@sdxPatternWideUpwardDiagonal, 'Wide upward diagonal');
  cxSetResourceString(@sdxPatternLightVertical, 'Light vertical');
  cxSetResourceString(@sdxPatternLightHorizontal, 'Light horizontal');
  cxSetResourceString(@sdxPatternNarrowVertical, 'Narrow vertical');
  cxSetResourceString(@sdxPatternNarrowHorizontal, 'Narrow horizontal');
  cxSetResourceString(@sdxPatternDarkVertical, 'Dark vertical');
  cxSetResourceString(@sdxPatternDarkHorizontal, 'Dark horizontal');
  cxSetResourceString(@sdxPatternDashedDownward, 'Dashed downward');
  cxSetResourceString(@sdxPatternDashedUpward, 'Dashed upward');
  cxSetResourceString(@sdxPatternDashedVertical, 'Dashed vertical');
  cxSetResourceString(@sdxPatternDashedHorizontal, 'Dashed horizontal');
  cxSetResourceString(@sdxPatternSmallConfetti, 'Small confetti');
  cxSetResourceString(@sdxPatternLargeConfetti, 'Large confetti');
  cxSetResourceString(@sdxPatternZigZag, 'Zig zag');
  cxSetResourceString(@sdxPatternWave, 'Wave');
  cxSetResourceString(@sdxPatternDiagonalBrick, 'Diagonal brick');
  cxSetResourceString(@sdxPatternHorizantalBrick, 'Horizontal brick');
  cxSetResourceString(@sdxPatternWeave, 'Weave');
  cxSetResourceString(@sdxPatternPlaid, 'Plaid');
  cxSetResourceString(@sdxPatternDivot, 'Divot');
  cxSetResourceString(@sdxPatternDottedGrid, 'Dottedgrid');
  cxSetResourceString(@sdxPatternDottedDiamond, 'Dotted diamond');
  cxSetResourceString(@sdxPatternShingle, 'Shingle');
  cxSetResourceString(@sdxPatternTrellis, 'Trellis');
  cxSetResourceString(@sdxPatternSphere, 'Sphere');
  cxSetResourceString(@sdxPatternSmallGrid, 'Small grid');
  cxSetResourceString(@sdxPatternLargeGrid, 'Large grid');
  cxSetResourceString(@sdxPatternSmallCheckedBoard, 'Small checked board');
  cxSetResourceString(@sdxPatternLargeCheckedBoard, 'Large checked board');
  cxSetResourceString(@sdxPatternOutlinedDiamond, 'Outlined diamond');
  cxSetResourceString(@sdxPatternSolidDiamond, 'Solid diamond');

  // Texture names

  cxSetResourceString(@sdxTextureNewSprint, 'Newsprint');
  cxSetResourceString(@sdxTextureGreenMarble, 'Green marble');
  cxSetResourceString(@sdxTextureBlueTissuePaper, 'Blue tissue paper');
  cxSetResourceString(@sdxTexturePapyrus, 'Papyrus');
  cxSetResourceString(@sdxTextureWaterDroplets, 'Water droplets');
  cxSetResourceString(@sdxTextureCork, 'Cork');
  cxSetResourceString(@sdxTextureRecycledPaper, 'Recycled paper');
  cxSetResourceString(@sdxTextureWhiteMarble, 'White marble');
  cxSetResourceString(@sdxTexturePinkMarble, 'Pink marble');
  cxSetResourceString(@sdxTextureCanvas, 'Canvas');
  cxSetResourceString(@sdxTexturePaperBag, 'Paper bag');
  cxSetResourceString(@sdxTextureWalnut, 'Walnut');
  cxSetResourceString(@sdxTextureParchment, 'Parchment');
  cxSetResourceString(@sdxTextureBrownMarble, 'Brown marble');
  cxSetResourceString(@sdxTexturePurpleMesh, 'Purple mesh');
  cxSetResourceString(@sdxTextureDenim, 'Denim');
  cxSetResourceString(@sdxTextureFishFossil, 'Fish fossil');
  cxSetResourceString(@sdxTextureOak, 'Oak');
  cxSetResourceString(@sdxTextureStationary, 'Stationary');
  cxSetResourceString(@sdxTextureGranite, 'Granite');
  cxSetResourceString(@sdxTextureBouquet, 'Bouquet');
  cxSetResourceString(@sdxTextureWonenMat, 'Woven mat');
  cxSetResourceString(@sdxTextureSand, 'Sand');
  cxSetResourceString(@sdxTextureMediumWood, 'Medium wood');

  cxSetResourceString(@sdxFSPCaption, 'Picture Preview');
  cxSetResourceString(@sdxWidth, 'Width');
  cxSetResourceString(@sdxHeight, 'Height');

  // Brush Dialog

  cxSetResourceString(@sdxBrushDlgCaption, 'Brush properties');
  cxSetResourceString(@sdxStyle , '&Style:');

  // Enter New File Name dialog

  cxSetResourceString(@sdxENFNCaption, 'Choose New File Name');
  cxSetResourceString(@sdxEnterNewFileName, 'Enter New File Name');

  // Define styles dialog

  cxSetResourceString(@sdxDefinePrintStylesCaption, 'Define Print Styles');
  cxSetResourceString(@sdxDefinePrintStylesTitle, 'Print &Styles:');
  cxSetResourceString(@sdxDefinePrintStylesWarningDelete, 'Do you want to delete "%s" ?');
  cxSetResourceString(@sdxDefinePrintStylesWarningClear, 'Do you want to delete all not built-in styles ?');
  cxSetResourceString(@sdxClear, 'C&lear...');

  // Print device

  cxSetResourceString(@sdxCustomSize, 'Custom Size');
  cxSetResourceString(@sdxDefaultTray, 'Default Tray');
  cxSetResourceString(@sdxInvalidPrintDevice, 'Printer selected is not valid');
  cxSetResourceString(@sdxNotPrinting, 'Printer is not currently printing');
  cxSetResourceString(@sdxPrinting, 'Printing in progress');
  cxSetResourceString(@sdxDeviceOnPort , '%s on %s');
  cxSetResourceString(@sdxPrinterIndexError, 'Printer index out of range');
  cxSetResourceString(@sdxNoDefaultPrintDevice, 'There is no default printer selected');

  // Edit AutoText Entries Dialog

  cxSetResourceString(@sdxAutoTextDialogCaption, 'Edit AutoText Entries');
  cxSetResourceString(@sdxEnterAutoTextEntriesHere ,  'Enter A&utoText Entries Here: ');

  // Print dialog

  cxSetResourceString(@sdxPrintDialogCaption, 'Print');
  cxSetResourceString(@sdxPrintDialogPrinter ,  'Printer');
  cxSetResourceString(@sdxPrintDialogName , '&Name:');
  cxSetResourceString(@sdxPrintDialogStatus, 'Status:');
  cxSetResourceString(@sdxPrintDialogType, 'Type:');
  cxSetResourceString(@sdxPrintDialogWhere, 'Where:');
  cxSetResourceString(@sdxPrintDialogComment, 'Comment:');
  cxSetResourceString(@sdxPrintDialogPrintToFile, 'Print to &File');
  cxSetResourceString(@sdxPrintDialogPageRange ,  'Page range ');
  cxSetResourceString(@sdxPrintDialogAll , '&All');
  cxSetResourceString(@sdxPrintDialogCurrentPage, 'Curr&ent Page');
  cxSetResourceString(@sdxPrintDialogSelection , '&Selection');
  cxSetResourceString(@sdxPrintDialogPages , '&Pages:');
  cxSetResourceString(@sdxPrintDialogRangeLegend,
    'Enter page number and/or page ranges' + #13#10 +
    'separated by commas. For example: 1,3,5-12.');
  cxSetResourceString(@sdxPrintDialogCopies ,  'Copies ');
  cxSetResourceString(@sdxPrintDialogNumberOfPages, 'N&umber of Pages:');
  cxSetResourceString(@sdxPrintDialogNumberOfCopies, 'Number of &Copies:');
  cxSetResourceString(@sdxPrintDialogCollateCopies, 'Colla&te Copies');
  cxSetResourceString(@sdxPrintDialogAllPages, 'All');
  cxSetResourceString(@sdxPrintDialogEvenPages, 'Even');
  cxSetResourceString(@sdxPrintDialogOddPages, 'Odd');
  cxSetResourceString(@sdxPrintDialogPrintStyles ,  'Print St&yles ');

  // PrintToFile Dialog

  cxSetResourceString(@sdxPrintDialogOpenDlgTitle, 'Choose File Name');
  cxSetResourceString(@sdxPrintDialogOpenDlgAllFiles, 'All Files');
  cxSetResourceString(@sdxPrintDialogOpenDlgPrinterFiles, 'Printer Files');
  cxSetResourceString(@sdxPrintDialogPageNumbersOutOfRange, 'Page numbers out of range (%d - %d)');
  cxSetResourceString(@sdxPrintDialogInvalidPageRanges, 'Invalid page ranges');
  cxSetResourceString(@sdxPrintDialogRequiredPageNumbers, 'Enter page numbers');
  cxSetResourceString(@sdxPrintDialogNoPrinters,
    'No printers are installed. To install a printer, ' +
    'point to Settings on the Windows Start menu, click Printers, and then double-click Add Printer. ' +
    'Follow the instructions in the wizard.');
  cxSetResourceString(@sdxPrintDialogInPrintingState, 'Printer is currently printing.' + #13#10 + 'Please wait.');

  // Printer State

  cxSetResourceString(@sdxPrintDialogPSPaused, 'Paused');
  cxSetResourceString(@sdxPrintDialogPSPendingDeletion, 'Pending Deletion');
  cxSetResourceString(@sdxPrintDialogPSBusy, 'Busy');
  cxSetResourceString(@sdxPrintDialogPSDoorOpen, 'Door Open');
  cxSetResourceString(@sdxPrintDialogPSError, 'Error');
  cxSetResourceString(@sdxPrintDialogPSInitializing, 'Initializing');
  cxSetResourceString(@sdxPrintDialogPSIOActive, 'IO Active');
  cxSetResourceString(@sdxPrintDialogPSManualFeed, 'Manual Feed');
  cxSetResourceString(@sdxPrintDialogPSNoToner, 'No Toner');
  cxSetResourceString(@sdxPrintDialogPSNotAvailable, 'Not Available');
  cxSetResourceString(@sdxPrintDialogPSOFFLine, 'Offline');
  cxSetResourceString(@sdxPrintDialogPSOutOfMemory, 'Out of Memory');
  cxSetResourceString(@sdxPrintDialogPSOutBinFull, 'Output Bin Full');
  cxSetResourceString(@sdxPrintDialogPSPagePunt, 'Page Punt');
  cxSetResourceString(@sdxPrintDialogPSPaperJam, 'Paper Jam');
  cxSetResourceString(@sdxPrintDialogPSPaperOut, 'Paper Out');
  cxSetResourceString(@sdxPrintDialogPSPaperProblem, 'Paper Problem');
  cxSetResourceString(@sdxPrintDialogPSPrinting, 'Printing');
  cxSetResourceString(@sdxPrintDialogPSProcessing, 'Processing');
  cxSetResourceString(@sdxPrintDialogPSTonerLow, 'Toner Low');
  cxSetResourceString(@sdxPrintDialogPSUserIntervention, 'User Intervention');
  cxSetResourceString(@sdxPrintDialogPSWaiting, 'Waiting');
  cxSetResourceString(@sdxPrintDialogPSWarningUp, 'Warming Up');
  cxSetResourceString(@sdxPrintDialogPSReady, 'Ready');
  cxSetResourceString(@sdxPrintDialogPSPrintingAndWaiting, 'Printing: %d document(s) waiting');

  cxSetResourceString(@sdxLeftMargin, 'Left Margin');
  cxSetResourceString(@sdxTopMargin, 'Top Margin');
  cxSetResourceString(@sdxRightMargin, 'Right Margin');
  cxSetResourceString(@sdxBottomMargin, 'Bottom Margin');
  cxSetResourceString(@sdxGutterMargin, 'Gutter');
  cxSetResourceString(@sdxHeaderMargin, 'Header');
  cxSetResourceString(@sdxFooterMargin, 'Footer');

  cxSetResourceString(@sdxUnitsInches, 'in');
  cxSetResourceString(@sdxUnitsCentimeters, 'cm');
  cxSetResourceString(@sdxUnitsMillimeters, 'mm');
  cxSetResourceString(@sdxUnitsPoints, 'pt');
  cxSetResourceString(@sdxUnitsPicas, 'pi');

  cxSetResourceString(@sdxUnitsDefaultName, 'Default');
  cxSetResourceString(@sdxUnitsInchesName, 'Inches');
  cxSetResourceString(@sdxUnitsCentimetersName, 'Centimeters');
  cxSetResourceString(@sdxUnitsMillimetersName, 'Millimeters');
  cxSetResourceString(@sdxUnitsPointsName, 'Points');
  cxSetResourceString(@sdxUnitsPicasName, 'Picas');

  cxSetResourceString(@sdxPrintPreview, 'Print Preview');
  cxSetResourceString(@sdxReportDesignerCaption, 'Format Report');
  cxSetResourceString(@sdxCompositionDesignerCaption, 'Composition Editor');

  cxSetResourceString(@sdxComponentNotSupportedByLink, 'Component "%s" not supported by TdxComponentPrinter');
  cxSetResourceString(@sdxComponentNotSupported, 'Component "%s" not supported by TdxComponentPrinter');
  cxSetResourceString(@sdxPrintDeviceNotReady, 'Printer has not been installed or is not ready');
  cxSetResourceString(@sdxUnableToGenerateReport, 'Unable to generate report');
  cxSetResourceString(@sdxPreviewNotRegistered, 'There is no registered preview form');
  cxSetResourceString(@sdxComponentNotAssigned , '%s' + #13#10 + 'Not assigned "Component" property');
  cxSetResourceString(@sdxPrintDeviceIsBusy, 'Printer is busy');
  cxSetResourceString(@sdxPrintDeviceError, 'Printer has encountered error !');
  cxSetResourceString(@sdxMissingComponent, 'Missing "Component" property');
  cxSetResourceString(@sdxDataProviderDontPresent, 'There are no Links with Assigned Component in Composition');
  cxSetResourceString(@sdxBuildingReport, 'Building report: Completed %d%%');                            // obsolete
  cxSetResourceString(@sdxPrintingReport, 'Printing report: Completed %d page(s). Press Esc to cancel'); // obsolete
  cxSetResourceString(@sdxDefinePrintStylesMenuItem, 'Define Print &Styles...');
  cxSetResourceString(@sdxAbortPrinting, 'Abort printing ?');
  cxSetResourceString(@sdxStandardStyle, 'Standard Style');

  cxSetResourceString(@sdxFontStyleBold, 'Bold');
  cxSetResourceString(@sdxFontStyleItalic, 'Italic');
  cxSetResourceString(@sdxFontStyleUnderline, 'Underline');
  cxSetResourceString(@sdxFontStyleStrikeOut, 'StrikeOut');
  cxSetResourceString(@sdxPt, 'pt.');

  cxSetResourceString(@sdxNoPages, 'There are no pages to display');
  cxSetResourceString(@sdxPageWidth, 'Page Width');
  cxSetResourceString(@sdxWholePage, 'Whole Page');
  cxSetResourceString(@sdxTwoPages, 'Two Pages');
  cxSetResourceString(@sdxFourPages, 'Four Pages');
  cxSetResourceString(@sdxWidenToSourceWidth, 'Widen to Source Width');

  cxSetResourceString(@sdxMenuBar, 'MenuBar');
  cxSetResourceString(@sdxStandardBar, 'Standard');
  cxSetResourceString(@sdxHeaderFooterBar, 'Header and Footer');
  cxSetResourceString(@sdxShortcutMenusBar, 'Shortcut Menus');
  cxSetResourceString(@sdxAutoTextBar, 'AutoText');

  cxSetResourceString(@sdxMenuFile , '&File');
  cxSetResourceString(@sdxMenuFileDesign , '&Design...');
  cxSetResourceString(@sdxMenuFilePrint , '&Print...');
  cxSetResourceString(@sdxMenuFilePrintDialog, 'Print Dialog');
  cxSetResourceString(@sdxMenuFilePageSetup, 'Page Set&up...');
  cxSetResourceString(@sdxMenuPrintStyles, 'Print Styles');
  cxSetResourceString(@sdxMenuFileExit , '&Close');
  cxSetResourceString(@sdxMenuExportToPDF, 'Export To PDF');

  cxSetResourceString(@sdxMenuEdit , '&Edit');
  cxSetResourceString(@sdxMenuEditCut, 'Cu&t');
  cxSetResourceString(@sdxMenuEditCopy , '&Copy');
  cxSetResourceString(@sdxMenuEditPaste , '&Paste');
  cxSetResourceString(@sdxMenuEditDelete , '&Delete');
  cxSetResourceString(@sdxMenuEditFind , '&Find...');
  cxSetResourceString(@sdxMenuEditFindNext, 'Find Ne&xt');
  cxSetResourceString(@sdxMenuEditReplace , '&Replace...');

  cxSetResourceString(@sdxMenuLoad , '&Load...');
  cxSetResourceString(@sdxMenuPreview, 'Pre&view...');

  cxSetResourceString(@sdxMenuInsert , '&Insert');
  cxSetResourceString(@sdxMenuInsertAutoText , '&AutoText');
  cxSetResourceString(@sdxMenuInsertEditAutoTextEntries, 'AutoTe&xt...');
  cxSetResourceString(@sdxMenuInsertAutoTextEntries, 'List of AutoText Entries');
  cxSetResourceString(@sdxMenuInsertAutoTextEntriesSubItem, 'In&sert AutoText');
  cxSetResourceString(@sdxMenuInsertPageNumber , '&Page Number');
  cxSetResourceString(@sdxMenuInsertTotalPages , '&Number of Pages');
  cxSetResourceString(@sdxMenuInsertPageOfPages, 'Pa&ge Number of Pages');
  cxSetResourceString(@sdxMenuInsertDateTime, 'Date and Time');
  cxSetResourceString(@sdxMenuInsertDate , '&Date');
  cxSetResourceString(@sdxMenuInsertTime , '&Time');
  cxSetResourceString(@sdxMenuInsertUserName , '&User Name');
  cxSetResourceString(@sdxMenuInsertMachineName , '&Machine Name');

  cxSetResourceString(@sdxMenuView , '&View');
  cxSetResourceString(@sdxMenuViewMargins , '&Margins');
  cxSetResourceString(@sdxMenuViewFlatToolBarButtons , '&Flat ToolBar Buttons');
  cxSetResourceString(@sdxMenuViewLargeToolBarButtons , '&Large ToolBar Buttons');
  cxSetResourceString(@sdxMenuViewMarginsStatusBar, 'M&argins Bar');
  cxSetResourceString(@sdxMenuViewPagesStatusBar , '&Status Bar');
  cxSetResourceString(@sdxMenuViewToolBars , '&Toolbars');
  cxSetResourceString(@sdxMenuViewPagesHeaders, 'Page &Headers');
  cxSetResourceString(@sdxMenuViewPagesFooters, 'Page Foote&rs');
  cxSetResourceString(@sdxMenuViewSwitchToLeftPart, 'Switch to Left Part');
  cxSetResourceString(@sdxMenuViewSwitchToRightPart, 'Switch to Right Part');
  cxSetResourceString(@sdxMenuViewSwitchToCenterPart, 'Switch to Center Part');
  cxSetResourceString(@sdxMenuViewHFSwitchHeaderFooter , '&Show Header/Footer');
  cxSetResourceString(@sdxMenuViewSwitchToFooter, 'Footer');
  cxSetResourceString(@sdxMenuViewSwitchToHeader, 'Header');
  cxSetResourceString(@sdxMenuViewHFClose , '&Close');

  cxSetResourceString(@sdxMenuZoom , '&Zoom');
  cxSetResourceString(@sdxMenuZoomPercent100, 'Percent &100');
  cxSetResourceString(@sdxMenuZoomPageWidth, 'Page &Width');
  cxSetResourceString(@sdxMenuZoomWholePage, 'W&hole Page');
  cxSetResourceString(@sdxMenuZoomTwoPages , '&Two Pages');
  cxSetResourceString(@sdxMenuZoomFourPages , '&Four Pages');
  cxSetResourceString(@sdxMenuZoomMultiplyPages , '&Multiple Pages');
  cxSetResourceString(@sdxMenuZoomWidenToSourceWidth, 'Widen To S&ource Width');
  cxSetResourceString(@sdxMenuZoomSetup , '&Setup...');

  cxSetResourceString(@sdxMenuPages , '&Pages');

  cxSetResourceString(@sdxMenuGotoPage , '&Go');
  cxSetResourceString(@sdxMenuGotoPageFirst , '&First Page');
  cxSetResourceString(@sdxMenuGotoPagePrev , '&Previous Page');
  cxSetResourceString(@sdxMenuGotoPageNext , '&Next Page');
  cxSetResourceString(@sdxMenuGotoPageLast , '&Last Page');
  cxSetResourceString(@sdxMenuActivePage , '&Active Page:');

  cxSetResourceString(@sdxMenuFormat, 'F&ormat');
  cxSetResourceString(@sdxMenuFormatHeaderAndFooter , '&Header and Footer');
  cxSetResourceString(@sdxMenuFormatAutoTextEntries , '&Auto Text Entries...');
  cxSetResourceString(@sdxMenuFormatDateTime, 'Date And &Time...');
  cxSetResourceString(@sdxMenuFormatPageNumbering, 'Page &Numbering...');
  cxSetResourceString(@sdxMenuFormatPageBackground, 'Bac&kground...');
  cxSetResourceString(@sdxMenuFormatShrinkToPage , '&Fit to Page');
  //cxSetResourceString(@sdxMenuShowEmptyPages, 'Show &Empty Pages');
  cxSetResourceString(@sdxMenuFormatHFBackground, 'Header/Footer Background...');
  cxSetResourceString(@sdxMenuFormatHFClear, 'Clear Text');

  cxSetResourceString(@sdxMenuTools , '&Tools');
  cxSetResourceString(@sdxMenuToolsCustomize , '&Customize...');
  cxSetResourceString(@sdxMenuToolsOptions , '&Options...');

  cxSetResourceString(@sdxMenuHelp , '&Help');
  cxSetResourceString(@sdxMenuHelpTopics, 'Help &Topics...');
  cxSetResourceString(@sdxMenuHelpAbout , '&About...');

  cxSetResourceString(@sdxMenuShortcutPreview, 'Preview');
  cxSetResourceString(@sdxMenuShortcutAutoText, 'AutoText');

  cxSetResourceString(@sdxMenuBuiltInMenus, 'Built-in Menus');
  cxSetResourceString(@sdxMenuShortCutMenus, 'Shortcut Menus');
  cxSetResourceString(@sdxMenuNewMenu, 'New Menu');

  // Hints

  cxSetResourceString(@sdxHintFileDesign, 'Design Report');
  cxSetResourceString(@sdxHintFilePrint, 'Print');
  cxSetResourceString(@sdxHintFilePrintDialog, 'Print Dialog');
  cxSetResourceString(@sdxHintFilePageSetup, 'Page Setup');
  cxSetResourceString(@sdxHintFileExit, 'Close Preview');
  cxSetResourceString(@sdxHintExportToPDF, 'Export To PDF');

  cxSetResourceString(@sdxHintEditFind, 'Find');
  cxSetResourceString(@sdxHintEditFindNext, 'Find Next');
  cxSetResourceString(@sdxHintEditReplace, 'Replace');

  cxSetResourceString(@sdxHintInsertEditAutoTextEntries, 'Edit AutoText Entries');
  cxSetResourceString(@sdxHintInsertPageNumber, 'Insert Page Number');
  cxSetResourceString(@sdxHintInsertTotalPages, 'Insert Number of Pages');
  cxSetResourceString(@sdxHintInsertPageOfPages, 'Insert Page Number of Pages');
  cxSetResourceString(@sdxHintInsertDateTime, 'Insert Date and Time');
  cxSetResourceString(@sdxHintInsertDate, 'Insert Date');
  cxSetResourceString(@sdxHintInsertTime, 'Insert Time');
  cxSetResourceString(@sdxHintInsertUserName, 'Insert User Name');
  cxSetResourceString(@sdxHintInsertMachineName, 'Insert Machine Name');

  cxSetResourceString(@sdxHintViewMargins, 'View Margins');
  cxSetResourceString(@sdxHintViewLargeButtons, 'View Large Buttons');
  cxSetResourceString(@sdxHintViewMarginsStatusBar, 'View Margins Status Bar');
  cxSetResourceString(@sdxHintViewPagesStatusBar, 'View Page Status Bar');
  cxSetResourceString(@sdxHintViewPagesHeaders, 'View Page Header');
  cxSetResourceString(@sdxHintViewPagesFooters, 'View Page Footer');
  cxSetResourceString(@sdxHintViewSwitchToLeftPart, 'Switch to Left Header/Footer Part');
  cxSetResourceString(@sdxHintViewSwitchToRightPart, 'Switch to Right Header/Footer Part');
  cxSetResourceString(@sdxHintViewSwitchToCenterPart, 'Switch to Center Header/Footer Part');
  cxSetResourceString(@sdxHintViewHFSwitchHeaderFooter, 'Switch Between Header and Footer');
  cxSetResourceString(@sdxHintViewSwitchToFooter, 'Switch to Footer');
  cxSetResourceString(@sdxHintViewSwitchToHeader, 'Switch to Header');
  cxSetResourceString(@sdxHintViewHFClose, 'Close');

  cxSetResourceString(@sdxHintViewZoom, 'Zoom');
  cxSetResourceString(@sdxHintZoomPercent100, 'Zoom 100%');
  cxSetResourceString(@sdxHintZoomPageWidth, 'Zoom Page Width');
  cxSetResourceString(@sdxHintZoomWholePage, 'Whole Page');
  cxSetResourceString(@sdxHintZoomTwoPages, 'Two Pages');
  cxSetResourceString(@sdxHintZoomFourPages, 'Four Pages');
  cxSetResourceString(@sdxHintZoomMultiplyPages, 'Multiple Pages');
  cxSetResourceString(@sdxHintZoomWidenToSourceWidth, 'Widen To Source Width');
  cxSetResourceString(@sdxHintZoomSetup, 'Setup Zoom Factor');

  cxSetResourceString(@sdxHintFormatDateTime, 'Format Date and Time');
  cxSetResourceString(@sdxHintFormatPageNumbering, 'Format Page Number');
  cxSetResourceString(@sdxHintFormatPageBackground, 'Background');
  cxSetResourceString(@sdxHintFormatShrinkToPage, 'Fit To Page');
  cxSetResourceString(@sdxHintFormatHFBackground, 'Header/Footer Background');
  cxSetResourceString(@sdxHintFormatHFClear, 'Clear Header/Footer Text');

  cxSetResourceString(@sdxHintGotoPageFirst, 'First Page');
  cxSetResourceString(@sdxHintGotoPagePrev, 'Previous Page');
  cxSetResourceString(@sdxHintGotoPageNext, 'Next Page');
  cxSetResourceString(@sdxHintGotoPageLast, 'Last Page');
  cxSetResourceString(@sdxHintActivePage, 'Active Page');

  cxSetResourceString(@sdxHintToolsCustomize, 'Customize Toolbars');
  cxSetResourceString(@sdxHintToolsOptions, 'Options');

  cxSetResourceString(@sdxHintHelpTopics, 'Help Topics');
  cxSetResourceString(@sdxHintHelpAbout, 'About');

  cxSetResourceString(@sdxPopupMenuLargeButtons , '&Large Buttons');
  cxSetResourceString(@sdxPopupMenuFlatButtons , '&Flat Buttons');

  cxSetResourceString(@sdxPaperSize, 'Paper Size:');
  cxSetResourceString(@sdxStatus, 'Status:');
  cxSetResourceString(@sdxStatusReady, 'Ready');
  cxSetResourceString(@sdxStatusPrinting, 'Printing. Completed %d page(s)');
  cxSetResourceString(@sdxStatusGenerateReport, 'Generating Report. Completed %d%%');

  cxSetResourceString(@sdxHintDoubleClickForChangePaperSize, 'Double Click for Change Paper Size');
  cxSetResourceString(@sdxHintDoubleClickForChangeMargins, 'Double Click for Change Margins');

  // Date&Time Formats Dialog

  cxSetResourceString(@sdxDTFormatsCaption, 'Date and Time');
  cxSetResourceString(@sdxDTFormatsAvailableDateFormats , '&Available Date Formats:');
  cxSetResourceString(@sdxDTFormatsAvailableTimeFormats, 'Available &Time Formats:');
  cxSetResourceString(@sdxDTFormatsAutoUpdate , '&Update Automatically');
  //cxSetResourceString(@sdxDTFormatsChangeDefaultForm,  'Do you want to change the default date and time formats to match "%s"  - "%s" ?');

  // PageNumber Formats Dialog

  cxSetResourceString(@sdxPNFormatsCaption, 'Page Number Format');
  cxSetResourceString(@sdxPageNumbering, 'Page Numbering');
  cxSetResourceString(@sdxPNFormatsNumberFormat, 'Number &Format:');
  cxSetResourceString(@sdxPNFormatsContinueFromPrevious , '&Continue from Previous Section');
  cxSetResourceString(@sdxPNFormatsStartAt, 'Start &At:');
  //cxSetResourceString(@sdxPNFormatsChangeDefaultForm,'Do you want to change the default Page numbering format to match "%s" ?');

  // Zoom Dialog

  cxSetResourceString(@sdxZoomDlgCaption, 'Zoom');
  cxSetResourceString(@sdxZoomDlgZoomTo ,  'Zoom To ');
  cxSetResourceString(@sdxZoomDlgPageWidth, 'Page &Width');
  cxSetResourceString(@sdxZoomDlgWholePage, 'W&hole Page');
  cxSetResourceString(@sdxZoomDlgTwoPages , '&Two Pages');
  cxSetResourceString(@sdxZoomDlgFourPages , '&Four Pages');
  cxSetResourceString(@sdxZoomDlgManyPages , '&Many Pages:');
  cxSetResourceString(@sdxZoomDlgPercent, 'P&ercent:');
  cxSetResourceString(@sdxZoomDlgPreview ,  'Preview ');
  cxSetResourceString(@sdxZoomDlgFontPreview, ' 12pt Times New Roman ');
  cxSetResourceString(@sdxZoomDlgFontPreviewString, 'AaBbCcDdEeXxYyZz');

  // Select page X x Y

  cxSetResourceString(@sdxPages, 'Pages');
  cxSetResourceString(@sdxCancel, 'Cancel');

  // Preferences dialog

  cxSetResourceString(@sdxPreferenceDlgCaption, 'Options');
  cxSetResourceString(@sdxPreferenceDlgTab1 , '&General');
  //cxSetResourceString(@sdxPreferenceDlgTab2 =, );
//  cxSetResourceString(@sdxPreferenceDlgTab3 =, );
//  cxSetResourceString(@sdxPreferenceDlgTab4 =, );
//  cxSetResourceString(@sdxPreferenceDlgTab5 =, );
//  cxSetResourceString(@sdxPreferenceDlgTab6 =, );
//  cxSetResourceString(@sdxPreferenceDlgTab7 =, );
//  cxSetResourceString(@sdxPreferenceDlgTab8 =, );
//  cxSetResourceString(@sdxPreferenceDlgTab9 =, );
//  cxSetResourceString(@sdxPreferenceDlgTab10 =, );
  cxSetResourceString(@sdxPreferenceDlgShow, '&Show ');
  cxSetResourceString(@sdxPreferenceDlgMargins , '&Margins ');
  cxSetResourceString(@sdxPreferenceDlgMarginsHints, 'Margins &Hints');
  cxSetResourceString(@sdxPreferenceDlgMargingWhileDragging, 'Margins Hints While &Dragging');
  cxSetResourceString(@sdxPreferenceDlgLargeBtns , '&Large Toolbar Buttons');
  cxSetResourceString(@sdxPreferenceDlgFlatBtns , '&Flat Toolbar Buttons');
  cxSetResourceString(@sdxPreferenceDlgMarginsColor, 'Margins &Color:');
  cxSetResourceString(@sdxPreferenceDlgMeasurementUnits, 'Measurement &Units:');
  cxSetResourceString(@sdxPreferenceDlgSaveForRunTimeToo, 'Save for &RunTime too');
  cxSetResourceString(@sdxPreferenceDlgZoomScroll , '&Zoom on roll with IntelliMouse');
  cxSetResourceString(@sdxPreferenceDlgZoomStep, 'Zoom Ste&p:');

  // Page Setup

  cxSetResourceString(@sdxCloneStyleCaptionPrefix, 'Copy (%d) of ');
  cxSetResourceString(@sdxInvalideStyleCaption, 'The style name "%s" already exists. Please supply another name.');

  cxSetResourceString(@sdxPageSetupCaption, 'Page Setup');
  cxSetResourceString(@sdxStyleName, 'Style &Name:');

  cxSetResourceString(@sdxPage , '&Page');
  cxSetResourceString(@sdxMargins , '&Margins');
  cxSetResourceString(@sdxHeaderFooter , '&Header / Footer');
  cxSetResourceString(@sdxScaling , '&Scaling');

  cxSetResourceString(@sdxPaper ,  'Paper ');
  cxSetResourceString(@sdxPaperType, 'T&ype');
  cxSetResourceString(@sdxPaperDimension, 'Dimension');
  cxSetResourceString(@sdxPaperWidth , '&Width:');
  cxSetResourceString(@sdxPaperHeight, 'H&eight:');
  cxSetResourceString(@sdxPaperSource, 'Paper so&urce:');

  cxSetResourceString(@sdxOrientation ,  'Orientation ');
  cxSetResourceString(@sdxPortrait, 'P&ortrait');
  cxSetResourceString(@sdxLandscape , '&Landscape');
  cxSetResourceString(@sdxPrintOrder ,  'Print Order ');
  cxSetResourceString(@sdxDownThenOver , '&Down, then over');
  cxSetResourceString(@sdxOverThenDown, 'O&ver, then down');
  cxSetResourceString(@sdxShading ,  'Shading');
  cxSetResourceString(@sdxPrintUsingGrayShading, 'Print using &gray shading');

  cxSetResourceString(@sdxCenterOnPage, 'Center on page');
  cxSetResourceString(@sdxHorizontally, 'Hori&zontally');
  cxSetResourceString(@sdxVertically , '&Vertically');

  cxSetResourceString(@sdxHeader, 'Header ');
  cxSetResourceString(@sdxBtnHeaderFont , '&Font...');
  cxSetResourceString(@sdxBtnHeaderBackground , '&Background');
  cxSetResourceString(@sdxFooter, 'Footer ');
  cxSetResourceString(@sdxBtnFooterFont, 'Fo&nt...');
  cxSetResourceString(@sdxBtnFooterBackground, 'Back&ground');

  cxSetResourceString(@sdxTop , '&Top:');
  cxSetResourceString(@sdxLeft , '&Left:');
  cxSetResourceString(@sdxRight, 'Ri&ght:');
  cxSetResourceString(@sdxBottom , '&Bottom:');
  cxSetResourceString(@sdxHeader2, 'H&eader:');
  cxSetResourceString(@sdxFooter2, 'Foote&r:');

  cxSetResourceString(@sdxAlignment, 'Alignment');
  cxSetResourceString(@sdxVertAlignment ,  'Vertical Alignment ');
  cxSetResourceString(@sdxReverseOnEvenPages , '&Reverse on even pages');

  cxSetResourceString(@sdxAdjustTo , '&Adjust To:');
  cxSetResourceString(@sdxFitTo , '&Fit To:');
  cxSetResourceString(@sdxPercentOfNormalSize,  'normal size');
  cxSetResourceString(@sdxPagesWideBy, 'page(s) &wide by');
  cxSetResourceString(@sdxTall , '&tall');

  cxSetResourceString(@sdxOf, 'Of');
  cxSetResourceString(@sdxLastPrinted, 'Last Printed ');
  cxSetResourceString(@sdxFileName, 'Filename ');
  cxSetResourceString(@sdxFileNameAndPath, 'Filename and path ');
  cxSetResourceString(@sdxPrintedBy, 'Printed By ');
  cxSetResourceString(@sdxPrintedOn, 'Printed On ');
  cxSetResourceString(@sdxCreatedBy, 'Created By ');
  cxSetResourceString(@sdxCreatedOn, 'Created On ');
  cxSetResourceString(@sdxConfidential, 'Confidential');

  // HF function

  cxSetResourceString(@sdxHFFunctionNameDate, 'Date');
  cxSetResourceString(@sdxHFFunctionNameDateTime, 'Date and Time');
  cxSetResourceString(@sdxHFFunctionNameImage, 'Image');
  cxSetResourceString(@sdxHFFunctionNameMachineName, 'Machine Name');
  cxSetResourceString(@sdxHFFunctionNamePageNumber, 'Page Number');
  cxSetResourceString(@sdxHFFunctionNamePageOfPages, 'Page # of Pages #');
  cxSetResourceString(@sdxHFFunctionNameTime, 'Time');
  cxSetResourceString(@sdxHFFunctionNameTotalPages, 'Total Pages');
  cxSetResourceString(@sdxHFFunctionNameUnknown, 'Unknown');
  cxSetResourceString(@sdxHFFunctionNameUserName, 'User Name');

  cxSetResourceString(@sdxHFFunctionHintDate, 'Date Printed');
  cxSetResourceString(@sdxHFFunctionHintDateTime, 'Date and Time Printed');
  cxSetResourceString(@sdxHFFunctionHintImage, 'Image');
  cxSetResourceString(@sdxHFFunctionHintMachineName, 'Machine Name');
  cxSetResourceString(@sdxHFFunctionHintPageNumber, 'Page Number');
  cxSetResourceString(@sdxHFFunctionHintPageOfPages, 'Page # of Pages #');
  cxSetResourceString(@sdxHFFunctionHintTime, 'Time Printed');
  cxSetResourceString(@sdxHFFunctionHintTotalPages, 'Total Pages');
  cxSetResourceString(@sdxHFFunctionHintUserName, 'User Name');

  cxSetResourceString(@sdxHFFunctionTemplateDate, 'Date Printed');
  cxSetResourceString(@sdxHFFunctionTemplateDateTime, 'Date & Time Printed');
  cxSetResourceString(@sdxHFFunctionTemplateImage, 'Image');
  cxSetResourceString(@sdxHFFunctionTemplateMachineName, 'Machine Name');
  cxSetResourceString(@sdxHFFunctionTemplatePageNumber, 'Page #');
  cxSetResourceString(@sdxHFFunctionTemplatePageOfPages, 'Page # of Pages #');
  cxSetResourceString(@sdxHFFunctionTemplateTime, 'Time Printed');
  cxSetResourceString(@sdxHFFunctionTemplateTotalPages, 'Total Pages');
  cxSetResourceString(@sdxHFFunctionTemplateUserName, 'User Name');

  // PDF Export Dialog

  cxSetResourceString(@sdxPDFDialogAuthor, 'Author');
  cxSetResourceString(@sdxPDFDialogCaption, 'PDF Export Options');
  cxSetResourceString(@sdxPDFDialogCompressed, 'Compressed');
  cxSetResourceString(@sdxPDFDialogCreator, 'Creator');
  cxSetResourceString(@sdxPDFDialogDocumentInfoTabSheet , '&Document Info');
  cxSetResourceString(@sdxPDFDialogEmbedFonts, 'Embed Fonts');
  cxSetResourceString(@sdxPDFDialogExportSettings, 'Export Settings');
  cxSetResourceString(@sdxPDFDialogExportTabSheet , '&Export');
  cxSetResourceString(@sdxPDFDialogKeywords, 'Keywords');
  cxSetResourceString(@sdxPDFDialogMaxCompression, 'Max Compression');
  cxSetResourceString(@sdxPDFDialogMaxQuality, 'Max Quality');
  cxSetResourceString(@sdxPDFDialogOpenAfterExport, 'Open After Export');
  cxSetResourceString(@sdxPDFDialogPageRageTabSheet , '&Pages');
  cxSetResourceString(@sdxPDFDialogSecurityAllowChanging, 'Allow Changing the Document');
  cxSetResourceString(@sdxPDFDialogSecurityAllowComments, 'Allow Comments');
  cxSetResourceString(@sdxPDFDialogSecurityAllowCopy, 'Allow Content Copying and Extraction');
  cxSetResourceString(@sdxPDFDialogSecurityAllowDocumentAssemble, 'Allow Document Assembly');
  cxSetResourceString(@sdxPDFDialogSecurityAllowPrint, 'Allow Print');
  cxSetResourceString(@sdxPDFDialogSecurityAllowPrintHiResolution, 'Allow Printing with High Resolution');
  cxSetResourceString(@sdxPDFDialogSecurityEnabled, 'Enabled');
  cxSetResourceString(@sdxPDFDialogSecurityMethod, 'Method:');
  cxSetResourceString(@sdxPDFDialogSecurityOwnerPassword, 'Owner Password:');
  cxSetResourceString(@sdxPDFDialogSecuritySettings, 'Security Settings');
  cxSetResourceString(@sdxPDFDialogSecurityUserPassword, 'User Password:');
  cxSetResourceString(@sdxPDFDialogSubject, 'Subject');
  cxSetResourceString(@sdxPDFDialogTitle, 'Title');
  cxSetResourceString(@sdxPDFDialogUseCIDFonts, 'Use CID Fonts');
  cxSetResourceString(@sdxPDFDialogUseJPEGCompression, 'Use JPEG Compression for Images');
  cxSetResourceString(@sdxPDFDialogTabDocInfo , '&Document Information');
  cxSetResourceString(@sdxPDFDialogTabExport , '&Export');
  cxSetResourceString(@sdxPDFDialogTabPages , '&Pages');
  cxSetResourceString(@sdxPDFDialogTabSecurity , '&Security');

  // Designer strings

  // Months

  cxSetResourceString(@sdxJanuary, 'January');
  cxSetResourceString(@sdxFebruary, 'February');
  cxSetResourceString(@sdxMarch, 'March');
  cxSetResourceString(@sdxApril, 'April');
  cxSetResourceString(@sdxMay, 'May');
  cxSetResourceString(@sdxJune, 'June');
  cxSetResourceString(@sdxJuly, 'July');
  cxSetResourceString(@sdxAugust, 'August');
  cxSetResourceString(@sdxSeptember, 'September');
  cxSetResourceString(@sdxOctober, 'October');
  cxSetResourceString(@sdxNovember, 'November');
  cxSetResourceString(@sdxDecember, 'December');

  cxSetResourceString(@sdxEast, 'East');
  cxSetResourceString(@sdxWest, 'West');
  cxSetResourceString(@sdxSouth, 'South');
  cxSetResourceString(@sdxNorth, 'North');

  cxSetResourceString(@sdxTotal, 'Total');

  // dxFlowChart

  cxSetResourceString(@sdxPlan, 'Plan');
  cxSetResourceString(@sdxSwimmingPool, 'Swimming-pool');
  cxSetResourceString(@sdxAdministration, 'Administration');
  cxSetResourceString(@sdxPark, 'Park');
  cxSetResourceString(@sdxCarParking, 'Car-Parking');

  // dxOrgChart

  cxSetResourceString(@sdxCorporateHeadquarters, 'Corporate' + #13#10 + 'Headquarters');
  cxSetResourceString(@sdxSalesAndMarketing, 'Sales and' + #13#10 + 'Marketing');
  cxSetResourceString(@sdxEngineering, 'Engineering');
  cxSetResourceString(@sdxFieldOfficeCanada, 'Field Office:' + #13#10 + 'Canada');

  // dxMasterView

  cxSetResourceString(@sdxOrderNoCaption, 'OrderNo');
  cxSetResourceString(@sdxNameCaption, 'Name');
  cxSetResourceString(@sdxCountCaption, 'Count');
  cxSetResourceString(@sdxCompanyCaption, 'Company');
  cxSetResourceString(@sdxAddressCaption, 'Address');
  cxSetResourceString(@sdxPriceCaption, 'Price');
  cxSetResourceString(@sdxCashCaption, 'Cash');

  cxSetResourceString(@sdxName1, 'Jennie Valentine');
  cxSetResourceString(@sdxName2, 'Sam Hill');
  cxSetResourceString(@sdxCompany1, 'Jennie Inc.');
  cxSetResourceString(@sdxCompany2, 'Daimler-Chrysler AG');
  cxSetResourceString(@sdxAddress1, '123 Home Lane');
  cxSetResourceString(@sdxAddress2, '9333 Holmes Dr.');

  // dxTreeList

  cxSetResourceString(@sdxCountIs, 'Count is: %d');
  cxSetResourceString(@sdxRegular, 'Regular');
  cxSetResourceString(@sdxIrregular, 'Irregular');

  cxSetResourceString(@sdxTLBand, 'Item Data');
  cxSetResourceString(@sdxTLColumnName, 'Name');
  cxSetResourceString(@sdxTLColumnAxisymmetric, 'Axisymmetric');
  cxSetResourceString(@sdxTLColumnItemShape, 'Shape');

  cxSetResourceString(@sdxItemShapeAsText , '(Graphic)');

  cxSetResourceString(@sdxItem1Name, 'Cylinder');
  cxSetResourceString(@sdxItem2Name, 'Cone');
  cxSetResourceString(@sdxItem3Name, 'Pyramid');
  cxSetResourceString(@sdxItem4Name, 'Box');
  cxSetResourceString(@sdxItem5Name, 'Free Surface');

  cxSetResourceString(@sdxItem1Description, '');
  cxSetResourceString(@sdxItem2Description, 'Axisymmetric geometry figure');
  cxSetResourceString(@sdxItem3Description, 'Axisymmetric geometry figure');
  cxSetResourceString(@sdxItem4Description, 'Acute-angled geometry figure');
  cxSetResourceString(@sdxItem5Description, '');
  cxSetResourceString(@sdxItem6Description, '' );
  cxSetResourceString(@sdxItem7Description, 'Simple extrusion surface');


  // Patterns common

  cxSetResourceString(@sdxPatternIsNotRegistered, 'Pattern "%s" is not registered');

  // Excel edge patterns

  cxSetResourceString(@sdxSolidEdgePattern, 'Solid');
  cxSetResourceString(@sdxThinSolidEdgePattern, 'Medium Solid');
  cxSetResourceString(@sdxMediumSolidEdgePattern, 'Medium Solid');
  cxSetResourceString(@sdxThickSolidEdgePattern, 'Thick Solid');
  cxSetResourceString(@sdxDottedEdgePattern, 'Dotted');
  cxSetResourceString(@sdxDashedEdgePattern, 'Dashed');
  cxSetResourceString(@sdxDashDotDotEdgePattern, 'Dash Dot Dot');
  cxSetResourceString(@sdxDashDotEdgePattern, 'Dash Dot');
  cxSetResourceString(@sdxSlantedDashDotEdgePattern, 'Slanted Dash Dot');
  cxSetResourceString(@sdxMediumDashDotDotEdgePattern, 'Medium Dash Dot Dot');
  cxSetResourceString(@sdxHairEdgePattern, 'Hair');
  cxSetResourceString(@sdxMediumDashDotEdgePattern, 'Medium Dash Dot');
  cxSetResourceString(@sdxMediumDashedEdgePattern, 'Medium Dashed');
  cxSetResourceString(@sdxDoubleLineEdgePattern, 'Double Line');

  // Excel fill patterns names

  cxSetResourceString(@sdxSolidFillPattern, 'Solid');
  cxSetResourceString(@sdxGray75FillPattern, '75% Gray');
  cxSetResourceString(@sdxGray50FillPattern, '50% Gray');
  cxSetResourceString(@sdxGray25FillPattern, '25% Gray');
  cxSetResourceString(@sdxGray125FillPattern, '12.5% Gray');
  cxSetResourceString(@sdxGray625FillPattern, '6.25% Gray');
  cxSetResourceString(@sdxHorizontalStripeFillPattern, 'Horizontal Stripe');
  cxSetResourceString(@sdxVerticalStripeFillPattern, 'Vertical Stripe');
  cxSetResourceString(@sdxReverseDiagonalStripeFillPattern, 'Reverse Diagonal Stripe');
  cxSetResourceString(@sdxDiagonalStripeFillPattern, 'Diagonal Stripe');
  cxSetResourceString(@sdxDiagonalCrossHatchFillPattern, 'Diagonal Cross Hatch');
  cxSetResourceString(@sdxThickCrossHatchFillPattern, 'Thick Cross Hatch');
  cxSetResourceString(@sdxThinHorizontalStripeFillPattern, 'Thin Horizontal Stripe');
  cxSetResourceString(@sdxThinVerticalStripeFillPattern, 'Thin Vertical Stripe');
  cxSetResourceString(@sdxThinReverseDiagonalStripeFillPattern, 'Thin Reverse Diagonal Stripe');
  cxSetResourceString(@sdxThinDiagonalStripeFillPattern, 'Thin Diagonal Stripe');
  cxSetResourceString(@sdxThinHorizontalCrossHatchFillPattern, 'Thin Horizontal Cross Hatch');
  cxSetResourceString(@sdxThinDiagonalCrossHatchFillPattern, 'Thin Diagonal Cross Hatch');

  // cxSpreadSheet

  cxSetResourceString(@sdxShowRowAndColumnHeadings , '&Row and Column Headings');
  cxSetResourceString(@sdxShowGridLines, 'GridLines');
  cxSetResourceString(@sdxSuppressSourceFormats , '&Suppress Source Formats');
  cxSetResourceString(@sdxRepeatHeaderRowAtTop, 'Repeat Header Row at Top');
  //cxSetResourceString(@sdxDataToPrintDoesNotExis,'Cannot activate ReportLink because PrintingSystem did not find anything to print.');

  // Designer strings

  // Short names of month

  cxSetResourceString(@sdxJanuaryShort, 'Jan');
  cxSetResourceString(@sdxFebruaryShort, 'Feb');
  cxSetResourceString(@sdxMarchShort, 'March');
  cxSetResourceString(@sdxAprilShort, 'April');
  cxSetResourceString(@sdxMayShort, 'May');
  cxSetResourceString(@sdxJuneShort, 'June');
  cxSetResourceString(@sdxJulyShort, 'July');
  cxSetResourceString(@sdxAugustShort, 'Aug');
  cxSetResourceString(@sdxSeptemberShort, 'Sept');
  cxSetResourceString(@sdxOctoberShort, 'Oct');
  cxSetResourceString(@sdxNovemberShort, 'Nov');
  cxSetResourceString(@sdxDecemberShort, 'Dec');

  // TreeView

  cxSetResourceString(@sdxTechnicalDepartment, 'Technical Department');
  cxSetResourceString(@sdxSoftwareDepartment, 'Software Department');
  cxSetResourceString(@sdxSystemProgrammers, 'Core Developers');
  cxSetResourceString(@sdxEndUserProgrammers, 'GUI Developers');
  cxSetResourceString(@sdxBetaTesters, 'Beta Testers');
  cxSetResourceString(@sdxHumanResourceDepartment, 'Human Resource Department');

  // misc.

  cxSetResourceString(@sdxTreeLines , '&TreeLines');
  cxSetResourceString(@sdxTreeLinesColor, 'T&ree Line Color:');
  cxSetResourceString(@sdxExpandButtons, 'E&xpand Buttons');
  cxSetResourceString(@sdxCheckMarks, 'Check Marks');
  cxSetResourceString(@sdxTreeEffects, 'Tree Effects');
  cxSetResourceString(@sdxAppearance, 'Appearance');

  // Designer previews

  // Localize if you want (they are used inside FormatReport dialog -> ReportPreview)

  cxSetResourceString(@sdxCarLevelCaption, 'Cars');

  cxSetResourceString(@sdxManufacturerBandCaption, 'Manufacturer Data');
  cxSetResourceString(@sdxModelBandCaption, 'Car Data');

  cxSetResourceString(@sdxManufacturerNameColumnCaption, 'Name');
  cxSetResourceString(@sdxManufacturerLogoColumnCaption, 'Logo');
  cxSetResourceString(@sdxManufacturerCountryColumnCaption, 'Country');
  cxSetResourceString(@sdxCarModelColumnCaption, 'Model');
  cxSetResourceString(@sdxCarIsSUVColumnCaption, 'SUV');
  cxSetResourceString(@sdxCarPhotoColumnCaption, 'Photo');

  cxSetResourceString(@sdxCarManufacturerName1, 'BMW');
  cxSetResourceString(@sdxCarManufacturerName2, 'Ford');
  cxSetResourceString(@sdxCarManufacturerName3, 'Audi');
  cxSetResourceString(@sdxCarManufacturerName4, 'Land Rover');

  cxSetResourceString(@sdxCarManufacturerCountry1, 'Germany');
  cxSetResourceString(@sdxCarManufacturerCountry2, 'United States');
  cxSetResourceString(@sdxCarManufacturerCountry3, 'Germany');
  cxSetResourceString(@sdxCarManufacturerCountry4, 'United Kingdom');

  cxSetResourceString(@sdxCarModel1, 'X5 4.8is');
  cxSetResourceString(@sdxCarModel2, 'Excursion');
  cxSetResourceString(@sdxCarModel3, 'S8 Quattro');
  cxSetResourceString(@sdxCarModel4, 'G4 Challenge');

  cxSetResourceString(@sdxTrue, 'True');
  cxSetResourceString(@sdxFalse, 'False');

  //PS 2.4

  // dxPrnDev.pas

  cxSetResourceString(@sdxAuto, 'Auto');
  cxSetResourceString(@sdxCustom, 'Custom');
  cxSetResourceString(@sdxEnv, 'Env');

  // Grid 4

  cxSetResourceString(@sdxLookAndFeelFlat, 'Flat');
  cxSetResourceString(@sdxLookAndFeelStandard, 'Standard');
  cxSetResourceString(@sdxLookAndFeelUltraFlat, 'UltraFlat');

  cxSetResourceString(@sdxViewTab, 'View');
  cxSetResourceString(@sdxBehaviorsTab, 'Behaviors');
  cxSetResourceString(@sdxPreviewTab, 'Preview');
  cxSetResourceString(@sdxCardsTab, 'Cards');

  cxSetResourceString(@sdxFormatting, 'Formatting');
  cxSetResourceString(@sdxLookAndFeel, 'Look and Feel');
  cxSetResourceString(@sdxLevelCaption , '&Caption');
  cxSetResourceString(@sdxFilterBar , '&Filter Bar');
  cxSetResourceString(@sdxRefinements, 'Refinements');
  cxSetResourceString(@sdxProcessSelection, 'Process &Selection');
  cxSetResourceString(@sdxProcessExactSelection, 'Process E&xact Selection');
  cxSetResourceString(@sdxExpanding, 'Expanding');
  cxSetResourceString(@sdxGroups , '&Groups');
  cxSetResourceString(@sdxDetails , '&Details');
  cxSetResourceString(@sdxStartFromActiveDetails, 'Start from Active Details');
  cxSetResourceString(@sdxOnlyActiveDetails, 'Only Active Details');
  cxSetResourceString(@sdxVisible , '&Visible');
  cxSetResourceString(@sdxPreviewAutoHeight, 'A&uto Height');
  cxSetResourceString(@sdxPreviewMaxLineCount , '&Max Line Count: ');
  cxSetResourceString(@sdxSizes, 'Sizes');
  cxSetResourceString(@sdxKeepSameWidth , '&Keep Same Width');
  cxSetResourceString(@sdxKeepSameHeight, 'Keep Same &Height');
  cxSetResourceString(@sdxFraming, 'Framing');
  cxSetResourceString(@sdxSpacing, 'Spacing');
  cxSetResourceString(@sdxShadow, 'Shadow');
  cxSetResourceString(@sdxDepth , '&Depth:');
  cxSetResourceString(@sdxPosition , '&Position');
  cxSetResourceString(@sdxPositioning, 'Positioning');
  cxSetResourceString(@sdxHorizontal, 'H&orizontal:');
  cxSetResourceString(@sdxVertical, 'V&ertical:');

  cxSetResourceString(@sdxSummaryFormat, 'Count = 0');

//  cxSetResourceString(@sdxCannotUseOnEveryPageMo,
//    'Cannot Use OnEveryPage Mode'+ #13#10 +
//    #13#10 +
//    'You should or(and)' + #13#10 +
//    '  - Collapse all Master Records' + #13#10 +
//    '  - Toggle "Unwrap" Option off on "Behaviors" Tab');
//
//  cxSetResourceString(@sdxIncorrectBandHeadersSta,
//    'Cannot Use BandHeaders OnEveryPage Mode' + #13#10 +
//    #13#10 +
//    'You should either:' + #13#10 +
//    '  - Set Caption OnEveryPage Option On' + #13#10 +
//    '  - Set Caption Visible Option Off');
//  cxSetResourceString(@sdxIncorrectHeadersSta,
//    'Cannot Use Headers OnEveryPage Mode' + #13#10 +
//    #13#10 +
//    'You should either:' + #13#10 +
//    '  - Set Caption and Band OnEveryPage Option On' + #13#10 +
//    '  - Set Caption and Band Visible Option Off');
//  cxSetResourceString(@sdxIncorrectFootersSta,
//   'Cannot Use Footers OnEveryPage Mode' + #13#10 +
//    #13#10 +
//    'You should either:' + #13#10 +
//    '  - Set FilterBar OnEveryPage Option On' + #13#10 +
//    '  - Set FilterBar Visible Option Off');
//
  cxSetResourceString(@sdxCharts, 'Charts');

  // PS 3

  cxSetResourceString(@sdxTPicture, 'TPicture');
  cxSetResourceString(@sdxCopy , '&Copy');
  cxSetResourceString(@sdxSave , '&Save...');
  cxSetResourceString(@sdxBaseStyle, 'Base Style');

  cxSetResourceString(@sdxComponentAlreadyExists, 'Component named "%s" already exists');
  cxSetResourceString(@sdxInvalidComponentName , '%s" is not a valid component name');

  // shapes

  cxSetResourceString(@sdxRectangle, 'Rectangle');
  cxSetResourceString(@sdxSquare, 'Square');
  cxSetResourceString(@sdxEllipse, 'Ellipse');
  cxSetResourceString(@sdxCircle, 'Circle');
  cxSetResourceString(@sdxRoundRect, 'RoundRect');
  cxSetResourceString(@sdxRoundSquare, 'RoundSquare');

  //standard pattern names

  cxSetResourceString(@sdxHorizontalFillPattern, 'Horizontal');
  cxSetResourceString(@sdxVerticalFillPattern, 'Vertical');
  cxSetResourceString(@sdxFDiagonalFillPattern, 'FDiagonal');
  cxSetResourceString(@sdxBDiagonalFillPattern, 'BDiagonal');
  cxSetResourceString(@sdxCrossFillPattern, 'Cross');
  cxSetResourceString(@sdxDiagCrossFillPattern, 'DiagCros');

  // explorer

  cxSetResourceString(@sdxCyclicIDReferences, 'Cyclic ID references %s and %s');
  cxSetResourceString(@sdxLoadReportDataToFileTitle, 'Load Report');
  cxSetResourceString(@sdxSaveReportDataToFileTitle, 'Save Report As');
  cxSetResourceString(@sdxInvalidExternalStorage, 'Invalid External Storage');
//  cxSetResourceString(@sdxLinkIsNotIncludedInUsesClaus,
//    'ReportFile contains ReportLink "%0:s"' + #13#10 +
//    'Unit with declaration of "%0:s" must be included in uses clause';
//  sdxInvalidStorageVersion, 'Invalid Storage Verison: %d';
//  sdxPSReportFiles, 'Report Files');
  cxSetResourceString(@sdxReportFileLoadError,
    'Cannot load Report File "%s".' + #13#10 +
    'File is corrupted or is locked by another User or Application.' + #13#10 +
    #13#10 +
    'Original Report will be restored.');

  cxSetResourceString(@sdxNone , '(None)');
  cxSetResourceString(@sdxReportDocumentIsCorrupted, '(File is not a ReportDocument or Corrupted)');

  cxSetResourceString(@sdxCloseExplorerHint, 'Close Explorer');
  cxSetResourceString(@sdxExplorerCaption, 'Explorer');
  cxSetResourceString(@sdxExplorerRootFolderCaption, 'Root');
  cxSetResourceString(@sdxNewExplorerFolderItem, 'New Folder');
  cxSetResourceString(@sdxCopyOfItem, 'Copy of ');
  cxSetResourceString(@sdxReportExplorer, 'Report Explorer');

  cxSetResourceString(@sdxDataLoadErrorText, 'Cannot load Report Data');
//  cxSetResourceString(@sdxDBBasedExplorerItemDataLoadErr,
//    'Cannot load Report Data.' + #13#10 +
//    'Data are corrupted or are locked');
//  cxSetResourceString(@sdxFileBasedExplorerItemDataLoadErr,
//    'Cannot load Report Data.' + #13#10 +
//    'File is corrupted or is locked by another User or Application');
  cxSetResourceString(@sdxDeleteNonEmptyFolderMessageText, 'Folder "%s" is not Empty. Delete anyway?');
  cxSetResourceString(@sdxDeleteFolderMessageText, 'Delete Folder "%s" ?');
  cxSetResourceString(@sdxDeleteItemMessageText, 'Delete Item "%s" ?');
  cxSetResourceString(@sdxCannotRenameFolderText, 'Cannot rename folder "%s". A folder with name "%s" already exists. Specify a different name.');
  cxSetResourceString(@sdxCannotRenameItemText, 'Cannot rename item "%s". An item with name "%s" already exists. Specify a different name.');
  cxSetResourceString(@sdxOverwriteFolderMessageText,
    'This folder "%s" already contains folder named "%s".' + #13#10 +
    #13#10 +
    'If the items in existing folder have the same name as items in the' + #13#10 +
    'folder you are moving or copying, they will be replaced. Do you still?' + #13#10 +
    'want to move or copy the folder?');
  cxSetResourceString(@sdxOverwriteItemMessageText,
    'This Folder "%s" already contains item named "%s".' + #13#10 +
    #13#10 +
    'Would you like to overwrite existing item?');
  cxSetResourceString(@sdxSelectNewRoot, 'Select new Root Directory where the Reports will be stored');
  cxSetResourceString(@sdxInvalidFolderName, 'Invalid Folder Name "%s"');
  cxSetResourceString(@sdxInvalidReportName, 'Invalid Report Name "%s"');

  cxSetResourceString(@sdxExplorerBar, 'Explorer');

  cxSetResourceString(@sdxMenuFileSave , '&Save');
  cxSetResourceString(@sdxMenuFileSaveAs, 'Save &As...');
  cxSetResourceString(@sdxMenuFileLoad , '&Load');
  cxSetResourceString(@sdxMenuFileClose, 'U&nload');
  cxSetResourceString(@sdxHintFileSave, 'Save Report');
  cxSetResourceString(@sdxHintFileSaveAs, 'Save Report As');
  cxSetResourceString(@sdxHintFileLoad, 'Load Report');
  cxSetResourceString(@sdxHintFileClose, 'Unload Report');

  cxSetResourceString(@sdxMenuExplorer, 'E&xplorer');
  cxSetResourceString(@sdxMenuExplorerCreateFolder, 'Create &Folder');
  cxSetResourceString(@sdxMenuExplorerDelete , '&Delete...');
  cxSetResourceString(@sdxMenuExplorerRename, 'Rena&me');
  cxSetResourceString(@sdxMenuExplorerProperties , '&Properties...');
  cxSetResourceString(@sdxMenuExplorerRefresh, 'Refresh');
  cxSetResourceString(@sdxMenuExplorerChangeRootPath, 'Change Root...');
  cxSetResourceString(@sdxMenuExplorerSetAsRoot, 'Set As Root');
  cxSetResourceString(@sdxMenuExplorerGoToUpOneLevel, 'Up One Level');

  cxSetResourceString(@sdxHintExplorerCreateFolder, 'Create New Folder');
  cxSetResourceString(@sdxHintExplorerDelete, 'Delete');
  cxSetResourceString(@sdxHintExplorerRename, 'Rename');
  cxSetResourceString(@sdxHintExplorerProperties, 'Properties');
  cxSetResourceString(@sdxHintExplorerRefresh, 'Refresh');
  cxSetResourceString(@sdxHintExplorerChangeRootPath, 'Change Root');
  cxSetResourceString(@sdxHintExplorerSetAsRoot, 'Set Current Folder as Root');
  cxSetResourceString(@sdxHintExplorerGoToUpOneLevel, 'Up One Level');

  cxSetResourceString(@sdxMenuViewExplorer, 'E&xplorer');
  cxSetResourceString(@sdxHintViewExplorer, 'Show Explorer');

  cxSetResourceString(@sdxSummary, 'Summary');
  cxSetResourceString(@sdxCreator, 'Creato&r:');
  cxSetResourceString(@sdxCreationDate, 'Create&d:');

  cxSetResourceString(@sdxMenuViewThumbnails, 'Th&umbnails');
  cxSetResourceString(@sdxMenuThumbnailsLarge , '&Large Thumbnails');
  cxSetResourceString(@sdxMenuThumbnailsSmall , '&Small Thumbnails');

  cxSetResourceString(@sdxHintViewThumbnails, 'Show Thumbnails');
  cxSetResourceString(@sdxHintThumbnailsLarge, 'Switch to large thumbnails');
  cxSetResourceString(@sdxHintThumbnailsSmall, 'Switch to small thumbnails');

  cxSetResourceString(@sdxMenuFormatTitle, 'T&itle...');
  cxSetResourceString(@sdxHintFormatTitle, 'Format Report Title');
  cxSetResourceString(@sdxMenuFormatFootnotes, 'Foot&notes...');
  cxSetResourceString(@sdxHintFormatFootnotes, 'Format Report Footnotes...');

  cxSetResourceString(@sdxHalf, 'Half');
  cxSetResourceString(@sdxPredefinedFunctions, ' Predefined Functions '); // dxPgsDlg.pas
  cxSetResourceString(@sdxZoomParameters, ' Zoom &Parameters ');          // dxPSPrvwOpt.pas

  cxSetResourceString(@sdxWrapData , '&Wrap Data');

  cxSetResourceString(@sdxMenuShortcutExplorer, 'Explorer');
  cxSetResourceString(@sdxExplorerToolBar, 'Explorer');

  cxSetResourceString(@sdxMenuShortcutThumbnails, 'Thumbnails');

  //Ribbon Print Preview Window

  cxSetResourceString(@sdxRibbonPrintPreviewClosePrintPreview, 'Close Print Preview');
  cxSetResourceString(@sdxRibbonPrintPreviewGroupFormat, 'Format');
  cxSetResourceString(@sdxRibbonPrintPreviewGroupInsertName, 'Name');
  cxSetResourceString(@sdxRibbonPrintPreviewGroupInsertPageNumber, 'Page Number');
  cxSetResourceString(@sdxRibbonPrintPreviewGroupNavigation, 'Navigation');
  cxSetResourceString(@sdxRibbonPrintPreviewGroupOutput, 'Output');
  cxSetResourceString(@sdxRibbonPrintPreviewGroupParts, 'Parts');
  cxSetResourceString(@sdxRibbonPrintPreviewGroupReport, 'Report');
  cxSetResourceString(@sdxRibbonPrintPreviewGroupZoom, 'Zoom');
  cxSetResourceString(@sdxRibbonPrintPreviewPagesSubItem, 'Pages');

  //TreeView New

  cxSetResourceString(@sdxButtons, 'Buttons');

  // ListView

  cxSetResourceString(@sdxBtnHeadersFont , '&Headers Font...');
  cxSetResourceString(@sdxHeadersTransparent, 'Transparent &Headers');
  cxSetResourceString(@sdxHintListViewDesignerMessage ,  'Most Options Are Being Taken Into Account Only In Detailed View');
  cxSetResourceString(@sdxColumnHeaders , '&Column Headers');

  //Group LookAndFeel Names

  cxSetResourceString(@sdxReportGroupNullLookAndFeel, 'Null');
  cxSetResourceString(@sdxReportGroupStandardLookAndFeel, 'Standard');
  cxSetResourceString(@sdxReportGroupOfficeLookAndFeel, 'Office');
  cxSetResourceString(@sdxReportGroupWebLookAndFeel, 'Web');

  // Layout

  cxSetResourceString(@sdxLayoutGroupDefaultCaption, 'Layout Group');
  cxSetResourceString(@sdxLayoutItemDefaultCaption, 'Layout Item');
  cxSetResourceString(@sdxTabs, 'Tabs');
  cxSetResourceString(@sdxUnwrapTabs , '&Unwrap Tabs');
  cxSetResourceString(@sdxActiveTabToTop, 'Display Active Tab on Top');
  cxSetResourceString(@sdxBehaviorsGroups, 'Groups');
  cxSetResourceString(@sdxSkipEmptyGroups, 'Skip Empty Groups');
  cxSetResourceString(@sdxExpandedGroups, 'Expand Groups');


  cxSetResourceString(@sdxCarManufacturerName5, 'DaimlerChrysler AG');
  cxSetResourceString(@sdxCarManufacturerCountry5, 'Germany');
  cxSetResourceString(@sdxCarModel5, 'Maybach 62');

  cxSetResourceString(@sdxLuxurySedans, 'Luxury Sedans');
  cxSetResourceString(@sdxCarManufacturer, 'Manufacturer');
  cxSetResourceString(@sdxCarModel, 'Model');
  cxSetResourceString(@sdxCarEngine, 'Engine');
  cxSetResourceString(@sdxCarTransmission, 'Transmission');
  cxSetResourceString(@sdxCarTires, 'Tires');
  cxSetResourceString(@sdx760V12Manufacturer, 'BMW');
  cxSetResourceString(@sdx760V12Model, '760Li V12');
  cxSetResourceString(@sdx760V12Engine, '6.0L DOHC V12 438 HP 48V DI Valvetronic 12-cylinder engine with 6.0-liter displacement, dual overhead cam valvetrain');
  cxSetResourceString(@sdx760V12Transmission, 'Elec 6-Speed Automatic w/Steptronic');
  cxSetResourceString(@sdx760V12Tires, 'P245/45R19 Fr - P275/40R19 Rr Performance. Low Profile tires with 245mm width, 19.0" rim');

  // Styles

  cxSetResourceString(@sdxBandBackgroundStyle, 'BandBackground');
  cxSetResourceString(@sdxBandHeaderStyle, 'BandHeader');
  cxSetResourceString(@sdxCaptionStyle, 'Caption');
  cxSetResourceString(@sdxCardCaptionRowStyle, 'Card Caption Row');
  cxSetResourceString(@sdxCardRowCaptionStyle, 'Card Row Caption');
  cxSetResourceString(@sdxCategoryStyle, 'Category');
  cxSetResourceString(@sdxContentStyle, 'Content');
  cxSetResourceString(@sdxContentEvenStyle, 'Content Even Rows');
  cxSetResourceString(@sdxContentOddStyle, 'Content Odd Rows');
  cxSetResourceString(@sdxFilterBarStyle, 'Filter Bar');
  cxSetResourceString(@sdxFooterStyle, 'Footer');
  cxSetResourceString(@sdxFooterRowStyle, 'Footer Row');
  cxSetResourceString(@sdxGroupStyle, 'Group');
  cxSetResourceString(@sdxHeaderStyle, 'Header');
  cxSetResourceString(@sdxIndentStyle, 'Indent');
  cxSetResourceString(@sdxPreviewStyle, 'Preview');
  cxSetResourceString(@sdxSelectionStyle, 'Selection');

  cxSetResourceString(@sdxStyles, 'Styles');
  cxSetResourceString(@sdxStyleSheets, 'Style Sheets');
  cxSetResourceString(@sdxBtnTexture , '&Texture...');
  cxSetResourceString(@sdxBtnTextureClear, 'Cl&ear');
  cxSetResourceString(@sdxBtnColor, 'Co&lor...');
  cxSetResourceString(@sdxBtnSaveAs, 'Save &As...');
  cxSetResourceString(@sdxBtnRename, 'Rena&me...');

  cxSetResourceString(@sdxLoadBitmapDlgTitle, 'Load Texture');

  cxSetResourceString(@sdxDeleteStyleSheet, 'Delete StyleSheet Named "%s"?');
  cxSetResourceString(@sdxUnnamedStyleSheet, 'Unnamed');
  cxSetResourceString(@sdxCreateNewStyleQueryNamePrompt, 'Enter New StyleSheet Name: ');
  cxSetResourceString(@sdxStyleSheetNameAlreadyExists, 'StyleSheet named "%s" Already Exists');

  cxSetResourceString(@sdxCannotLoadImage, 'Cannot Load Image "%s"');
  cxSetResourceString(@sdxUseNativeStyles , '&Use Native Styles');
  cxSetResourceString(@sdxSuppressBackgroundBitmaps , '&Suppress Background Textures');
  cxSetResourceString(@sdxConsumeSelectionStyle, 'Consume Selection Style');

  // Grid4 new

  cxSetResourceString(@sdxSize, 'Size');
  cxSetResourceString(@sdxLevels, 'Levels');
  cxSetResourceString(@sdxUnwrap , '&Unwrap');
  cxSetResourceString(@sdxUnwrapTopLevel, 'Un&wrap Top Level');
  cxSetResourceString(@sdxRiseActiveToTop, 'Rise Active Level onto Top');
  cxSetResourceString(@sdxCannotUseOnEveryPageModeInAggregatedState,
    'Cannot Use OnEveryPage Mode'+ #13#10 +
    'While Performing in Aggregated State');

  cxSetResourceString(@sdxPagination, 'Pagination');
  cxSetResourceString(@sdxByBands, 'By Bands');
  cxSetResourceString(@sdxByColumns, 'By Columns');
  cxSetResourceString(@sdxByRows, 'By &Rows');
  cxSetResourceString(@sdxByTopLevelGroups, 'By TopLevel Groups');
  cxSetResourceString(@sdxOneGroupPerPage, 'One Group Per Page');

  cxSetResourceString(@sdxSkipEmptyViews, 'Skip Empty Views');

  cxSetResourceString(@sdxBorders, 'Borders');
  cxSetResourceString(@sdxExplicitlyExpandNodes, 'Explicitly Expand Nodes');
  cxSetResourceString(@sdxNodes , '&Nodes');
  cxSetResourceString(@sdxSeparators, 'Separators');
  cxSetResourceString(@sdxThickness, 'Thickness:');
  cxSetResourceString(@sdxTLIncorrectHeadersState,
    'Cannot Use Headers OnEveryPage Mode' + #13#10 +
    #13#10 +
    'You should either:' + #13#10 +
    '  - Set Band OnEveryPage Option On' + #13#10 +
    '  - Set Band Visible Option Off');

  // cxVerticalGrid

  cxSetResourceString(@sdxRows , '&Rows');

  cxSetResourceString(@sdxMultipleRecords , '&Multiple Records');
  cxSetResourceString(@sdxBestFit , '&Best Fit');
  cxSetResourceString(@sdxKeepSameRecordWidths , '&Keep Same Record Widths');
  cxSetResourceString(@sdxWrapRecords , '&Wrap Records');

  cxSetResourceString(@sdxByWrapping, 'By &Wrapping');
  cxSetResourceString(@sdxOneWrappingPerPage , '&One Wrapping Per Page');

  //new in 3.01
  cxSetResourceString(@sdxCurrentRecord, 'Current Record');
  cxSetResourceString(@sdxLoadedRecords, 'Loaded Records');
  cxSetResourceString(@sdxAllRecords, 'All Records');

  // Container Designer

  cxSetResourceString(@sdxPaginateByControlDetails, 'Control Details');
  cxSetResourceString(@sdxPaginateByControls, 'Controls');
  cxSetResourceString(@sdxPaginateByGroups, 'Groups');
  cxSetResourceString(@sdxPaginateByItems, 'Items');

  cxSetResourceString(@sdxControlsPlace, 'Controls Place');
  cxSetResourceString(@sdxExpandHeight, 'Expand Height');
  cxSetResourceString(@sdxExpandWidth, 'Expand Width');
  cxSetResourceString(@sdxShrinkHeight, 'Shrink Height');
  cxSetResourceString(@sdxShrinkWidth, 'Shrink Width');

  cxSetResourceString(@sdxCheckAll, 'Check &All');
  cxSetResourceString(@sdxCheckAllChildren, 'Check All &Children');
  cxSetResourceString(@sdxControlsTab, 'Controls');
  cxSetResourceString(@sdxExpandAll, 'E&xpand All');
  cxSetResourceString(@sdxHiddenControlsTab, 'Available Controls');
  cxSetResourceString(@sdxReportLinksTab, 'Aggregated Designers');
  cxSetResourceString(@sdxAvailableLinks , '&Available Links:');
  cxSetResourceString(@sdxAggregatedLinks, 'A&ggregated Links:');
  cxSetResourceString(@sdxTransparents, 'Transparents');
  cxSetResourceString(@sdxUncheckAllChildren, 'Uncheck &All Children');

  cxSetResourceString(@sdxRoot , '&Root');
  cxSetResourceString(@sdxRootBorders, 'Root &Borders');
  cxSetResourceString(@sdxControls , '&Controls');
  cxSetResourceString(@sdxContainers, 'C&ontainers');

  cxSetResourceString(@sdxHideCustomContainers , '&Hide Custom Containers');

  // General

  // FileSize abbreviation

  cxSetResourceString(@sdxBytes, 'Bytes');
  cxSetResourceString(@sdxKiloBytes, 'KB');
  cxSetResourceString(@sdxMegaBytes, 'MB');
  cxSetResourceString(@sdxGigaBytes, 'GB');

  // Misc.

  cxSetResourceString(@sdxThereIsNoPictureToDisplay, 'There is no picture to display');
  cxSetResourceString(@sdxInvalidRootDirectory, 'Directory "%s" does not exists. Continue selection ?');
  cxSetResourceString(@sdxPressEscToCancel, 'Press Esc to cancel');
  cxSetResourceString(@sdxMenuFileRebuild , '&Rebuild');
  cxSetResourceString(@sdxBuildingReportStatusText, 'Building report - Press Esc to cancel');
  cxSetResourceString(@sdxPrintingReportStatusText, 'Printing report - Press Esc to cancel');

  cxSetResourceString(@sdxBuiltIn , '[BuiltIn]');
  cxSetResourceString(@sdxUserDefined , '[User Defined]');
  cxSetResourceString(@sdxNewStyleRepositoryWasCreated, 'New StyleRepository "%s" was created and assigned');

  // new in PS 3.1
  cxSetResourceString(@sdxLineSpacing , '&Line spacing:');
  cxSetResourceString(@sdxTextAlignJustified, 'Justified');
  cxSetResourceString(@sdxSampleText, 'Sample Text Sample Text');

  cxSetResourceString(@sdxCardsRows , '&Cards');
  cxSetResourceString(@sdxTransparentRichEdits, 'Transparent &RichEdit Content');

  cxSetResourceString(@sdxIncorrectFilterBarState,
    'Cannot Use FilterBar OnEveryPage Mode' + #13#10 +
    #13#10 +
    'You should either:' + #13#10 +
    '  - Set Caption OnEveryPage Option On' + #13#10 +
    '  - Set Caption Visible Option Off');
  cxSetResourceString(@sdxIncorrectBandHeadersState2,
    'Cannot Use BandHeaders OnEveryPage Mode' + #13#10 +
    #13#10 +
    'You should either:' + #13#10 +
    '  - Set Caption and FilterBar OnEveryPage Option On' + #13#10 +
    '  - Set Caption and FilterBar Visible Option Off');
  cxSetResourceString(@sdxIncorrectHeadersState2,
    'Cannot Use Headers OnEveryPage Mode' + #13#10 +
    #13#10 +
    'You should either:' + #13#10 +
    '  - Set Caption, FilterBar and Band OnEveryPage Option On' + #13#10 +
    '  - Set Caption, FilterBar and Band Visible Option Off');

 // new in PS 3.2
  cxSetResourceString(@sdxAvailableReportLinks, 'Available ReportLinks');
  cxSetResourceString(@sdxBtnRemoveInconsistents, 'Remove Unneeded');
  cxSetResourceString(@sdxColumnHeadersOnEveryPage, 'Column &Headers');
  cxSetResourceString(@sdxRowHeadersOnEveryPage, 'Row Headers');

 // Scheduler

  cxSetResourceString(@sdxNotes, 'Notes');
  cxSetResourceString(@sdxTaskPad, 'TaskPad');
  cxSetResourceString(@sdxPrimaryTimeZone, 'Primary');
  cxSetResourceString(@sdxSecondaryTimeZone, 'Secondary');

  cxSetResourceString(@sdxDay, 'Day');
  cxSetResourceString(@sdxWeek, 'Week');
  cxSetResourceString(@sdxMonth, 'Month');

  cxSetResourceString(@sdxSchedulerSchedulerHeader, 'Scheduler Header');
  cxSetResourceString(@sdxSchedulerContent, 'Content');
  cxSetResourceString(@sdxSchedulerDateNavigatorContent, 'DateNavigator Content');
  cxSetResourceString(@sdxSchedulerDateNavigatorHeader, 'DateNavigator Header');
  cxSetResourceString(@sdxSchedulerDayHeader, 'Day Header');
  cxSetResourceString(@sdxSchedulerEvent, 'Event');
  cxSetResourceString(@sdxSchedulerResourceHeader, 'Resource Header');
  cxSetResourceString(@sdxSchedulerNotesAreaBlank, 'Notes Area (Blank)');
  cxSetResourceString(@sdxSchedulerNotesAreaLined, 'Notes Area (Lined)');
  cxSetResourceString(@sdxSchedulerTaskPad, 'TaskPad');
  cxSetResourceString(@sdxSchedulerTimeRuler, 'Time Ruler');

  cxSetResourceString(@sdxPrintStyleNameDaily, 'Daily');
  cxSetResourceString(@sdxPrintStyleNameWeekly, 'Weekly');
  cxSetResourceString(@sdxPrintStyleNameMonthly, 'Monthly');
  cxSetResourceString(@sdxPrintStyleNameDetails, 'Details');
  cxSetResourceString(@sdxPrintStyleNameMemo, 'Memo');
  cxSetResourceString(@sdxPrintStyleNameTrifold, 'Trifold');

  cxSetResourceString(@sdxPrintStyleCaptionDaily, 'Daily Style');
  cxSetResourceString(@sdxPrintStyleCaptionWeekly, 'Weekly Style');
  cxSetResourceString(@sdxPrintStyleCaptionMonthly, 'Monthly Style');
  cxSetResourceString(@sdxPrintStyleCaptionDetails, 'Calendar Details Style');
  cxSetResourceString(@sdxPrintStyleCaptionMemo, 'Memo Style');
  cxSetResourceString(@sdxPrintStyleCaptionTimeLine, 'TimeLine Style');
  cxSetResourceString(@sdxPrintStyleCaptionTrifold, 'Tri-fold Style');
  cxSetResourceString(@sdxPrintStyleCaptionYearly, 'Yearly Style');
  cxSetResourceString(@sdxPrintStyleShowEventImages, 'Show Event Images');
  cxSetResourceString(@sdxPrintStyleShowResourceImages, 'Show Resource Images');

  cxSetResourceString(@sdxTabPrintStyles, 'Print Styles');

  cxSetResourceString(@sdxPrintStyleDontPrintWeekEnds , '&Don''t Print Weekends');
  cxSetResourceString(@sdxPrintStyleWorkTimeOnly , '&Work Time Only');

  cxSetResourceString(@sdxPrintStyleInclude, 'Include:');
  cxSetResourceString(@sdxPrintStyleIncludeTaskPad, 'Task&Pad');
  cxSetResourceString(@sdxPrintStyleIncludeNotesAreaBlank, 'Notes Area (&Blank)');
  cxSetResourceString(@sdxPrintStyleIncludeNotesAreaLined, 'Notes Area (&Lined)');
  cxSetResourceString(@sdxPrintStyleLayout , '&Layout:');
  cxSetResourceString(@sdxPrintStylePrintFrom, 'Print &From:');
  cxSetResourceString(@sdxPrintStylePrintTo, 'Print &To:');

  cxSetResourceString(@sdxPrintStyleDailyLayout1PPD, '1 page/day');
  cxSetResourceString(@sdxPrintStyleDailyLayout2PPD, '2 pages/day');

  cxSetResourceString(@sdxPrintStyleWeeklyArrange , '&Arrange:');
  cxSetResourceString(@sdxPrintStyleWeeklyArrangeT2B, 'Top to bottom');
  cxSetResourceString(@sdxPrintStyleWeeklyArrangeL2R, 'Left to right');
  cxSetResourceString(@sdxPrintStyleWeeklyLayout1PPW, '1 page/week');
  cxSetResourceString(@sdxPrintStyleWeeklyLayout2PPW, '2 pages/week');
  cxSetResourceString(@sdxPrintStyleWeeklyDaysLayout   , '&Days layout:');
  cxSetResourceString(@sdxPrintStyleWeeklyDaysLayoutTC, 'Two columns');
  cxSetResourceString(@sdxPrintStyleWeeklyDaysLayoutOC, 'One column');

  cxSetResourceString(@sdxPrintStyleMemoStartEachItemOnNewPage, 'Start Each Item On New Page');
  cxSetResourceString(@sdxPrintStyleMemoPrintOnlySelectedEvents, 'Print Only Selected Events');

  cxSetResourceString(@sdxPrintStyleMonthlyLayout1PPM, '1 page/month');
  cxSetResourceString(@sdxPrintStyleMonthlyLayout2PPM, '2 pages/month');
  cxSetResourceString(@sdxPrintStyleMonthlyPrintExactly1MPP, 'Print &Exactly One Month Per Page');

  cxSetResourceString(@sdxPrintStyleTrifoldSectionModeDailyCalendar, 'Daily Calendar');
  cxSetResourceString(@sdxPrintStyleTrifoldSectionModeWeeklyCalendar, 'Weekly Calendar');
  cxSetResourceString(@sdxPrintStyleTrifoldSectionModeMonthlyCalendar, 'Monthly Calendar');
  cxSetResourceString(@sdxPrintStyleTrifoldSectionModeTaskPad, 'TaskPad');
  cxSetResourceString(@sdxPrintStyleTrifoldSectionModeNotesBlank, 'Notes (Blank)');
  cxSetResourceString(@sdxPrintStyleTrifoldSectionModeNotesLined, 'Notes (Lined)');
  cxSetResourceString(@sdxPrintStyleTrifoldSectionLeft , '&Left Section:');
  cxSetResourceString(@sdxPrintStyleTrifoldSectionMiddle , '&Middle Section:');
  cxSetResourceString(@sdxPrintStyleTrifoldSectionRight , '&Right Section:');

  cxSetResourceString(@sdxPrintStyleMonthPerPage , '&Months/Page:');
  cxSetResourceString(@sdxPrintStyleYearly1MPP , '1 month/page');
  cxSetResourceString(@sdxPrintStyleYearly2MPP , '2 months/page');
  cxSetResourceString(@sdxPrintStyleYearly3MPP , '3 months/page');
  cxSetResourceString(@sdxPrintStyleYearly4MPP , '4 months/page');
  cxSetResourceString(@sdxPrintStyleYearly6MPP , '6 months/page');
  cxSetResourceString(@sdxPrintStyleYearly12MPP, '12 months/page');

  cxSetResourceString(@sdxPrintStylePrimaryPageScalesOnly, 'Primary Page Scales Only');
  cxSetResourceString(@sdxPrintStylePrimaryPageHeadersOnly, 'Primary Page Headers Only');

  cxSetResourceString(@sdxPrintStyleDetailsStartNewPageEach, 'Start a New Page Each:');

  cxSetResourceString(@sdxSuppressContentColoration, 'Suppress &Content Coloration');
  cxSetResourceString(@sdxOneResourcePerPage, 'One &Resource Per Page');

  cxSetResourceString(@sdxPrintRanges, 'Print Ranges');
  cxSetResourceString(@sdxPrintRangeStart , '&Start:');
  cxSetResourceString(@sdxPrintRangeEnd , '&End:');
  cxSetResourceString(@sdxHideDetailsOfPrivateAppointments , '&Hide Details of Private Appointments');
  cxSetResourceString(@sdxResourceCountPerPage , '&Resources/Page:');

  cxSetResourceString(@sdxSubjectLabelCaption, 'Subject:');
  cxSetResourceString(@sdxLocationLabelCaption, 'Location:');
  cxSetResourceString(@sdxStartLabelCaption, 'Start:');
  cxSetResourceString(@sdxFinishLabelCaption, 'End:');
  cxSetResourceString(@sdxShowTimeAsLabelCaption, 'Show Time As:');
  cxSetResourceString(@sdxRecurrenceLabelCaption, 'Recurrence:');
  cxSetResourceString(@sdxRecurrencePatternLabelCaption, 'Recurrence Pattern:');

  //messages
  cxSetResourceString(@sdxSeeAboveMessage, 'Please See Above');
  cxSetResourceString(@sdxAllDayMessage, 'All Day');
  cxSetResourceString(@sdxContinuedMessage, 'Continued');
  cxSetResourceString(@sdxShowTimeAsFreeMessage, 'Free');
  cxSetResourceString(@sdxShowTimeAsTentativeMessage, 'Tentative');
  cxSetResourceString(@sdxShowTimeAsOutOfOfficeMessage, 'Out of Office');

  cxSetResourceString(@sdxRecurrenceNoneMessage , '(none)');
  cxSetResourceString(@scxRecurrenceDailyMessage, 'Daily');
  cxSetResourceString(@scxRecurrenceWeeklyMessage, 'Weekly');
  cxSetResourceString(@scxRecurrenceMonthlyMessage, 'Monthly');
  cxSetResourceString(@scxRecurrenceYearlyMessage, 'Yearly');

  //error messages
  cxSetResourceString(@sdxInconsistentTrifoldStyle, 'The Tri-fold style requires at least one calendar section. ' +
    'Select Daily, Weekly, or Monthly Calendar for one of section under Options.');
  cxSetResourceString(@sdxBadTimePrintRange, 'The hours to print are not valid. The start time must precede the end time.');
  cxSetResourceString(@sdxBadDatePrintRange, 'The date in the End box cannot be prior to the date in the Start box.');
  cxSetResourceString(@sdxCannotPrintNoSelectedItems, 'Cannot print unless an item is selected. Select an item, and then try to print again.');
  cxSetResourceString(@sdxCannotPrintNoItemsAvailable, 'No items available within the specified print range.');

  // PivotGrid

  cxSetResourceString(@sdxColumnFields, '&Column Fields');
  cxSetResourceString(@sdxDataFields, '&Data Fields');
  cxSetResourceString(@sdxFiterFields, '&Filter Fields');
  cxSetResourceString(@sdxPrefilter, '&Prefilter');
  cxSetResourceString(@sdxRowFields, '&Row Fields');

  cxSetResourceString(@sdxAutoColumnsExpand, 'A&uto Columns Expand');
  cxSetResourceString(@sdxAutoRowsExpand, 'Auto &Rows Expand');

  // styles
  cxSetResourceString(@sdxPivotGridColumnHeader, 'Column Header');
  cxSetResourceString(@sdxPivotGridContent, 'Content');
  cxSetResourceString(@sdxPivotGridFieldHeader , 'Field Header');
  cxSetResourceString(@sdxPivotGridHeaderBackground, 'Header Background');
  cxSetResourceString(@sdxPivotGridRowHeader, 'Row Header');
  cxSetResourceString(@sdxPivotGridPrefilter, 'Prefilter');

  // PivotPreview fields
  cxSetResourceString(@sdxUnitPrice, 'Unit Price');
  cxSetResourceString(@sdxCarName, 'Car Name');
  cxSetResourceString(@sdxQuantity, 'Quantity');
  cxSetResourceString(@sdxPaymentAmount, 'Payment Amount');
  cxSetResourceString(@sdxPurchaseQuarter, 'Purchase Quarter');
  cxSetResourceString(@sdxPurchaseMonth, 'Purchase Month');
  cxSetResourceString(@sdxPaymentType  , 'Payment Type');
  cxSetResourceString(@sdxCompanyName  , 'Company Name');

end;

procedure SetResourcesExtCtrlsStrs;
begin
  cxSetResourceString(@sdxAutoColorText, 'Auto');
  cxSetResourceString(@sdxCustomColorText, 'Custom...');

  cxSetResourceString(@sdxSysColorScrollBar, 'ScrollBar');
  cxSetResourceString(@sdxSysColorBackground, 'Background');
  cxSetResourceString(@sdxSysColorActiveCaption, 'Active Caption');
  cxSetResourceString(@sdxSysColorInactiveCaption, 'Inactive Caption');
  cxSetResourceString(@sdxSysColorMenu, 'Menu');
  cxSetResourceString(@sdxSysColorWindow, 'Window');
  cxSetResourceString(@sdxSysColorWindowFrame, 'Window Frame');
  cxSetResourceString(@sdxSysColorMenuText, 'Menu Text');
  cxSetResourceString(@sdxSysColorWindowText, 'Window Text');
  cxSetResourceString(@sdxSysColorCaptionText, 'Caption Text');
  cxSetResourceString(@sdxSysColorActiveBorder, 'Active Border');
  cxSetResourceString(@sdxSysColorInactiveBorder, 'Inactive Border');
  cxSetResourceString(@sdxSysColorAppWorkSpace, 'App Workspace');
  cxSetResourceString(@sdxSysColorHighLight, 'Highlight');
  cxSetResourceString(@sdxSysColorHighLighText, 'Highlight Text');
  cxSetResourceString(@sdxSysColorBtnFace, 'Button Face');
  cxSetResourceString(@sdxSysColorBtnShadow, 'Button Shadow');
  cxSetResourceString(@sdxSysColorGrayText, 'Gray Text');
  cxSetResourceString(@sdxSysColorBtnText, 'Button Text');
  cxSetResourceString(@sdxSysColorInactiveCaptionText, 'Inactive Caption Text');
  cxSetResourceString(@sdxSysColorBtnHighligh, 'Button Highlight');
  cxSetResourceString(@sdxSysColor3DDkShadow, '3DDk Shadow');
  cxSetResourceString(@sdxSysColor3DLight, '3DLight');
  cxSetResourceString(@sdxSysColorInfoText, 'Info Text');
  cxSetResourceString(@sdxSysColorInfoBk, 'InfoBk');

  cxSetResourceString(@sdxPureColorBlack, 'Black');
  cxSetResourceString(@sdxPureColorRed, 'Red');
  cxSetResourceString(@sdxPureColorLime, 'Lime');
  cxSetResourceString(@sdxPureColorYellow, 'Yellow');
  cxSetResourceString(@sdxPureColorGreen, 'Green');
  cxSetResourceString(@sdxPureColorTeal, 'Teal');
  cxSetResourceString(@sdxPureColorAqua, 'Aqua');
  cxSetResourceString(@sdxPureColorBlue, 'Blue');
  cxSetResourceString(@sdxPureColorWhite, 'White');
  cxSetResourceString(@sdxPureColorOlive, 'Olive');
  cxSetResourceString(@sdxPureColorMoneyGreen, 'Money Green');
  cxSetResourceString(@sdxPureColorNavy, 'Navy');
  cxSetResourceString(@sdxPureColorSkyBlue, 'Sky Blue');
  cxSetResourceString(@sdxPureColorGray, 'Gray');
  cxSetResourceString(@sdxPureColorMedGray, 'Medium Gray');
  cxSetResourceString(@sdxPureColorSilver, 'Silver');
  cxSetResourceString(@sdxPureColorMaroon, 'Maroon');
  cxSetResourceString(@sdxPureColorPurple, 'Purple');
  cxSetResourceString(@sdxPureColorFuchsia, 'Fuchsia');
  cxSetResourceString(@sdxPureColorCream, 'Cream');

  cxSetResourceString(@sdxBrushStyleSolid, 'Solid');
  cxSetResourceString(@sdxBrushStyleClear, 'Clear');
  cxSetResourceString(@sdxBrushStyleHorizontal, 'Horizontal');
  cxSetResourceString(@sdxBrushStyleVertical, 'Vertical');
  cxSetResourceString(@sdxBrushStyleFDiagonal, 'FDiagonal');
  cxSetResourceString(@sdxBrushStyleBDiagonal, 'BDiagonal');
  cxSetResourceString(@sdxBrushStyleCross, 'Cross');
  cxSetResourceString(@sdxBrushStyleDiagCross, 'DiagCross');

end;

procedure SetResourcesFilterConsts;
begin
 // base operators
  cxSetResourceString(@cxSFilterOperatorEqual, 'igual');
  cxSetResourceString(@cxSFilterOperatorNotEqual, 'não é igual');
  cxSetResourceString(@cxSFilterOperatorLess, 'é menor do que');
  cxSetResourceString(@cxSFilterOperatorLessEqual, 'é menor ou igual a');
  cxSetResourceString(@cxSFilterOperatorGreater, 'é maior que');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual, 'é maior que ou igual a');
  cxSetResourceString(@cxSFilterOperatorLike, 'contém');
  cxSetResourceString(@cxSFilterOperatorNotLike, 'não contém');
  cxSetResourceString(@cxSFilterOperatorBetween, 'entre');
  cxSetResourceString(@cxSFilterOperatorNotBetween, 'não entre');
  cxSetResourceString(@cxSFilterOperatorInList, 'em');
  cxSetResourceString(@cxSFilterOperatorNotInList, 'não em');

  cxSetResourceString(@cxSFilterOperatorYesterday, 'ontem');
  cxSetResourceString(@cxSFilterOperatorToday, 'hoje');
  cxSetResourceString(@cxSFilterOperatorTomorrow, 'amanhã');

  cxSetResourceString(@cxSFilterOperatorLast7Days, 'últimos 7 dias');
  cxSetResourceString(@cxSFilterOperatorLastWeek, 'na semana passada');
  cxSetResourceString(@cxSFilterOperatorLast14Days, 'últimos 14 dias');
  cxSetResourceString(@cxSFilterOperatorLastTwoWeeks, 'últimas duas semanas');
  cxSetResourceString(@cxSFilterOperatorLast30Days, 'últimos 30 dias');
  cxSetResourceString(@cxSFilterOperatorLastMonth, 'no mês passado');
  cxSetResourceString(@cxSFilterOperatorLastYear, 'no ano passado');
  cxSetResourceString(@cxSFilterOperatorPast, 'passado');

  cxSetResourceString(@cxSFilterOperatorThisWeek, 'esta semana');
  cxSetResourceString(@cxSFilterOperatorThisMonth, 'este mês');
  cxSetResourceString(@cxSFilterOperatorThisYear, 'este ano');

  cxSetResourceString(@cxSFilterOperatorNext7Days, 'próximos 7 dias');
  cxSetResourceString(@cxSFilterOperatorNextWeek, 'próxima semana');
  cxSetResourceString(@cxSFilterOperatorNext14Days, 'próximos 14 dias');
  cxSetResourceString(@cxSFilterOperatorNextTwoWeeks, 'próximas duas semanas');
  cxSetResourceString(@cxSFilterOperatorNext30Days, 'próximos 30 dias');
  cxSetResourceString(@cxSFilterOperatorNextMonth, 'próximo mês');
  cxSetResourceString(@cxSFilterOperatorNextYear, 'próximo ano');
  cxSetResourceString(@cxSFilterOperatorFuture, 'futuro');

  cxSetResourceString(@cxSFilterAndCaption,  'e');
  cxSetResourceString(@cxSFilterOrCaption, 'ou');
  cxSetResourceString(@cxSFilterNotCaption, 'não');
  cxSetResourceString(@cxSFilterBlankCaption, 'em branco');

  // derived
  cxSetResourceString(@cxSFilterOperatorIsNull, 'está em branco');
  cxSetResourceString(@cxSFilterOperatorIsNotNull, 'não está em branco');
  cxSetResourceString(@cxSFilterOperatorBeginsWith, 'começa com');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith, 'não começa com');
  cxSetResourceString(@cxSFilterOperatorEndsWith, 'termina com');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith, 'não termina com');
  cxSetResourceString(@cxSFilterOperatorContains, 'contém');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain, 'does not contain');
  // filter listbox's values
  cxSetResourceString(@cxSFilterBoxAllCaption , '(Todos)');
  cxSetResourceString(@cxSFilterBoxCustomCaption , '(Custom...)');
  cxSetResourceString(@cxSFilterBoxBlanksCaption , '(Vazio)');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , '(NãoVazio)');
end;

initialization
  SetResorceGridStrs;
  SetResorceFilterControlStrs;
  SetResourcesPSRes;
  SetResourcesExtCtrlsStrs;
  SetResourcesFilterConsts;

end.

