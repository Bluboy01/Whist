unit UIWhist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,Generics.Collections, UGame, Ucard, UDeck, UPlayer;



type

  TBoard = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    North, South, East, West: TPlayer;
    CardImages:TList<TImage>;
    procedure DrawCard(Card: TCard; x,y: integer);



  public
    procedure UpdateUI;
  end;

var
  CardGameForm: TBoard;

implementation

{$R *.dfm}
{$R CardImages.res}   //resource file containing card images



procedure TBoard.UpdateUI();
begin

end;

procedure TBoard.DrawCard(Card: TCard; x,y: integer);
//draws Card at (x,y)
var
  ResName: string;
  NewImage:TImage;
begin
  NewImage:=TImage.Create(Self);  //create image with form as owner
  CardImages.Add(NewImage); //add to list
  with NewImage do
  begin
    visible := false;  //make it invisible until we have positioned it and loaded the bitmap
    parent := self;  //set form as parent, responsible for displaying it
    top := y;    //set y co-ordinate, relative to origin of parent
    left := x;   //set x co-ordinate

    ResName := Card.TSuitToStr[1] +
      Card.RankToStr; //assign resource name based on suit and rank

    picture.Bitmap.LoadFromResourceName(HInstance, ResName);
    //load bitmap from resource

    visible := true;
  end;
end;


procedure TBoard.FormCreate(Sender: TObject);
//create list of images
begin
    CardImages:=TList<TImage>.Create;
end;

procedure TBoard.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:integer;
begin

  if CardImages.Count > 0  then
    for i := 0 to CardImages.Count-1 do
  CardImages.Free;
end;



end.
