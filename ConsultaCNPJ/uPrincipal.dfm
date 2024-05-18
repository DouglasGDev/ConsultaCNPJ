object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'CONSULTA'
  ClientHeight = 592
  ClientWidth = 997
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 997
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 989
    object lblConsultaCNPJ: TLabel
      Left = 56
      Top = 8
      Width = 98
      Height = 15
      Caption = 'CONSULTAR CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnBuscarCNPJ: TButton
      Left = 190
      Top = 29
      Width = 75
      Height = 23
      Caption = 'Buscar CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnBuscarCNPJClick
    end
    object edtBuscaCNPJ: TMaskEdit
      Left = 56
      Top = 29
      Width = 121
      Height = 23
      EditMask = '00.000.000/0000-00;1;_'
      MaxLength = 18
      TabOrder = 1
      Text = '  .   .   /    -  '
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 512
    Width = 997
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 500
    ExplicitWidth = 989
    object btnFechar: TBitBtn
      Left = 909
      Top = 28
      Width = 75
      Height = 25
      Caption = 'FECHAR'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 80
    Width = 997
    Height = 432
    Align = alClient
    BevelOuter = bvSpace
    Color = 16768959
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 989
    ExplicitHeight = 420
    object Label1: TLabel
      Left = 534
      Top = 5
      Width = 27
      Height = 15
      Caption = 'CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtRazaoSocial: TLabeledEdit
      Left = 8
      Top = 22
      Width = 298
      Height = 23
      EditLabel.Width = 82
      EditLabel.Height = 15
      EditLabel.Caption = 'RAZ'#195'O SOCIAL'
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object edtFantasia: TLabeledEdit
      Left = 312
      Top = 22
      Width = 237
      Height = 23
      EditLabel.Width = 52
      EditLabel.Height = 15
      EditLabel.Caption = 'FANTASIA'
      ReadOnly = True
      TabOrder = 1
      Text = ''
    end
    object edtTipoLogradouro: TLabeledEdit
      Left = 8
      Top = 62
      Width = 105
      Height = 23
      EditLabel.Width = 107
      EditLabel.Height = 15
      EditLabel.Caption = 'TIPO LOGRADOURO'
      ReadOnly = True
      TabOrder = 2
      Text = ''
    end
    object edtLogradouro: TLabeledEdit
      Left = 119
      Top = 62
      Width = 331
      Height = 23
      EditLabel.Width = 79
      EditLabel.Height = 15
      EditLabel.Caption = 'LOGRADOURO'
      ReadOnly = True
      TabOrder = 3
      Text = ''
    end
    object edtNumero: TLabeledEdit
      Left = 456
      Top = 62
      Width = 73
      Height = 23
      EditLabel.Width = 50
      EditLabel.Height = 15
      EditLabel.Caption = 'NUMERO'
      ReadOnly = True
      TabOrder = 4
      Text = ''
    end
    object edtIE: TLabeledEdit
      Left = 700
      Top = 22
      Width = 139
      Height = 23
      EditLabel.Width = 119
      EditLabel.Height = 15
      EditLabel.Caption = 'INSCRI'#199#195'O ESTADUAL'
      ReadOnly = True
      TabOrder = 5
      Text = ''
    end
    object edtIEAtivo: TLabeledEdit
      Left = 845
      Top = 22
      Width = 139
      Height = 23
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = 'I.E/Ativo'
      ReadOnly = True
      TabOrder = 6
      Text = ''
    end
    object edtComplemento: TLabeledEdit
      Left = 535
      Top = 62
      Width = 159
      Height = 23
      EditLabel.Width = 87
      EditLabel.Height = 15
      EditLabel.Caption = 'COMPLEMENTO'
      ReadOnly = True
      TabOrder = 7
      Text = ''
    end
    object edtBairro: TLabeledEdit
      Left = 700
      Top = 62
      Width = 139
      Height = 23
      EditLabel.Width = 41
      EditLabel.Height = 15
      EditLabel.Caption = 'BAIRRO'
      ReadOnly = True
      TabOrder = 8
      Text = ''
    end
    object edtCEP: TLabeledEdit
      Left = 845
      Top = 62
      Width = 139
      Height = 23
      EditLabel.Width = 21
      EditLabel.Height = 15
      EditLabel.Caption = 'CEP'
      ReadOnly = True
      TabOrder = 9
      Text = ''
    end
    object edtEstado: TLabeledEdit
      Left = 119
      Top = 102
      Width = 49
      Height = 23
      EditLabel.Width = 14
      EditLabel.Height = 15
      EditLabel.Caption = 'UF'
      ReadOnly = True
      TabOrder = 10
      Text = ''
    end
    object edtCidade: TLabeledEdit
      Left = 8
      Top = 102
      Width = 105
      Height = 23
      EditLabel.Width = 41
      EditLabel.Height = 15
      EditLabel.Caption = 'CIDADE'
      ReadOnly = True
      TabOrder = 11
      Text = ''
    end
    object edtTelefone: TLabeledEdit
      Left = 63
      Top = 142
      Width = 105
      Height = 23
      EditLabel.Width = 54
      EditLabel.Height = 15
      EditLabel.Caption = 'TELEFONE'
      ReadOnly = True
      TabOrder = 12
      Text = ''
    end
    object edtDDD: TLabeledEdit
      Left = 8
      Top = 142
      Width = 49
      Height = 23
      EditLabel.Width = 24
      EditLabel.Height = 15
      EditLabel.Caption = 'DDD'
      ReadOnly = True
      TabOrder = 13
      Text = ''
    end
    object edtDDD2: TLabeledEdit
      Left = 184
      Top = 142
      Width = 49
      Height = 23
      EditLabel.Width = 30
      EditLabel.Height = 15
      EditLabel.Caption = 'DDD2'
      ReadOnly = True
      TabOrder = 14
      Text = ''
    end
    object edtTelefone2: TLabeledEdit
      Left = 239
      Top = 142
      Width = 105
      Height = 23
      EditLabel.Width = 60
      EditLabel.Height = 15
      EditLabel.Caption = 'TELEFONE2'
      ReadOnly = True
      TabOrder = 15
      Text = ''
    end
    object edtEmail: TLabeledEdit
      Left = 350
      Top = 142
      Width = 275
      Height = 23
      EditLabel.Width = 34
      EditLabel.Height = 15
      EditLabel.Caption = 'EMAIL'
      ReadOnly = True
      TabOrder = 16
      Text = ''
    end
    object edtSituacaoCadastral: TLabeledEdit
      Left = 174
      Top = 102
      Width = 140
      Height = 23
      EditLabel.Width = 124
      EditLabel.Height = 15
      EditLabel.Caption = 'SITUA'#199#195'O CADASTRAL'
      ReadOnly = True
      TabOrder = 17
      Text = ''
    end
    object edtMotivo: TLabeledEdit
      Left = 320
      Top = 102
      Width = 519
      Height = 23
      EditLabel.Width = 190
      EditLabel.Height = 15
      EditLabel.Caption = 'MOTIVO DA SITUA'#199#195'O CADASTRAL'
      ReadOnly = True
      TabOrder = 18
      Text = ''
    end
    object edtCNPJ: TMaskEdit
      Left = 555
      Top = 22
      Width = 139
      Height = 23
      EditMask = '00.000.000/0000-00;1;_'
      MaxLength = 18
      TabOrder = 19
      Text = '  .   .   /    -  '
    end
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 288
    Top = 328
  end
  object RESTResponse: TRESTResponse
    Left = 376
    Top = 328
  end
  object RESTClient: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 208
    Top = 328
  end
end
