inherited AntManageClientDlg: TAntManageClientDlg
  Left = 171
  Top = 213
  Width = 1066
  Height = 588
  Caption = #32534#35793#37096#32626
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object pgcAnt: TPageControl
    Left = 0
    Top = 69
    Width = 1050
    Height = 481
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    OnChange = pgcAntChange
    OnChanging = pgcAntChanging
    object ts1: TTabSheet
      Caption = #39033#30446#37197#32622
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 1042
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnProAdd: TBitBtn
          Left = 9
          Top = 8
          Width = 100
          Height = 25
          Action = act_ProAdd
          Caption = #22686#21152#39033#30446
          TabOrder = 0
        end
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 40
        Width = 1042
        Height = 371
        Align = alClient
        DataSource = dsAntList
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ZINDEX'
            Title.Alignment = taCenter
            Title.Caption = #24207#21495
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZLANGTYPE'
            Title.Alignment = taCenter
            Title.Caption = #24320#21457#35821#35328
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZNAME'
            Title.Alignment = taCenter
            Title.Caption = #21517#31216
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZPRO_ID'
            Title.Alignment = taCenter
            Title.Caption = #31435#39033#39033#30446
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZDATE'
            Title.Alignment = taCenter
            Title.Caption = #32534#35793#26085#26399
            Width = 192
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZVERSION'
            Title.Alignment = taCenter
            Title.Caption = #29256#26412#21495
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSVN'
            Title.Alignment = taCenter
            Title.Caption = #32534#35793#29256#26412
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZSVN_LATEST_VERSION'
            Title.Caption = 'SVN'#29256#26412
            Width = 80
            Visible = True
          end>
      end
      object pnl7: TPanel
        Left = 0
        Top = 411
        Width = 1042
        Height = 40
        Align = alBottom
        TabOrder = 2
        object lblPageCount: TLabel
          Left = 538
          Top = 12
          Width = 96
          Height = 15
          Caption = 'lblPageCount'
        end
        object BtnFirstPage: TBitBtn
          Left = 11
          Top = 8
          Width = 100
          Height = 25
          Action = act_FirstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object BtnProPage: TBitBtn
          Left = 115
          Top = 8
          Width = 100
          Height = 25
          Action = act_ProPage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object BtnNextPage: TBitBtn
          Left = 219
          Top = 8
          Width = 100
          Height = 25
          Action = act_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object BtnLastPage: TBitBtn
          Left = 323
          Top = 8
          Width = 100
          Height = 25
          Action = act_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object BtnRefreshData: TBitBtn
          Left = 427
          Top = 8
          Width = 100
          Height = 25
          Action = act_RefreshData
          Caption = #21047#26032#25968#25454
          TabOrder = 4
        end
      end
    end
    object ts2: TTabSheet
      Caption = #39033#30446#32534#35793
      ImageIndex = 1
      object dbtxtZNAME: TDBText
        Left = 0
        Top = 0
        Width = 1042
        Height = 17
        Align = alTop
        Color = clGreen
        DataField = 'ZNAME'
        DataSource = dsAntList
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object spl1: TSplitter
        Left = 0
        Top = 264
        Width = 1042
        Height = 10
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object pnl1: TPanel
        Left = 0
        Top = 274
        Width = 1042
        Height = 177
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object spl4: TSplitter
          Left = 0
          Top = 112
          Width = 1042
          Height = 3
          Cursor = crVSplit
          Align = alBottom
        end
        object pnl3: TPanel
          Left = 0
          Top = 0
          Width = 1042
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          Color = clGreen
          TabOrder = 0
          object bvl1: TBevel
            Left = 442
            Top = 1
            Width = 11
            Height = 40
            Shape = bsLeftLine
          end
          object btnBuildProject: TBitBtn
            Left = 224
            Top = 8
            Width = 100
            Height = 25
            Action = act_BuildProject
            Caption = '3.'#32534#35793
            TabOrder = 0
          end
          object btnBuildConnectIP: TBitBtn
            Left = 16
            Top = 8
            Width = 100
            Height = 25
            Action = act_BuildConnectIP
            Caption = '1.'#36830#25509#26381#21153#22120
            TabOrder = 1
          end
          object btn1_BuildInfo: TBitBtn
            Left = 328
            Top = 8
            Width = 100
            Height = 25
            Action = act1_BuildInfo
            Caption = '4.'#32534#35793#32467#26524
            TabOrder = 2
          end
          object btnApplyBuild: TBitBtn
            Left = 120
            Top = 8
            Width = 100
            Height = 25
            Action = act_ApplyBuild
            Caption = '2.'#25105#30003#35831#32534#35793
            TabOrder = 3
          end
          object BtnSaveCompileText: TBitBtn
            Left = 457
            Top = 8
            Width = 100
            Height = 25
            Action = act_SaveCompileText
            Caption = #20445#23384#32467#26524
            TabOrder = 4
          end
          object BtnShowCompileText: TBitBtn
            Left = 561
            Top = 8
            Width = 100
            Height = 25
            Action = act_ShowCompileText
            Caption = #26816#26597#32467#26524
            TabOrder = 5
          end
          object btnGotoWebURL: TBitBtn
            Left = 665
            Top = 8
            Width = 100
            Height = 25
            Action = act_GotoWebURL
            Caption = #36816#34892'Web'#39033#30446
            TabOrder = 6
          end
        end
        object lstResult: TListBox
          Left = 0
          Top = 40
          Width = 1042
          Height = 72
          Style = lbOwnerDrawFixed
          Align = alClient
          ItemHeight = 16
          TabOrder = 1
          OnDrawItem = lstResultDrawItem
        end
        object ani1: TAnimate
          Left = 3
          Top = 44
          Width = 100
          Height = 80
          Color = clWhite
          ParentColor = False
          Visible = False
        end
        object lstErrors: TListBox
          Left = 0
          Top = 115
          Width = 1042
          Height = 62
          Align = alBottom
          Font.Charset = GB2312_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ItemHeight = 15
          ParentFont = False
          TabOrder = 3
          OnClick = lstErrorsClick
        end
      end
      object scrlbx1: TScrollBox
        Left = 0
        Top = 17
        Width = 1042
        Height = 247
        Align = alTop
        TabOrder = 1
        object lbl1: TLabel
          Left = 8
          Top = 16
          Width = 45
          Height = 15
          Caption = #21517#31216#65306
        end
        object lbl2: TLabel
          Left = 8
          Top = 45
          Width = 75
          Height = 15
          Caption = #31435#39033#39033#30446#65306
        end
        object lbl3: TLabel
          Left = 269
          Top = 45
          Width = 90
          Height = 15
          Caption = #32534#35793#26381#21153#22120#65306
        end
        object lbl4: TLabel
          Left = 8
          Top = 74
          Width = 75
          Height = 15
          Caption = #32534#35793#33050#26412#65306
        end
        object lbl5: TLabel
          Left = 8
          Top = 190
          Width = 75
          Height = 15
          Caption = #32534#35793#35828#26126#65306
        end
        object lbl6: TLabel
          Left = 553
          Top = 43
          Width = 75
          Height = 15
          Caption = #32534#35793#26085#26399#65306
        end
        object lbl7: TLabel
          Left = 553
          Top = 16
          Width = 60
          Height = 15
          Caption = #29256#26412#21495#65306
        end
        object lbl8: TLabel
          Left = 8
          Top = 105
          Width = 75
          Height = 15
          Caption = #32534#35793#29256#26412#65306
        end
        object lbl9: TLabel
          Left = 557
          Top = 104
          Width = 62
          Height = 15
          Caption = 'SVN'#29256#26412':'
        end
        object lbl10: TLabel
          Left = 8
          Top = 135
          Width = 62
          Height = 15
          Caption = 'SVN'#36335#24452':'
        end
        object lbl11: TLabel
          Left = 267
          Top = 104
          Width = 241
          Height = 15
          Caption = '('#27599#27425#32534#35793#26102#24517#39035#22635#20889#32534#35793#30340#29256#26412#21495')'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl12: TLabel
          Left = 8
          Top = 163
          Width = 75
          Height = 15
          Caption = #24320#21457#35821#35328#65306
        end
        object lbl13: TLabel
          Left = 251
          Top = 163
          Width = 109
          Height = 15
          Caption = 'Web'#26381#21153#22120'HOST:'
        end
        object lbl14: TLabel
          Left = 554
          Top = 70
          Width = 195
          Height = 15
          Caption = '(java'#39033#30446#20889'build.xml'#36335#24452')'
        end
        object dbedtZNAME: TDBEdit
          Left = 81
          Top = 11
          Width = 453
          Height = 23
          DataField = 'ZNAME'
          DataSource = dsAntList
          TabOrder = 0
        end
        object dbedtZPRO_ID: TDBEdit
          Left = 81
          Top = 40
          Width = 180
          Height = 23
          DataField = 'ZPRO_ID'
          DataSource = dsAntList
          TabOrder = 1
        end
        object dbedtZIP: TDBEdit
          Left = 353
          Top = 40
          Width = 180
          Height = 23
          DataField = 'ZIP'
          DataSource = dsAntList
          ImeName = #26497#21697#20116#31508#36755#20837#27861
          TabOrder = 2
        end
        object dbedtZPYFILE: TDBEdit
          Left = 82
          Top = 69
          Width = 451
          Height = 23
          DataField = 'ZPYFILE'
          DataSource = dsAntList
          TabOrder = 3
        end
        object btnProSave: TBitBtn
          Left = 818
          Top = 7
          Width = 100
          Height = 25
          Action = act_ProSave
          Caption = #20445#23384
          TabOrder = 4
        end
        object btnProCancel: TBitBtn
          Left = 818
          Top = 36
          Width = 100
          Height = 25
          Action = act_ProCancel
          Caption = #21462#28040
          TabOrder = 5
        end
        object dbmmoZREMARK: TDBMemo
          Left = 81
          Top = 185
          Width = 722
          Height = 56
          DataField = 'ZREMARK'
          DataSource = dsAntList
          ScrollBars = ssVertical
          TabOrder = 6
        end
        object dbedtZDATE: TDBEdit
          Left = 624
          Top = 40
          Width = 180
          Height = 23
          DataField = 'ZDATE'
          DataSource = dsAntList
          TabOrder = 7
        end
        object dbedtZVERSION: TDBEdit
          Left = 624
          Top = 13
          Width = 180
          Height = 23
          DataField = 'ZVERSION'
          DataSource = dsAntList
          TabOrder = 8
        end
        object dbedtZSVN: TDBEdit
          Left = 82
          Top = 101
          Width = 180
          Height = 23
          DataField = 'ZSVN'
          DataSource = dsAntList
          TabOrder = 9
        end
        object dbedtZSVN_LATEST_VERSION: TDBEdit
          Left = 624
          Top = 101
          Width = 180
          Height = 23
          Color = clBtnFace
          DataField = 'ZSVN_LATEST_VERSION'
          DataSource = dsAntList
          ReadOnly = True
          TabOrder = 10
        end
        object dbedtZSVN_URL: TDBEdit
          Left = 82
          Top = 130
          Width = 722
          Height = 23
          DataField = 'ZSVN_URL'
          DataSource = dsAntList
          TabOrder = 11
          Visible = False
        end
        object btnEditSVNRUL: TBitBtn
          Left = 80
          Top = 129
          Width = 726
          Height = 25
          Caption = #32534#36753#36335#24452
          TabOrder = 12
          OnClick = btnEditSVNRULClick
        end
        object dbedtZWEBURL: TDBEdit
          Left = 364
          Top = 158
          Width = 438
          Height = 23
          DataField = 'ZWEBURL'
          DataSource = dsAntList
          TabOrder = 13
        end
        object dblkcbbZLANGTYPE: TDBLookupComboBox
          Left = 81
          Top = 158
          Width = 152
          Height = 23
          DataField = 'ZLANGTYPE'
          DataSource = dsAntList
          KeyField = 'LangID'
          ListField = 'LangName'
          ListSource = dsLangType
          TabOrder = 14
        end
        object dbedtZGUID: TDBEdit
          Left = 813
          Top = 129
          Width = 121
          Height = 23
          DataField = 'ZGUID'
          DataSource = dsAntList
          TabOrder = 15
          Visible = False
        end
        object dbedtZLOCALSVNBAT: TDBEdit
          Left = 811
          Top = 158
          Width = 121
          Height = 23
          Hint = #29992#20110#33258#21160#33719#21462'SVN'#20195#30721#20043#29992#26159'bat'#25991#20214
          DataField = 'ZLOCALSVNBAT'
          DataSource = dsAntList
          TabOrder = 16
          Visible = False
        end
      end
    end
    object tsLog: TTabSheet
      Caption = 'SVN'#26085#24535
      ImageIndex = 2
      object spl2: TSplitter
        Left = 0
        Top = 275
        Width = 1042
        Height = 8
        Cursor = crVSplit
        Align = alBottom
      end
      object dbtxtZNAME1: TDBText
        Left = 0
        Top = 0
        Width = 1042
        Height = 17
        Align = alTop
        Color = clGreen
        DataField = 'ZPRONAME'
        DataSource = dsSvnCommits
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object pnl4: TPanel
        Left = 0
        Top = 17
        Width = 1042
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblSvnPage: TLabel
          Left = 537
          Top = 12
          Width = 80
          Height = 15
          Caption = 'lblSvnPage'
        end
        object btnSvnLog_FirstPage: TBitBtn
          Left = 115
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_FirstPage
          Caption = #31532#19968#39029
          TabOrder = 0
        end
        object btnSvnLog_ProPage: TBitBtn
          Left = 219
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_ProPage
          Caption = #19978#19968#39029
          TabOrder = 1
        end
        object btnSvnLog_NextPage: TBitBtn
          Left = 323
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_NextPage
          Caption = #19979#19968#39029
          TabOrder = 2
        end
        object btnSvnLog_ProPage1: TBitBtn
          Left = 427
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_LastPage
          Caption = #26368#21518#19968#39029
          TabOrder = 3
        end
        object btnSvnLog_AllProject: TBitBtn
          Left = 11
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_AllProject
          Caption = #20840#37096#39033#30446
          TabOrder = 4
        end
        object edtSvnFindTxt: TEdit
          Left = 647
          Top = 8
          Width = 121
          Height = 23
          Hint = #21487#20197#26597#35810#20316#32773#19982#20449#24687#20869#23481
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object btnSvnLog_FindTxt: TBitBtn
          Left = 776
          Top = 8
          Width = 100
          Height = 25
          Action = actSvnLog_FindTxt
          Caption = #26597#35810
          TabOrder = 6
        end
      end
      object dbgrdSvnChanges: TDBGrid
        Left = 0
        Top = 283
        Width = 1042
        Height = 168
        Align = alBottom
        DataSource = dsSvnChanges
        ImeName = #26497#21697#20116#31508#36755#20837#27861
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdSvnChangesDrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ZACTION'
            Title.Alignment = taCenter
            Title.Caption = #25805#20316
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZPATH'
            Title.Alignment = taCenter
            Title.Caption = #36335#24452
            Width = 450
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCOPY_PATH'
            Title.Alignment = taCenter
            Title.Caption = #20174#36335#24452#22797#21046
            Width = 380
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZCOPY_VERSION'
            Title.Alignment = taCenter
            Title.Caption = #29256#26412
            Visible = True
          end>
      end
      object pnl5: TPanel
        Left = 0
        Top = 57
        Width = 1042
        Height = 218
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnl5'
        TabOrder = 2
        object spl3: TSplitter
          Left = 0
          Top = 121
          Width = 1042
          Height = 8
          Cursor = crVSplit
          Align = alBottom
        end
        object dbgrdSvnCommits: TDBGrid
          Left = 0
          Top = 0
          Width = 1042
          Height = 121
          Align = alClient
          DataSource = dsSvnCommits
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pm1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dbgrdSvnCommitsDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'ZAUTOID'
              Title.Alignment = taCenter
              Title.Caption = #32534#21495
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZVERSTR'
              Title.Alignment = taCenter
              Title.Caption = #29256#26412
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAUTHOR'
              Title.Alignment = taCenter
              Title.Caption = #20316#32773
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZDATE'
              Title.Alignment = taCenter
              Title.Caption = #26085#26399
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZMESSAGETEXT'
              Title.Alignment = taCenter
              Title.Caption = #20449#24687
              Width = 600
              Visible = True
            end>
        end
        object dbmmoZMESSAGE: TDBMemo
          Left = 0
          Top = 129
          Width = 1042
          Height = 89
          Align = alBottom
          DataField = 'ZMESSAGE'
          DataSource = dsSvnCommits
          ImeName = #26497#21697#20116#31508#36755#20837#27861
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
    end
  end
  object pnl6: TPanel
    Left = 0
    Top = 0
    Width = 1050
    Height = 69
    Align = alTop
    TabOrder = 1
    Visible = False
  end
  object actlst1: TActionList
    Left = 16
    Top = 5
    object act_BuildConnectIP: TAction
      Category = #32534#35793
      Caption = '1.'#36830#25509#26381#21153#22120
      OnExecute = act_BuildConnectIPExecute
    end
    object act_BuildProject: TAction
      Category = #32534#35793
      Caption = '3.'#32534#35793
      Enabled = False
      OnExecute = act_BuildProjectExecute
    end
    object act_ProAdd: TAction
      Category = #39033#30446#37197#32622
      Caption = #22686#21152#39033#30446
      OnExecute = act_ProAddExecute
    end
    object act_ProSave: TAction
      Category = #39033#30446#37197#32622
      Caption = #20445#23384
      OnExecute = act_ProSaveExecute
      OnUpdate = act_ProSaveUpdate
    end
    object act_ProCancel: TAction
      Category = #39033#30446#37197#32622
      Caption = #21462#28040
      OnExecute = act_ProCancelExecute
      OnUpdate = act_ProCancelUpdate
    end
    object act1_BuildInfo: TAction
      Category = #32534#35793
      Caption = '4.'#32534#35793#32467#26524
      OnExecute = act1_BuildInfoExecute
      OnUpdate = act1_BuildInfoUpdate
    end
    object act_Svnlog: TAction
      Category = 'SVN'#26085#24535
      Caption = 'SVN'#26085#24535
    end
    object actSvnLog_FirstPage: TAction
      Category = 'SVN'#26085#24535
      Caption = #31532#19968#39029
      OnExecute = actSvnLog_FirstPageExecute
      OnUpdate = actSvnLog_FirstPageUpdate
    end
    object actSvnLog_ProPage: TAction
      Category = 'SVN'#26085#24535
      Caption = #19978#19968#39029
      OnExecute = actSvnLog_ProPageExecute
      OnUpdate = actSvnLog_ProPageUpdate
    end
    object actSvnLog_NextPage: TAction
      Category = 'SVN'#26085#24535
      Caption = #19979#19968#39029
      OnExecute = actSvnLog_NextPageExecute
      OnUpdate = actSvnLog_NextPageUpdate
    end
    object actSvnLog_LastPage: TAction
      Category = 'SVN'#26085#24535
      Caption = #26368#21518#19968#39029
      OnExecute = actSvnLog_LastPageExecute
      OnUpdate = actSvnLog_LastPageUpdate
    end
    object actSvnLog_AllProject: TAction
      Category = 'SVN'#26085#24535
      Caption = #20840#37096#39033#30446
      OnExecute = actSvnLog_AllProjectExecute
    end
    object act_ApplyBuild: TAction
      Category = #32534#35793
      Caption = '2.'#25105#30003#35831#32534#35793
      OnExecute = act_ApplyBuildExecute
      OnUpdate = act_ApplyBuildUpdate
    end
    object act_SaveCompileText: TAction
      Category = #32534#35793
      Caption = #20445#23384#32467#26524
      OnExecute = act_SaveCompileTextExecute
    end
    object act_ShowCompileText: TAction
      Category = #32534#35793
      Caption = #26816#26597#32467#26524
      OnExecute = act_ShowCompileTextExecute
    end
    object act_FirstPage: TAction
      Category = #39033#30446#37197#32622
      Caption = #31532#19968#39029
      OnExecute = act_FirstPageExecute
      OnUpdate = act_FirstPageUpdate
    end
    object act_ProPage: TAction
      Category = #39033#30446#37197#32622
      Caption = #19978#19968#39029
      OnExecute = act_ProPageExecute
      OnUpdate = act_ProPageUpdate
    end
    object act_NextPage: TAction
      Category = #39033#30446#37197#32622
      Caption = #19979#19968#39029
      OnExecute = act_NextPageExecute
      OnUpdate = act_NextPageUpdate
    end
    object act_LastPage: TAction
      Category = #39033#30446#37197#32622
      Caption = #26368#21518#19968#39029
      OnExecute = act_LastPageExecute
      OnUpdate = act_LastPageUpdate
    end
    object act_RefreshData: TAction
      Category = #39033#30446#37197#32622
      Caption = #21047#26032#25968#25454
      OnExecute = act_RefreshDataExecute
    end
    object act_GotoWebURL: TAction
      Category = #32534#35793
      Caption = #36816#34892'Web'#39033#30446
      OnExecute = act_GotoWebURLExecute
      OnUpdate = act_GotoWebURLUpdate
    end
    object actSvnLog_FindTxt: TAction
      Category = 'SVN'#26085#24535
      Caption = #26597#35810
      OnExecute = actSvnLog_FindTxtExecute
      OnUpdate = actSvnLog_FindTxtUpdate
    end
    object actSvnLog_FindAuthor: TAction
      Category = 'SVN'#26085#24535
      Caption = #26597#35810#36825#20010#20316#32773#30340#26085#24535
      OnExecute = actSvnLog_FindAuthorExecute
      OnUpdate = actSvnLog_FindAuthorUpdate
    end
  end
  object idtcpclnt1: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 0
    Left = 52
    Top = 5
  end
  object cdsAntList: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsAntListBeforePost
    AfterScroll = cdsAntListAfterScroll
    OnNewRecord = cdsAntListNewRecord
    Left = 86
    Top = 5
  end
  object dsAntList: TDataSource
    DataSet = cdsAntList
    Left = 85
    Top = 35
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 122
    Top = 5
  end
  object cdsSvnCommits: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsSvnCommitsAfterScroll
    OnCalcFields = cdsSvnCommitsCalcFields
    Left = 158
    Top = 5
  end
  object dsSvnCommits: TDataSource
    DataSet = cdsSvnCommits
    Left = 157
    Top = 35
  end
  object cdsSvnChanges: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 196
    Top = 6
  end
  object dsSvnChanges: TDataSource
    DataSet = cdsSvnChanges
    Left = 196
    Top = 36
  end
  object cdsCloneAntList: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 234
    Top = 7
  end
  object cdsLangType: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 8
    Data = {
      460000009619E0BD0100000018000000020000000000030000004600064C616E
      6749440400010000000000084C616E674E616D65010049000000010005574944
      54480200020032000000}
    object intgrfldLangTypeLangID: TIntegerField
      FieldName = 'LangID'
    end
    object strngfldLangTypeLangName: TStringField
      FieldName = 'LangName'
      Size = 50
    end
  end
  object dsLangType: TDataSource
    DataSet = cdsLangType
    Left = 272
    Top = 40
  end
  object pm1: TPopupMenu
    AutoHotkeys = maManual
    Left = 312
    Top = 16
    object N1: TMenuItem
      Action = actSvnLog_FindAuthor
    end
  end
end
