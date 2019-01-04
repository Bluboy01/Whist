unit Ucard;
{$APPTYPE CONSOLE}


interface

uses Classes,  TypInfo, SysUtils;


Type
  TSuit = (Spades, Hearts, Diamonds, Clubs );
  { TCard }

TCard=class(TObject)
var
private
    Frank: integer;
    Fsuit: TSuit;
public
    constructor Create(Arank:integer;Asuit:Tsuit);
    function GetSuit() : TSuit;
    function GetRank() : integer;
    procedure SetSuit(Asuit:TSuit);
    procedure SetRank(Arank:integer);
    function TCardToStr():string;
    function TSuitToStr(): string;
    function RankToStr(): string;
end;

implementation

    constructor TCard.Create(Arank:integer;Asuit:TSuit);
    begin
      Fsuit:=Asuit;
      Frank:=Arank;
    end;

    function TCard.GetSuit(): Tsuit;
    begin
      result:=Fsuit;
    end;


    procedure TCard.SetRank(Arank:integer) ;
    begin
      Frank:=Arank;
    end;

    procedure TCard.SetSuit(Asuit: Tsuit) ;
    begin
      Fsuit:=Asuit;
    end;


    function TCard.GetRank(): integer;
    begin
      result:=Frank;
    end;

    function TCard.TCardToStr(): string;
    var
      rankStr:string;
      suitNum: integer;
    begin
      result:= rankToStr() + ' of '+ TSuitToStr();
    end;

function TCard.RankToStr(): string;
    var
      rankStr:string;
    begin
       Case Frank of
         0: rankStr:= '';           //0 is a Blank card
         1: rankStr:= 'Ace';
         2: rankStr:= 'Two';
         3: rankStr:= 'Three';
         4: rankStr:= 'Four';
         5: rankStr:= 'Five';
         6: rankStr:= 'Six';
         7: rankStr:= 'Seven';
         8: rankStr:= 'Eight';
         9: rankStr:= 'Nine';
        10: rankStr:= 'Ten';
        11: rankStr:= 'Jack';
        12: rankStr:= 'Queen';
        13: rankStr:= 'King';
       end;

      result:= rankStr ;
    end;

    function TCard.TSuitToStr(): string;
    var
      rankStr:string;
      suitNum: integer;
    begin
      case FSuit of
        Spades: suitNum:=0;
        Hearts: suitNum:=1;
        Diamonds: suitNum:=2;
        Clubs: suitNum:=3;
      end;
      result:= GetEnumName(TypeInfo(TSuit),suitNum);
    end;

end.

