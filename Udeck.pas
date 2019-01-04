unit Udeck;

interface

uses  CLasses, SysUtils, Ucard, System.Generics.Collections ;

Type TDeck = class
type TCardList = TObjectList<TCard>;


var
  private
    Fdeck : TCardList;    // The cards in the hand
    Fcardsleft: integer;
    FTopCardIndex: integer;

  public
    constructor Create();
    procedure ShuffleDeck();
    function DealTopCard():TCard;
    procedure DeckPrint();
    function GetCardsLeft():integer;
    function RemoveRandomCard(): TCard;  //returns a random card from the deck
    function DeckToStr():string;
end;

implementation

  (* Creates a deck with with one of each possible card *)
constructor TDeck.Create();
  var
    deckIndex,rank: integer;
    currentCard: TCard;
    suitNum: integer;

  begin
    deckIndex:= 0;
     FDeck:=TCardList.create();
     FDeck.Capacity:= 52;
    For suitNum:= 0 to 3 Do
    begin
      For rank:=1 to 13  Do
        begin
          currentCard:=TCard.Create(rank,TSuit(suitNum));     //create the next  TCard
          Fdeck.Add(currentCard);                       //add it to the array of cards
          deckIndex:=deckIndex+1;
       end;
    end;
  Fcardsleft:=52;
  FTopCardIndex:=0
  end;


                                              //full pack
procedure TDeck.ShuffleDeck();
    var
    shuffledDeck: TCardList;
    nextCard, card:TCard;
    i: integer;
    begin
      randomize;
      for i := 0 to Fdeck.Count-1 do
          FDeck.Exchange(i,random(FDeck.Count));
    end;

  function TDeck.DealTopCard():  TCard;
    begin
      result:=FDeck.items[FTopCardIndex];
      Dec(Fcardsleft);
      Inc(FTopCardIndex);
    end;

  procedure TDeck.DeckPrint();
    var
    cardNumber: integer;
    begin
    For CardNumber:=0 to FCardsLeft-1 do
        begin
          writeln( FDeck.items[cardNumber].TCardToStr);
        end;

    end;

  function TDeck.DeckToStr():string;
    var
    cardNumber: integer;
    begin
    result:='';
    For CardNumber:=0 to FCardsLeft-1 do
        begin
          result:= result + FDeck.items[cardNumber].TCardToStr;
        end;

    end;

  function TDeck.GetCardsLeft(): integer;
    begin
      result:= Fcardsleft;
    end;

  function TDeck.RemoveRandomCard(): UCard.TCard;
  var
  randomNum: integer;
        begin
         randomize;
         randomNum:= trunc(random(Fcardsleft));         //move random cards into a new deck
         result:=  Fdeck.items[randomNum];
         FDeck.Remove(result);
         Dec(Fcardsleft);
        end;

end.






