object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'SynWebWordMarker demo'
  ClientHeight = 510
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    778
    510)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 489
    Width = 387
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 
      'Select word to highlight all occurrences . Simpliest way is to d' +
      'ouble-click on word.'
    ExplicitTop = 233
  end
  object Label3: TLabel
    Left = 638
    Top = 8
    Width = 132
    Height = 13
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'Markers config'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object syn: TSynEdit
    Left = 8
    Top = 8
    Width = 626
    Height = 475
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.ShowLineNumbers = True
    Lines.UnicodeStrings = 
      '{ TSynWebWordMarkerCustom }'#13#10#13#10'procedure TSynWebWordMarkerCustom' +
      '.AfterConstruction;'#13#10'begin'#13#10'  inherited AfterConstruction;'#13#10#13#10'  ' +
      'FMode := swwmSelectedWord;'#13#10'  FEnabled := True;'#13#10'end;'#13#10#13#10'functio' +
      'n TSynWebWordMarkerCustom.IsWordSelected: Boolean;'#13#10#13#10'  function' +
      ' IsSameBuffer(const A, B: TBufferCoord): Boolean;'#13#10'  begin'#13#10'    ' +
      'Result := (A.Line = B.Line) and (A.Char = B.Char);'#13#10'  end;'#13#10#13#10'be' +
      'gin'#13#10'  Result := Editor.SelAvail and IsSameBuffer(Editor.BlockBe' +
      'gin, Editor.WordStart) and'#13#10'    IsSameBuffer(Editor.BlockEnd, Ed' +
      'itor.WordEnd);'#13#10'end;'#13#10#13#10'function TSynWebWordMarkerCustom.IsOverl' +
      'apSelection(const ABufferStart, ABufferEnd: TBufferCoord): Boole' +
      'an;'#13#10'var'#13#10'  lBegin, lEnd: TBufferCoord;'#13#10'begin'#13#10'  Result := Fals' +
      'e;'#13#10'  if not Editor.SelAvail then'#13#10'    Exit;'#13#10#13#10'  Result := True' +
      ';'#13#10'  if Editor.IsPointInSelection(ABufferStart) then'#13#10'    Exit;'#13 +
      #10#13#10'  lBegin := Editor.BlockBegin;'#13#10'  lEnd := Editor.BlockEnd;'#13#10#13 +
      #10'  if (lBegin.Line = lEnd.Line) and (lBegin.Line = ABufferStart.' +
      'Line) and'#13#10'    (lBegin.Char >= ABufferStart.Char) and (lEnd.Char' +
      ' <= ABufferEnd.Char)'#13#10'  then'#13#10'    Exit;'#13#10#13#10'  if Editor.IsPointIn' +
      'Selection(ABufferEnd) then'#13#10'    Exit;'#13#10#13#10'  Result := False;'#13#10'end' +
      ';'#13#10#13#10'function TSynWebWordMarkerCustom.GetHighlightText: TSynWebS' +
      'tring;'#13#10'begin'#13#10'  case FMode of'#13#10'  swwmSelectedWord, swwmSelected' +
      'Text:'#13#10'    Result := Editor.SelText;'#13#10#13#10'  swwmCustomWord, swwmCu' +
      'stomText:'#13#10'    Result := FCustomText;'#13#10'  else'#13#10'    Result := '#39#39';' +
      #13#10'  end;'#13#10'end;'#13#10#13#10'procedure TSynWebWordMarkerCustom.SetEnabled(c' +
      'onst Value: Boolean);'#13#10'begin'#13#10'  if Value = FEnabled then'#13#10'    Ex' +
      'it;'#13#10#13#10'  FEnabled := Value;'#13#10'  Editor.Invalidate;'#13#10'end;'#13#10'       ' +
      '     '#13#10'procedure TSynWebWordMarkerCustom.SetMode(const Value: TS' +
      'ynWebWordMarkerMode);'#13#10'begin'#13#10'  if FMode = Value then'#13#10'    Exit;' +
      #13#10#13#10'  FMode := Value;'#13#10'  DoInvalidate;'#13#10'end;'#13#10#13#10'procedure TSynWe' +
      'bWordMarkerCustom.SetCustomText(const Value: TSynWebString);'#13#10'be' +
      'gin'#13#10'  if FCustomText = Value then'#13#10'    Exit;'#13#10#13#10'  FCustomText :' +
      '= Value;'#13#10'  DoInvalidate;'#13#10'end;'#13#10#13#10'procedure TSynWebWordMarkerCu' +
      'stom.SetCaseSensitive(const Value: Boolean);'#13#10'begin'#13#10'  if FCaseS' +
      'ensitive = Value then'#13#10'    Exit;'#13#10#13#10'  FCaseSensitive := Value;'#13#10 +
      '  DoInvalidate;'#13#10'end;'#13#10#13#10'procedure TSynWebWordMarkerCustom.DoInv' +
      'alidate;'#13#10'begin'#13#10'  if Enabled then'#13#10'    Editor.Invalidate;'#13#10'end;' +
      #13#10#13#10'procedure TSynWebWordMarkerCustom.LinesInserted(FirstLine, C' +
      'ount: Integer);'#13#10'begin'#13#10'  // nothing'#13#10'end;'#13#10#13#10'procedure TSynWebW' +
      'ordMarkerCustom.LinesDeleted(FirstLine, Count: Integer);'#13#10'begin'#13 +
      #10'  // nothing'#13#10'end;'#13#10#13#10'procedure TSynWebWordMarkerCustom.AfterPa' +
      'int(ACanvas: TCanvas; const AClip: TRect;'#13#10'  FirstLine, LastLine' +
      ': Integer);'#13#10'var'#13#10'  lDisplay: TDisplayCoord;'#13#10'  lBufferStart, lB' +
      'ufferEnd: TBufferCoord;      '#13#10#13#10'  lLineRow: Integer;'#13#10'  lPrevLi' +
      'ne: Integer;'#13#10#13#10'  lLineText, lLineTextLower: TSynWebString;'#13#10'  l' +
      'Text: TSynWebString;'#13#10'  lPos: Integer;'#13#10#13#10'  lRect: TRect;'#13#10'  lRe' +
      'ctClip: TRect;'#13#10'  lMarginLeft: Integer;'#13#10#13#10'  function IsSameDisp' +
      'lay(const A, B: TDisplayCoord): Boolean;'#13#10'  begin'#13#10'    Result :=' +
      ' (A.Row = B.Row) and (A.Column = B.Column);'#13#10'  end;'#13#10#13#10'  functio' +
      'n DoLowerStr(const AStr: TSynWebString): TSynWebString;'#13#10'  begin' +
      #13#10'    {$IFDEF UNISYNEDIT}'#13#10'    Result := SynUnicode.SynWideLower' +
      'Case(AStr);'#13#10'    {$ELSE}'#13#10'    Result := LowerCase(AStr);'#13#10'    {$' +
      'ENDIF}'#13#10'  end;'#13#10#13#10'  function DoIntersectRect(var ARect: TRect; c' +
      'onst AClip: TRect): Boolean;'#13#10'  var'#13#10'    lClipH: HRGN;'#13#10'  begin'#13 +
      #10'    Result := IntersectRect(ARect, ARect, AClip);'#13#10'    if not R' +
      'esult then'#13#10'      Exit;'#13#10#13#10'    lClipH := CreateRectRgn(ARect.Lef' +
      't, ARect.Top, ARect.Right, ARect.Bottom);'#13#10'    if lClipH <> 0 th' +
      'en'#13#10'    begin'#13#10'      SelectClipRgn(ACanvas.Handle, lClipH);'#13#10'   ' +
      '   DeleteObject(lClipH);'#13#10'    end;'#13#10'  end;'#13#10#13#10'begin'#13#10'  if not En' +
      'abled then'#13#10'    Exit;'#13#10#13#10'  case FMode of'#13#10'  swwmSelectedWord:'#13#10' ' +
      '   if not IsWordSelected then'#13#10'      Exit;'#13#10#13#10'  swwmSelectedText' +
      ':'#13#10'    if not Editor.SelAvail or (Editor.BlockBegin.Line <> Edit' +
      'or.BlockEnd.Line) then'#13#10'      Exit;'#13#10#13#10'  swwmCustomWord, swwmCus' +
      'tomText:'#13#10'    if FCustomText = '#39#39' then'#13#10'      Exit;'#13#10'  end;'#13#10#13#10' ' +
      ' lText := GetHighlightText;'#13#10'  if lText = '#39#39' then'#13#10'    Exit;'#13#10#13#10 +
      '  if not FCaseSensitive then'#13#10'    lText := DoLowerStr(lText);'#13#10#13 +
      #10'  lPrevLine := -1;'#13#10'  lLineText := '#39#39';'#13#10'  lLineTextLower := '#39#39';' +
      #13#10#13#10'  lDisplay.Column := 1;'#13#10'  lDisplay.Row := FirstLine;'#13#10#13#10'  i' +
      'f Editor.Gutter.Visible then'#13#10'    lMarginLeft := Editor.Gutter.R' +
      'ealGutterWidth(8) - 2'#13#10'  else'#13#10'    lMarginLeft := 2;'#13#10#13#10'  for lL' +
      'ineRow := FirstLine to LastLine do'#13#10'  begin'#13#10'    lDisplay.Column' +
      ' := 1;'#13#10'    lDisplay.Row := lLineRow;'#13#10#13#10'    lBufferStart := Edi' +
      'tor.DisplayToBufferPos(lDisplay);'#13#10'    if lPrevLine = lBufferSta' +
      'rt.Line then'#13#10'      Continue;'#13#10#13#10'    lPrevLine := lBufferStart.L' +
      'ine;'#13#10'    lLineText := Editor.Lines[lPrevLine - 1];'#13#10'    if not ' +
      'FCaseSensitive then'#13#10'      lLineTextLower := DoLowerStr(lLineTex' +
      't);'#13#10#13#10'    if FCaseSensitive then'#13#10'      lPos := Pos(lText, lLin' +
      'eText)'#13#10'    else'#13#10'      lPos := Pos(lText, lLineTextLower);'#13#10'   ' +
      ' while lPos > 0 do'#13#10'    begin'#13#10'      if not (FMode in [swwmSelec' +
      'tedWord, swwmCustomWord]) or ('#13#10'        ((lPos = 1) or Editor.Is' +
      'WordBreakChar(lLineText[lPos - 1])) and'#13#10'        ((lPos - 1 + Le' +
      'ngth(lText) = Length(lLineText)) or Editor.IsWordBreakChar(lLine' +
      'Text[lPos + Length(lText)]))'#13#10'      ) then'#13#10'      begin'#13#10'       ' +
      ' lBufferStart.Char := lPos;'#13#10'        lBufferEnd.Line := lBufferS' +
      'tart.Line;'#13#10'        lBufferEnd.Char := lBufferStart.Char + Lengt' +
      'h(lText);'#13#10#13#10'        lDisplay := Editor.BufferToDisplayPos(lBuff' +
      'erStart);'#13#10#13#10'        lRect.TopLeft := Editor.RowColumnToPixels(l' +
      'Display);'#13#10'        lRect.Right := lRect.Left + (Editor.CharWidth' +
      ' * Length(lText));'#13#10'        lRect.Bottom := lRect.Top + Editor.L' +
      'ineHeight;'#13#10#13#10'        lRectClip := lRect;'#13#10#13#10'        if lRectCli' +
      'p.Left < lMarginLeft then'#13#10'          lRectClip.Left := lMarginLe' +
      'ft;'#13#10#13#10'        if DoIntersectRect(lRectClip, AClip) then'#13#10'      ' +
      '    if FCaseSensitive then          '#13#10'            DoPaintMarker(' +
      'ACanvas, lRect, lText, lBufferStart, lBufferEnd)'#13#10'          else' +
      #13#10'            DoPaintMarker(ACanvas, lRect, Copy(lLineText, lPos' +
      ', Length(lText)), lBufferStart, lBufferEnd);'#13#10'      end;'#13#10#13#10'    ' +
      '  if FCaseSensitive then'#13#10'        lPos := PosEx(lText, lLineText' +
      ', lPos + Length(lText))'#13#10'      else'#13#10'        lPos := PosEx(lText' +
      ', lLineTextLower, lPos + Length(lText));'#13#10'    end;'#13#10'  end;     '#13 +
      #10#13#10'  // Clear clip region for canvas'#13#10'  SelectClipRgn(ACanvas.Ha' +
      'ndle, 0);'#13#10'end;'#13#10#13#10'procedure TSynWebWordMarkerCustom.NotifySelCh' +
      'anged;'#13#10'var'#13#10'  lIsWordSelected: Boolean;'#13#10'  lIsMultiLineSelectio' +
      'n: Boolean;'#13#10'begin'#13#10'  lIsMultiLineSelection := Editor.BlockBegin' +
      '.Line <> Editor.BlockEnd.Line;'#13#10#13#10'  if not lIsMultiLineSelection' +
      ' or not FIsMultiLineSelection then'#13#10'    case FMode of'#13#10'    swwmS' +
      'electedWord:'#13#10'      begin'#13#10'        lIsWordSelected := IsWordSele' +
      'cted;'#13#10#13#10'        if lIsWordSelected = FIsWordSelected then'#13#10'    ' +
      '      Exit;'#13#10#13#10'        FIsWordSelected := lIsWordSelected;'#13#10'    ' +
      '    DoInvalidate;'#13#10'      end;'#13#10#13#10'    swwmSelectedText:'#13#10'      Do' +
      'Invalidate;'#13#10'    end;'#13#10#13#10'  FIsMultiLineSelection := lIsMultiLine' +
      'Selection;'#13#10'end;'#13#10#13#10'{ TSynWebWordMarker }'#13#10#13#10'procedure TSynWebWo' +
      'rdMarker.AfterConstruction;'#13#10'begin'#13#10'  inherited AfterConstructio' +
      'n;'#13#10#13#10'  FBGColor := clYellow;'#13#10'  FFGColor := clBlack;'#13#10'  FPaintM' +
      'ode := swwpFillRect;'#13#10'end;'#13#10#13#10'procedure TSynWebWordMarker.SetBGC' +
      'olor(const Value: TColor);'#13#10'begin'#13#10'  if FBGColor = Value then'#13#10' ' +
      '   Exit;'#13#10#13#10'  FBGColor := Value;'#13#10'  DoInvalidate;'#13#10'end;'#13#10#13#10'proce' +
      'dure TSynWebWordMarker.SetFGColor(const Value: TColor);'#13#10'begin'#13#10 +
      '  if FFGColor = Value then'#13#10'    Exit;'#13#10#13#10'  FFGColor := Value;'#13#10' ' +
      ' DoInvalidate;'#13#10'end;'#13#10#13#10'procedure TSynWebWordMarker.SetPaintMode' +
      '(const Value: TSynWebWordMarkerPaintMode);'#13#10'begin'#13#10'  if FPaintMo' +
      'de = Value then'#13#10'    Exit;'#13#10#13#10'  FPaintMode := Value;'#13#10'  DoInvali' +
      'date;'#13#10'end;'#13#10#13#10'procedure TSynWebWordMarker.DoPaintMarker(ACanvas' +
      ': TCanvas; const ARect: TRect;'#13#10'  const AText: TSynWebString; co' +
      'nst ABufferStart, ABufferEnd: TBufferCoord);'#13#10#13#10'  function DoGet' +
      'PaintMode: TSynWebWordMarkerPaintMode;'#13#10'  begin'#13#10'    case FPaint' +
      'Mode of'#13#10'    swwpFillRect:'#13#10'      if IsOverlapSelection(ABufferS' +
      'tart, ABufferEnd) then'#13#10'        Result := swwpFrameRect'#13#10'      e' +
      'lse'#13#10'        Result := swwpFillRect;'#13#10'    else'#13#10'      Result := ' +
      'FPaintMode;'#13#10'    end;'#13#10'  end;'#13#10#13#10'var'#13#10'  lRect: TRect;'#13#10'begin'#13#10'  ' +
      'ACanvas.Brush.Color := FBGColor;'#13#10#13#10'  case DoGetPaintMode of'#13#10'  ' +
      'swwpFillRect:'#13#10'    begin'#13#10'      ACanvas.Font.Color := FFGColor; ' +
      ' // DisplayToBufferPos overwrites Canvas.Font, so it must be set' +
      ' here'#13#10'      ACanvas.TextRect(ARect, ARect.Left, ARect.Top, ATex' +
      't)'#13#10'    end;'#13#10#13#10'  swwpFrameRect:'#13#10'    ACanvas.FrameRect(ARect);'#13 +
      #10#13#10'  swwpUnderline:'#13#10'    begin'#13#10'      lRect := ARect;'#13#10'      lRe' +
      'ct.Top := lRect.Bottom - 2;'#13#10'      ACanvas.FillRect(lRect);'#13#10'   ' +
      ' end;'#13#10'  end;'#13#10'end;'
    Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabIndent]
    WantTabs = True
    OnStatusChange = synStatusChange
  end
  object chkWordWrap: TCheckBox
    Left = 640
    Top = 466
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Word wrap'
    TabOrder = 1
    OnClick = chkWordWrapClick
  end
  object chkGutter: TCheckBox
    Left = 640
    Top = 443
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Gutter'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = chkGutterClick
  end
  object gbConfig: TGroupBox
    Left = 640
    Top = 40
    Width = 137
    Height = 209
    Anchors = [akTop, akRight]
    TabOrder = 3
    DesignSize = (
      137
      209)
    object lblCustomText: TLabel
      Left = 22
      Top = 153
      Width = 59
      Height = 13
      Caption = 'Custom text'
    end
    object edtCustomText: TEdit
      Left = 17
      Top = 172
      Width = 104
      Height = 21
      TabOrder = 0
      OnChange = edtCustomTextChange
    end
    object cbBGColor: TColorBox
      Left = 17
      Top = 47
      Width = 104
      Height = 22
      Hint = 'Background color'
      ItemHeight = 16
      TabOrder = 1
      OnChange = cbBGColorChange
    end
    object chkWordMarker: TCheckBox
      Left = 19
      Top = 24
      Width = 97
      Height = 17
      Hint = 'Marker painting enabled'
      Caption = 'Enabled'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = chkWordMarkerClick
    end
    object cbFGColor: TColorBox
      Left = 17
      Top = 75
      Width = 104
      Height = 22
      Hint = 'Foreground color'
      ItemHeight = 16
      TabOrder = 3
      OnChange = cbFGColorChange
    end
    object chkCaseSensitive: TCheckBox
      Left = 19
      Top = 130
      Width = 97
      Height = 17
      Caption = 'Case sensitive'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = chkCaseSensitiveClick
    end
    object cbPaintMode: TComboBox
      Left = 17
      Top = 103
      Width = 104
      Height = 21
      Hint = 'Marker paint mode'
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 5
      OnChange = cbPaintModeChange
      Items.Strings = (
        'FillRect'
        'FrameRect'
        'Underline')
    end
  end
  object cbMode: TComboBox
    Left = 652
    Top = 32
    Width = 109
    Height = 21
    Hint = 'Marker type'
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = 'Selected text'
    OnChange = cbModeChange
    Items.Strings = (
      'Selected text'
      'Selected word'
      'Custom text'
      'Custom word')
  end
end
