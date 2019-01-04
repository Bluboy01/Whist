object Board: TBoard
  Left = 0
  Top = 0
  Caption = 'Board'
  ClientHeight = 482
  ClientWidth = 593
  Color = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object NextDeal: TButton
    Left = 112
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Next Deal'
    TabOrder = 0
    OnClick = NextDealClick
  end
end
