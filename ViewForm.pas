unit ViewForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TfView = class(TForm)
    lvOutput: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fView: TfView;

implementation

{$R *.dfm}

end.
