unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Net.HttpClient, System.Net.HttpClientComponent, IdHTTP,
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
    edtTipoLogradouro: TLabeledEdit;
    edtLogradouro: TLabeledEdit;
    edtNumero: TLabeledEdit;
    edtIE: TLabeledEdit;
    edtIEAtivo: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCEP: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtTelefone: TLabeledEdit;
    edtDDD: TLabeledEdit;
    edtDDD2: TLabeledEdit;
    edtTelefone2: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtSituacaoCadastral: TLabeledEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure btnBuscarCNPJClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    const
      _URL_CONSULTAR_CNPJ = 'https://publica.cnpj.ws/cnpj/%s';
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnBuscarCNPJClick(Sender: TObject);
var
  LCNPJ: String;
  JSONObject: TJSONObject;
  InscricaoEstadual: TJSONValue;
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
                   edtRazaoSocial.Text :=  JSONObject.FindValue('razao_social').Value;
                   edtFantasia.Text :=  JSONObject.FindValue('estabelecimento.nome_fantasia').Value;
                   edtCNPJ.Text :=  JSONObject.FindValue('estabelecimento.cnpj').Value;
                   edtTipoLogradouro.Text :=  JSONObject.FindValue('estabelecimento.tipo_logradouro').Value;
                   edtLogradouro.Text :=  JSONObject.FindValue('estabelecimento.logradouro').Value;
                   edtNumero.Text :=  JSONObject.FindValue('estabelecimento.numero').Value;
                   edtBairro.Text :=  JSONObject.FindValue('estabelecimento.bairro').Value;
                   edtCEP.Text := JSONObject.FindValue('estabelecimento.cep').Value;
                   edtDDD.Text := JSONObject.FindValue('estabelecimento.ddd1').Value;
                   edtTelefone.Text := JSONObject.FindValue('estabelecimento.telefone1').Value;
                   edtDDD2.Text := JSONObject.FindValue('estabelecimento.ddd2').Value;
                   edtTelefone2.Text := JSONObject.FindValue('estabelecimento.telefone2').Value;
                   edtEmail.Text := JSONObject.FindValue('estabelecimento.email').Value;
                   edtEstado.Text :=  JSONObject.FindValue('estabelecimento.estado.sigla').Value;
                   edtCidade.Text :=  JSONObject.FindValue('estabelecimento.cidade.nome').Value;
                   edtComplemento.Text :=  JSONObject.FindValue('estabelecimento.complemento').Value;
                   edtSituacaoCadastral.Text :=  JSONObject.FindValue('estabelecimento.situacao_cadastral').Value;
                   edtIE.Text := JSONObject.FindValue('estabelecimento.inscricoes_estaduais[0].inscricao_estadual').Value;
                   edtIEAtivo.Text :=  JSONObject.FindValue('estabelecimento.inscricoes_estaduais[0].ativo').Value;
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
    RESTRequest.ResetToDefaults;
  end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.

