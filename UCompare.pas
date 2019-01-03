unit UCompare;

interface

uses
UCard;

function  CompareRanks(ACard,BCard:pointer): integer;

implementation
function  CompareRanks(ACard,BCard:pointer): integer;    //used by TList sort method
 begin
    result:= TCard(ACard).GetRank - Tcard(BCard).GetRank;             //+ve if A > B, -ve if B > A 0 if equal
 end;
end.
