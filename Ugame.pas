unit Ugame;


interface

uses
  Classes, SysUtils, UDeck, UPlayer;

type

   { TGame }

   TGame = class   abstract

private
   var
   FgameDeck: TDeck;
   FplayerArray: array of TPLayer;
   FnumPlayers: integer;
   FhandSize: integer;

  public
    constructor Create(AnumPlayers:integer; AcardsPerPlayer:integer);
    procedure SortAllHandsBySuit();          //sorts cards for all players
    function PlayerHandToStr(playerNumber:integer):string;
    function DeckToStr(): string;
    procedure DealAllCards();
    function getNumPlayers():integer;

  end;

implementation
constructor TGame.Create(AnumPlayers:integer; AcardsPerPlayer:integer);
var
  playerIndex:integer;

begin
  FhandSize:= AcardsPerPlayer;
  FnumPlayers:=  AnumPlayers;
  SetLength(FplayerArray, AnumPlayers);
  FgameDeck:=TDeck.Create();
  FgameDeck.ShuffleDeck();
  //Create the TPlayer objects
  for playerIndex:= 0 to FnumPlayers-1 do
    FplayerArray[playerIndex]:= TPlayer.create();
 end;

procedure TGame.SortAllHandsBySuit();
var
  i: integer;

begin
   for i:= 0 to FnumPlayers-1 do
     begin
         TPlayer(FplayerArray[i]).SortSuits();

     end;
end;

procedure TGame.DealAllCards();
var
  cardsDealtPerHand:integer;
  playerIndex:integer;
begin

     for cardsDealtPerHand:= 0 to FhandSize-1 do
        begin
           for playerIndex:=0 to FnumPlayers-1 do
           begin
             TPlayer(FplayerArray[playerIndex]).AddCard(FgameDeck.DealTopCard());
           end;
        end;
end;


function TGame.getNumPlayers(): integer;
begin
  result:=FnumPlayers;
end;

function TGame.PlayerHandToStr(playerNumber:integer):string;
  begin
    result:= Tplayer(FplayerArray[playerNumber]).HandToStr();
  end;



function TGame.DeckToStr(): string;
begin
    if FgameDeck.GetCardsLeft() <> 0 then
      result:= FgameDeck.DeckToStr
    else
      result:= 'deck is empty';
end;


end.

