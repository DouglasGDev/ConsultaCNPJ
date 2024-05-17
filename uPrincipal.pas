unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,  System.Net.HttpClient, System.Net.HttpClientComponent, IdHTTP,
  Vcl.Mask, System.JSON;

type
  TfrmPrincipal = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    pnlBody: TPanel;
    btnFechar: TBitBtn;
    edtBuscaCNPJ: TEdit;
    btnBuscarCNPJ: TButton;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTClient: TRESTClient;
    edtRazaoSocial: TLabeledEdit;
    edtFantasia: TLabeledEdit;
    edtCNPJ: TLabeledEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure btnBuscarCNPJClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    const
      _URL_CONSULTAR_CNPJ = 'https://brasilapi.com.br/api/cnpj/v1/%s';
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnBuscarCNPJClick(Sender: TObject);
var
  LCNPJ: String;
  JSONObject: TJSONObject;
begin
  edtBuscaCNPJ.SetFocus;
  LCNPJ := Trim(edtBuscaCNPJ.Text);
  RESTClient.BaseURL := Format(_URL_CONSULTAR_CNPJ, [LCNPJ]);
  RESTClient.SecureProtocols := [THTTPSecureProtocol.TLS12];
  RESTRequest.Method := rmGet;
  try
    try
      RESTRequest.Execute;
      case RESTResponse.StatusCode of
        200: begin
               JSONObject := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(RESTResponse.Content), 0) as TJSONObject;
               try
                 edtRazaoSocial.Text :=  JSONObject.GetValue('razao_social').Value;
                 edtFantasia.Text :=  JSONObject.GetValue('nome_fantasia').Value;
                 edtCNPJ.Text :=  JSONObject.GetValue('cnpj').Value;
               finally
                 JSONObject.Free;
               end;
             end;
        404: MessageDlg('CNPJ n�o encontrado.', mtInformation, [mbOK], 0);
        else
          MessageDlg('Erro HTTP: ' + IntToStr(RESTResponse.StatusCode) + ' - ' + RESTResponse.StatusText, mtError, [mbOK], 0);
      end;
    except
      on E: EIdHTTPProtocolException do
        MessageDlg('Erro na requisi��o HTTP: ' + E.Message, mtError, [mbOK], 0);
      on E: Exception do
        MessageDlg('Erro ao executar a requisi��o: ' + E.Message, mtError, [mbOK], 0);
    end;
  finally
    RESTClient.ResetToDefaults;
  end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
    Close;
end;

end.