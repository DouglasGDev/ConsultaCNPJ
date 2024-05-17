object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'CONSULTA'
  ClientHeight = 619
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 841
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    object edtBuscaCNPJ: TEdit
      Left = 56
      Top = 29
      Width = 209
      Height = 23
      TabOrder = 0
      TextHint = 'DIGITE O CNPJ(SOMENTE N'#218'MEROS)'
    end
    object btnBuscarCNPJ: TButton
      Left = 288
      Top = 29
      Width = 75
      Height = 23
      Caption = 'Buscar CNPJ'
      TabOrder = 1
      OnClick = btnBuscarCNPJClick
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 539
    Width = 841
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    object btnFechar: TBitBtn
      Left = 744
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
    Width = 841
    Height = 459
    Align = alClient
    BevelOuter = bvSpace
    Color = 16768959
    ParentBackground = False
    TabOrder = 2
    object edtRazaoSocial: TLabeledEdit
      Left = 8
      Top = 22
      Width = 257
      Height = 23
      EditLabel.Width = 82
      EditLabel.Height = 15
      EditLabel.Caption = 'RAZ'#195'O SOCIAL'
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object edtFantasia: TLabeledEdit
      Left = 271
      Top = 22
      Width = 257
      Height = 23
      EditLabel.Width = 52
      EditLabel.Height = 15
      EditLabel.Caption = 'FANTASIA'
      ReadOnly = True
      TabOrder = 1
      Text = ''
    end
    object edtCNPJ: TLabeledEdit
      Left = 534
      Top = 22
      Width = 257
      Height = 23
      EditLabel.Width = 27
      EditLabel.Height = 15
      EditLabel.Caption = 'CNPJ'
      ReadOnly = True
      TabOrder = 2
      Text = ''
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
