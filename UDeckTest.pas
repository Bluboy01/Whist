unit UDeckTest;

interface
uses
UDeck, Ucard;

type
TDeckTest = class



public
class procedure UnitTest();
end;

implementation

class procedure TDeckTest.UnitTest();
var
testDeck: TDeck;
card:TCard;

begin
  testDeck:= TDeck.Create;
  writeln ('The pack is currently');
  testDeck.DeckPrint;
  readln;
  testDeck.ShuffleDeck;
  writeln ('deck has been shuffled');
  testDeck.DeckPrint;
  writeln('there are ', testDeck.GetCardsLeft, 'cards left - should be 52');
  readln;
  card:=testDeck.DealTopCard;
  Writeln('The top card is ', card.TCardToStr);
  card:=testDeck.DealTopCard;
  Writeln('The next top card is ', card.TCardToStr);
  writeln('there are ', testDeck.GetCardsLeft, 'cards left - should be 50');
  readln;
  card:=testDeck.RemoveRandomCard;
  Writeln('The random card is ', card.TCardToStr);
  writeln('there are ', testDeck.GetCardsLeft, 'cards left - should be 49');
  readln;
  writeln ('The pack is now');
  testDeck.DeckPrint;
  readln;
end;

end.