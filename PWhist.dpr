program PWhist;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SysUtils,
  Classes,
  UCard,
  UDeck,
  UDeckTest,
  UPlayerTest,
  UIWhist in 'UIWhist.pas' {Board};

//UPlayer,
  //UWhistgame,
  //Ugame;

const
    NUMBER_OF_PLAYERS: integer = 4;      //TODO - user enters number of players
    CARDS_PER_PLAYER: integer = 13;
    TEST_NUMBER: integer = 2; // zero is no test output

    //game: UWhistgame.TWhistGame;



begin
  case (TEST_NUMBER) of
  1:  TDeckTest.UnitTest();
  2:  TPlayerTest.UnitTest();
  end;


{

  game:= UWhistgame.TWhistGame.Create( NUMBER_OF_PLAYERS, CARDS_PER_PLAYER  ); //cards per player calculated from number
  game.play();

  writeln(sLineBreak + 'PLayer 0 hand is '+ game.AllHandsToStr(0));
  //writeln(sLineBreak + 'PLayer 0 spades is '+ game.PlayerSuitToStr(0,'spades'));
  //writeln(sLineBreak + 'PLayer 0 hearts is '+ game.PlayerSuitToStr(0,'hearts'));
  //writeln(sLineBreak + 'PLayer 0 diamonds is '+ game.PlayerSuitToStr(0,'diamonds'));
  //writeln(sLineBreak + 'PLayer 0 clubs is '+ game.PlayerSuitToStr(0,'clubs'));
  writeln(sLineBreak + 'PLayer 1 hand is '+ game.AllHandsToStr(1));
  writeln(sLineBreak + 'PLayer 2 hand is '+ game.AllHandsToStr(2));
  writeln(sLineBreak + 'PLayer 3 hand is '+ game.AllHandsToStr(3));
  readln;

 game.free;}
 end.


