unit UPlayerTest;

interface

uses
UPlayer, Udeck, UCard;

type
TPlayerTest = class


public
class procedure UnitTest();
end;

implementation
class procedure TplayerTest.UnitTest();
var
  testPlayer:TPlayer;
  testDeck: TDeck;
  testCard, foo:Tcard;
  i:integer;
begin
  testDeck:= TDeck.Create();
  testPlayer:=TPlayer.Create();
  for i := 1 to 13 do
  begin
    testCard:=testDeck.removeTopCard;
    testplayer.AddCard(testCard);
  end;

writeln('Hand is ', testPlayer.HandToStr);


  //check if a   card is in the hand
  foo:= TCard.Create(4,Tsuit.Hearts);
  if testplayer.GetCardIndex(foo)>-1  then
     writeln(foo.TCardToStr, ' is in the hand')
  else
     writeln(foo.TCardToStr, ' is not in the hand');
  writeln(foo.TCardToStr , 'being removed - index number ',testPlayer.RemoveCard(foo));
  writeln('Hand is now', testPlayer.HandToStr);

  foo:= TCard.Create(5,Tsuit.Spades);
  if testplayer.GetCardIndex(foo) > -1 then
     writeln(foo.TCardToStr, ' is in the hand')
  else
     writeln(foo.TCardToStr, ' is not in the hand');


  writeln(foo.TCardToStr , 'being removed - index number ',testPlayer.RemoveCard(foo));
  writeln('Hand is now', sLineBreak + testPlayer.HandToStr);
    readln;



end;

end.
