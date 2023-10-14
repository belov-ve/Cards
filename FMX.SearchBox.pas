{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{    Copyright(c) 2014 Embarcadero Technologies, Inc.   }
{                                                       }
{*******************************************************}

unit FMX.SearchBox;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, FMX.Types, FMX.Edit, FMX.Controls, FMX.Controls.Model;

type

{ TSearchBox }

  TSearchBoxModel = class(TCustomEditModel)
  private
    [Weak] FSearchResponder: ISearchResponder;
  protected
    procedure DoChangeTracking; override;
  public
    property SearchResponder: ISearchResponder read FSearchResponder write FSearchResponder;
  end;

  TSearchBox = class(TEdit, IListBoxHeaderTrait)
  private
    function GetModel: TSearchBoxModel; overload;
  protected
    function DefinePresentationName: string; override;
    function DefineModelClass: TDataModelClass; override;
    procedure ParentChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    property Model: TSearchBoxModel read GetModel;
  end;

implementation

uses
  System.SysUtils, FMX.SearchBox.Style;

{ TSearchBox }

constructor TSearchBox.Create(AOwner: TComponent);
begin
  inherited;
  Align := TAlignLayout.Top;
end;

function TSearchBox.DefineModelClass: TDataModelClass;
begin
  Result := TSearchBoxModel;
end;

function TSearchBox.DefinePresentationName: string;
begin
  Result := 'SearchBox-' + GetPresentationSuffix;
end;

function TSearchBox.GetModel: TSearchBoxModel;
begin
  Result := GetModel<TSearchBoxModel>;
end;

procedure TSearchBox.ParentChanged;
var
  ParentObject: TFmxObject;
  SearchResponder: ISearchResponder;
begin
  inherited;
  ParentObject := Self.Parent;
  while (ParentObject <> nil) and not (Supports(ParentObject, ISearchResponder, SearchResponder)) do
    ParentObject := ParentObject.Parent;
  Model.SearchResponder := SearchResponder;
end;

{ TSearchBoxModel }

procedure TSearchBoxModel.DoChangeTracking;
var
  Lower: string;
begin
  inherited;
  Lower := Text.Trim.ToLower;
  if SearchResponder <> nil then
    SearchResponder.SetFilterPredicate(
      function (X: string): Boolean
      begin
        //Result := Lower.IsEmpty or LowerCase(X).Contains(Lower);
        Result := Lower.IsEmpty or X.ToLower.Contains(Lower)
      end);
end;

initialization
  RegisterFmxClasses([TSearchBox]);
end.

