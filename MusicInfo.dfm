object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MusicInfo'
  ClientHeight = 379
  ClientWidth = 501
  Color = clWhitesmoke
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblLogo: TLabel
    Left = 24
    Top = 24
    Width = 190
    Height = 38
    Caption = #55356#57255' MusicInfo'
    Color = clSteelblue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRoyalblue
    Font.Height = -32
    Font.Name = 'Roboto Bk'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object shpStatus: TShape
    Left = 288
    Top = 43
    Width = 16
    Height = 16
    Brush.Color = clRed
  end
  object lblStatus: TLabel
    Left = 320
    Top = 43
    Width = 158
    Height = 31
    AutoSize = False
    Caption = #1044#1072#1085#1085#1099#1077' '#1085#1077' '#1079#1072#1075#1088#1091#1078#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object BtnLoad: TButton
    Left = 24
    Top = 88
    Width = 190
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1092#1072#1081#1083#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BtnLoadClick
  end
  object BtnView: TButton
    Left = 24
    Top = 128
    Width = 190
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1087#1080#1089#1082#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BtnViewClick
  end
  object BtnSort: TButton
    Left = 24
    Top = 168
    Width = 190
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnSortClick
  end
  object BtnSearch: TButton
    Left = 24
    Top = 208
    Width = 190
    Height = 25
    Caption = #1055#1086#1080#1089#1082' '#1076#1072#1085#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtnSearchClick
  end
  object BtnAdd: TButton
    Left = 24
    Top = 248
    Width = 190
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1074' '#1089#1087#1080#1089#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BtnAddClick
  end
  object BtnDelete: TButton
    Left = 24
    Top = 288
    Width = 190
    Height = 25
    Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnDeleteClick
  end
  object Button7: TButton
    Left = 24
    Top = 328
    Width = 190
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Button8: TButton
    Left = 288
    Top = 88
    Width = 190
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1087#1083#1077#1081#1083#1080#1089#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object Button9: TButton
    Left = 288
    Top = 288
    Width = 190
    Height = 25
    Caption = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Button10: TButton
    Left = 288
    Top = 328
    Width = 190
    Height = 25
    Caption = #1042#1099#1093#1086#1076' '#1089' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object pmLists: TPopupMenu
    Left = 8
    Top = 128
    object miArtists: TMenuItem
      Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080
      OnClick = miArtistsClick
    end
    object miAlbums: TMenuItem
      Caption = #1040#1083#1100#1073#1086#1084#1099
      OnClick = miAlbumsClick
    end
    object miSongs: TMenuItem
      Caption = #1055#1077#1089#1085#1080
      OnClick = miSongsClick
    end
  end
  object pmAdd: TPopupMenu
    Left = 8
    Top = 248
    object miAddArtist: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
      OnClick = miAddArtistClick
    end
    object miAddAlbum: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1083#1100#1073#1086#1084
      OnClick = miAddAlbumClick
    end
    object miAddSong: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1089#1085#1102
      OnClick = miAddSongClick
    end
  end
  object pmDelete: TPopupMenu
    Left = 8
    Top = 288
    object miDelArtist: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
      OnClick = miDelArtistClick
    end
    object miDelAlbum: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1083#1100#1073#1086#1084
      OnClick = miDelAlbumClick
    end
    object miDelSong: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1077#1089#1085#1102
    end
  end
end
