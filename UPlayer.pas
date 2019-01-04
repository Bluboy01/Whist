unit UPlayer;

interface

uses Classes, SysUtils, Udeck, UCard, System.Generics.Collections, System.Generics.Defaults;


type TPLayer = class
type TCardList = TObjectlist<TCard>;
type TListSortCompare = function (Item1, Item2: Pointer): Integer;



private
    FcardsInHand : TCardList;            //dynamic array to hold all cards in hand
    FsuitListArray: Array [0..3] of TCardList;    //each list holds a suit, tracks FcardsInhand
    class function  CompareRanks(ACard,BCard:pointer): integer;
    procedure UpdateSuitLists();

public
    constructor Create();
    function  GetHand() : TCardList;
    function  HandToStr():string;
    function  numCards(): integer;
    procedure AddCard(Acard:TCard);
    function  RemoveCard(Acard:TCard): Boolean;
    function  GetCardIndex(Acard:TCard): integer;   //returns index number of card (-1 of not present)
    procedure SortSuits();
    procedure PrintSuitLists();


end;

implementation

constructor TPLayer.Create();        (* Creates a hand with no cards in it *)
  var
  suitIndex: integer;
  begin
    FcardsInHand:= TcardList.create();
    for suitIndex:= 0 to 3 do FsuitListArray[suitIndex]:= TCardList.Create();    //construct the suit lists
  end;

class function  TPlayer.CompareRanks(ACard,BCard:pointer): integer;    //used by TList sort method
 begin
    result:= TCard(ACard).GetRank - Tcard(BCard).GetRank;             //+ve if A > B, -ve if B > A 0 if equal
 end;

function TPLayer.GetHand(): TCardList;
  begin
    result:= FcardsInHand;
  end;

function  Tplayer.HandToStr():string;
  var
  i:integer;
  begin
    result:='';
    for i := 0 to numCards()-1 do
    begin
       result:= result + FcardsInHand[i].TCardToStr() + sLineBreak;
    end;
  end;

function TPLayer.numCards(): integer;
  begin
      result := FcardsInHand.Count;
  end;


procedure TPLayer.AddCard(Acard:TCard);
  begin
    FcardsInHand.Add(Acard);
  end;


 function TPLayer.RemoveCard(Acard:TCard): Boolean;    //TODO : Add Try to catch removing non-existent card

   begin
     if GetCardIndex(Acard)> -1 then
       begin
        FcardsInHand.delete(GetCardIndex(Acard));
        result:=true;
       end                                      //return true if card removedend;
     else
        result:= false;                         // or return error if card not found
   end;




 function TPLayer.GetCardIndex(Acard:TCard): integer;     //can't use Tlist<>.contains as does binary compare
  var                                                     //returnes index number if present, otherwise -1
  i:integer;
  begin
     result:= -1;
     for i := 0 to numCards()-1 do
     begin
        if ((FcardsInHand[i].GetSuit=ACard.GetSuit())
            and (FcardsInHand[i].GetRank=ACard.GetRank())) then
            result:=i;
     end;
  end;



 procedure TPlayer.UpdateSuitLists() ;                  //TODO write sort hand procedure
 var
 handIndex,suitIndex: integer;
 FsuitListArray: Array [0..3] of TCardList;    //each list holds a suit
 begin
     for handIndex := 0 to numCards()-1 do               //loop through the whole hand
       begin
          for suitIndex:=  0  to 3 do                    // checking each suit
            if (FcardsInHand[handIndex].GetSuit()= Tsuit(suitIndex))then
                  FsuitListArray[suitIndex].Add(FcardsInHand[handIndex]);      //add adding cards to correct suitList
       end;                                                   // sort each suit list and recombine
end;

procedure TPlayer.PrintSuitLists();
 var
  cardIndex,suitIndex: integer;
 begin
       begin
          for suitIndex:=  0  to 3 do                    // checking each suit
            begin
              for cardIndex := 0 to FsuitListArray[suitIndex].count-1 do
                   writeln(FsuitListArray[suitIndex].items[cardIndex].TcardToStr);
            end;
       end;
end;

procedure Tplayer.SortSuits();
var
suitIndex:integer;
begin
  for suitIndex:= 0  to 3 do
  begin
     FsuitListArray[suitIndex].sort(                          //sort on rank using a comparer function
     TComparer<TCard>.Construct(
      function(const ACard,BCard: TCard): Integer
      begin
        Result := ACard.GetRank - BCard.GetRank;
      end
     ) )
  end;
end;

end.







