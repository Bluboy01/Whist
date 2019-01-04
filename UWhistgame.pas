unit UWhistgame;


interface

uses
  Classes, SysUtils, UGame, UWhistStrategy, UCard;

type

   { WhistGame }

   TWhistGame = class(TGame)

private
   Fround: integer;



public
  constructor Create(AnumPlayers:integer; AcardsPerPlayer:integer);
  procedure Play();
  function GetRound():integer;
  end;

implementation
constructor TWhistGame.Create(AnumPlayers:integer; AcardsPerPlayer:integer);
  begin
   inherited;
  end;

procedure TWhistGame.Play();
var
  r, p, FplayerIndex :integer;
  playCard: Tcard;


begin
  DealAllCards();
  SortAllHandsBySuit();

  for r:= 1 to 13 do
  begin     //round loop
     Fround:=r;                    //getter and setter cant be used on a loop variable
     for p:= 0 to TGame(self).getNumPlayers  do   //player 0 starts
       begin                   //player loop per round
         FplayerIndex:= p;        //getter and setter cant be used on a loop variable
         playCard:= TWStrategy.SuggestCard(FplayerIndex);

       end
  end;

end;


function TWhistGame.GetRound(): integer;
begin
  result:=Fround
end;



end.

