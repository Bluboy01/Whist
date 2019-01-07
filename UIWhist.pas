unit UIWhist;

interface

uses
  UGame, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,Generics.Collections, UGame, Ucard, UDeck, UPlayer;



type

  TBoard = class(TForm)

   NextDeal: TButton;
  type TCardList = TObjectList<TCard>;
  const
   NORTHX = 100;
   NORTHY = 200;
   EASTX = 200;
   EASTY = 100;
   SOUTHX = 100;
   SOUTHY = 10;
   WESTX = 10;
   WESTY = 100;
   SPACING = 20;  //increment bewtween cards on screen - controls overlap



    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FGame: TGame;
    North, South, East, West: TPlayer;
    CardImages:TList<TImage>;
    procedure DrawCard(Card: TCard; x,y: integer);
    procedure NextDealClick(Sender: TObject);



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



procedure TBoard.NextDealClick(Sender: TObject);
var
player, cardIndex, xPos, yPos: integer;
position: TPosition;

begin
  FGame:= TGame.Create(4,13);
  for player := 0 to 3 do
    case player of                       //get appropriate xy co-ordinates
    0: begin                              // for each player's hand
        xPos:= NORTHX;
        yPos:= NORTHY;
       end;
    1: begin
        xPos:= EASTX ;
        yPos:= EASTY ;
       end;
    2: begin
        xPos:= SOUTHX;
        yPos:= SOUTHY;
       end;
    3: begin
        xPos:= WESTX;
        yPos:= WESTY;
       end;
    end;

  //show all players cards on screen
  for player in TPosition do

  for cardIndex := 0 to FGame.getPlayerCardsInHand(player)-1 do
    begin
      Drawcard (FGame.getPlayerCard(player, cardIndex),xPos+cardindex*SPACING, yPos);  //show card on screen
    end;

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
