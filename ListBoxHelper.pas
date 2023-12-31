unit ListBoxHelper;

interface

uses FMX.Controls, FMX.Types, System.SysUtils, FMX.ListBox, FMX.SearchBox;


// ������� Helper ��� ������ TListBox
type
  TListBoxHelper = class helper for TListBox
    //class var seachbox_helper: TSearchBox;
    function ResetFilter : string;                                // ���������� ������ ������
    function GetSearchBox : TSearchBox;                           // ���������� SearchBox
    function AddAndClearSelect(const S : string) : integer;       // ��������, ������ �� ��������, ������ ��������
    function AddAndSelect(const S : string) : integer;            // ��������, �������, ������ ��������
    function AddAndSaveOldSelect(const S : string) : integer;     // ��������, ��������� �����, ������ ��������
    function AddAndSaveOldView(const S : string) : integer;       // ��������, ��������� ����� � ������, ������� ����� ������������ � ��������������� ������, ��� -1 ���� �� �������� � ������
    procedure DeleteItem(const i : integer = -1);                 // ������� �� �������. ���� ������ �� ������ �� ������� ���������
    //procedure ReSort;
  end;
implementation


function TListBoxHelper.GetSearchBox : TSearchBox;
var
  Child     : TControl;
  FxmChild  : TFmxObject;
begin
  Result := nil;
  for Child in self.Controls do
    for FxmChild in Child.Controls do
      if FxmChild is TSearchBox then Exit( TSearchBox( FxmChild ) );
end;

function TListBoxHelper.ResetFilter : string;
var
  s   : TListBoxItem;
  sb  : TSearchBox;
begin
  Result := EmptyStr;
  s := Selected;
  sb := GetSearchBox;
  if Assigned( sb ) then
  begin
    Result  := sb.Text;
    sb.Text := EmptyStr;
  end;
  if Assigned( FilterPredicate ) then FilterPredicate := nil;
  if Assigned( s ) then ItemIndex := s.Index;
end;

function TListBoxHelper.AddAndClearSelect(const S : string) : integer;
begin
  ClearSelection;
  ResetFilter;
  Result := Items.Add( s );
end;

function TListBoxHelper.AddAndSelect(const S : string) : integer;
begin
  Result := AddAndClearSelect( s );
  if Result <> -1 then ItemIndex := Result;
end;

function TListBoxHelper.AddAndSaveOldSelect(const S : string) : integer;
var
  sel   : TListBoxItem;
begin
  sel := Selected;
  Result := AddAndClearSelect( s );
  if Assigned( sel ) then ItemIndex := sel.Index
end;

function TListBoxHelper.AddAndSaveOldView(const S : string) : integer;
var
  sb          : TSearchBox;
  iSel, iNew  : TListBoxItem;
  flt         : string;
begin
  iSel := Selected; iNew := nil;
  ClearSelection;
  sb := GetSearchBox;
  flt := ResetFilter;
  //
  Result := Items.Add( s );
  if Result <> -1 then iNew := ItemByIndex( Result );
  //
  if flt <> EmptyStr then
  begin
    sb.Text := flt;
    if Assigned(iNew) then Result := iNew.Index;
  end;
  if Assigned( iSel ) then ItemIndex := iSel.Index;
end;

procedure TListBoxHelper.DeleteItem(const i : integer = -1);
var
  sb          : TSearchBox;
  flt         : string;
  iSel, iDel  : TListBoxItem;
begin
  if i > Count-1 then Exit;
  sb := GetSearchBox;
  if i > -1 then
  begin
      iSel := Selected;
      iDel  := ItemByIndex( i );
  end
  else
  begin
      iSel  := nil;
      iDel := Selected;
  end;
  flt := ResetFilter;
  if Assigned( iDel ) then Items.Delete( iDel.Index );
  //
  if flt <> EmptyStr then sb.Text := flt;
  if Assigned( iSel ) then ItemIndex := iSel.Index;
end;

{
procedure TListBoxHelper.ReSort;
var i   : integer;
    sel : TListBoxItem;
begin
  // ��������� ��� ���������� ������
  sel := Selected;
  if Assigned(sel) then
  begin
    for i := 0 to Count-1 do ItemIndex := i;  //����� ������� ��� ������� ���������� ������
    ItemIndex := sel.Index;
  end;
end;
}

end.
