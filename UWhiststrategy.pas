unit UWhiststrategy;


interface
uses
  Classes, SysUtils,UPlayer, UCard;

type

  { TWStrategy }

  TWhistStrategy = class abstract public



public
class function SuggestCard(AplayerIndex:integer):UCard.TCard;

end;

implementation



{ TWStrategy }

class function TWhistStrategy.SuggestCard(AplayerIndex: integer): Ucard.TCard;
begin
   result:= nil;
end;

end.

