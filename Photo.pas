unit Photo;

interface

//** Converted with Mida BASIC 275     http://www.midaconverter.com



uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IniFiles,
  Data.DB,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Menus,
  FMX.Grid,
  FMX.ExtCtrls,
  FMX.ListBox,
  FMX.TreeView,
  FMX.Memo,
  FMX.TabControl,
  FMX.Layouts,
  FMX.Edit,
  FMX.Platform,
  FMX.Bind.DBEngExt,
  FMX.Bind.Editors,
  FMX.Bind.DBLinks,
  FMX.Bind.Navigator,
  Data.Bind.EngExt,
  Data.Bind.Components,
  Data.Bind.DBScope,
  Data.Bind.DBLinks,
  Datasnap.DBClient,
  Fmx.Bind.Grid,
  System.Rtti,
  System.Bindings.Outputs,
  Data.Bind.Grid,
  Fmx.StdCtrls,
  FMX.Header,
  FMX.Graphics;

//**   Original VCL Uses section : 


//**   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
//**   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg;


type
  TFPhoto = class(TForm)
    Panel_Photo: TPanel;
    Image_Photo: TImage;
    procedure Image_PhotoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPhoto: TFPhoto;

implementation

{$R *.FMX}

procedure TFPhoto.FormCreate(Sender: TObject);
var
//  CatJPG: TJPEGImage;
  JPGStream: TResourceStream;
begin
//  CatJPG:= TJpegImage.Create;
  JPGStream:= TResourceStream.Create(hInstance, 'badcat', RT_RCDATA);
//  CatJPG.LoadfromStream(JPGStream);
//  Image_Photo.Bitmap.Assign(CatJPG);

  Image_Photo.Bitmap.LoadFromStream(JPGStream);
end;

procedure TFPhoto.Image_PhotoClick(Sender: TObject);
begin
  Close;
end;

end.
