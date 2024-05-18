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
    btnBuscarCNPJ: TButton;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTClient: TRESTClient;
    edtRazaoSocial: TLabeledEdit;
    edtFantasia: TLabeledEdit;
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
    lblConsultaCNPJ: TLabel;
    edtMotivo: TLabeledEdit;
    edtBuscaCNPJ: TMaskEdit;
    edtCNPJ: TMaskEdit;
    Label1: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnBuscarCNPJClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LimparEdits;
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
procedure TfrmPrincipal.LimparEdits;
var i: integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then // verifica se � do tipo TLabeledEdit
      TLabeledEdit(Components[i]).Text := EmptyStr// para limpar o campo que foi digitado anteriormente e retornar sem sujeira
       else if (Components[i] is TMaskEdit) then
       TMaskEdit(Components[i]).Text := EmptyStr// para limpar o campo que foi digitado anteriormente e retornar sem sujeira
       else if (Components[i] is TEdit) then
       TEdit(Components[i]).Text := EmptyStr// para limpar o campo que foi digitado anteriormente e retornar sem sujeira
       else if (Components[i] is TMemo) then
       TMemo(Components[i]).Text := EmptyStr// para limpar o campo que foi digitado anteriormente e retornar sem sujeira
       //else if (Components[i] is TDBLookupComboBox) then
       //TDBLookupComboBox(Components[i]).KeyValue := Null// para limpar o campo que foi digitado anteriormente e retornar sem sujeira
       //else if (Components[i] is TCurrencyEdit) then
       //TCurrencyEdit(Components[i]).Value := 0// para limpar o campo que foi digitado anteriormente e retornar sem sujeira
       //else if (Components[i] is TDateEdit) then
       //TDateEdit(Components[i]).Date := 0;// para limpar o campo que foi digitado anteriormente e retornar sem sujeira
  end;
end;

function ApenasNumeros(const Texto: string): string;
var
  i: Integer;
begin
  Result := ''; // Inicializa o resultado como uma string vazia
  for i := 1 to Length(Texto) do
  begin
    if CharInSet(Texto[i], ['0'..'9']) then
      Result := Result + Texto[i];
  end;
end;

function AplicarMascaraCNPJ(const CNPJ: string): string;
begin
  // Assume que o CNPJ j� est� apenas com n�meros e tem 14 caracteres
  if Length(CNPJ) = 14 then
    Result := Format('%.2s.%.3s.%.3s/%.4s-%.2s', [Copy(CNPJ, 1, 2), Copy(CNPJ, 3, 3),
      Copy(CNPJ, 6, 3), Copy(CNPJ, 9, 4), Copy(CNPJ, 13, 2)])
  else
    Result := CNPJ; // Retorna o CNPJ sem m�scara se n�o tiver 14 caracteres
end;

procedure TfrmPrincipal.btnBuscarCNPJClick(Sender: TObject);
var
  LCNPJ: String;
  JSONObject: TJSONObject;
  InscricaoEstadual: TJSONValue;
begin
  edtBuscaCNPJ.SetFocus;
  LCNPJ := Trim(ApenasNumeros(edtBuscaCNPJ.Text));
  RESTClient.BaseURL := Format(_URL_CONSULTAR_CNPJ, [LCNPJ]);
  RESTClient.SecureProtocols := [THTTPSecureProtocol.TLS12];
  RESTRequest.Method := rmGet;

  try
    try
      LimparEdits;
      RESTRequest.Execute;
      case RESTResponse.StatusCode of
        200: begin
               JSONObject := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(RESTResponse.Content), 0) as TJSONObject;
                 try
                     if JSONObject.FindValue('razao_social') <> nil then
                       edtRazaoSocial.Text :=  JSONObject.FindValue('razao_social').Value
                     else
                     edtRazaoSocial.Text :='';

                     if JSONObject.FindValue('estabelecimento.nome_fantasia') <> nil then
                      edtFantasia.Text :=  JSONObject.FindValue('estabelecimento.nome_fantasia').Value
                     else
                      edtFantasia.Text := '';

                     if JSONObject.FindValue('estabelecimento.cnpj') <> nil then
                       edtCNPJ.Text :=  AplicarMascaraCNPJ(JSONObject.FindValue('estabelecimento.cnpj').Value)
                     else
                       edtCNPJ.Text := '';

                     if JSONObject.FindValue('estabelecimento.tipo_logradouro') <> nil then
                       edtTipoLogradouro.Text :=  JSONObject.FindValue('estabelecimento.tipo_logradouro').Value
                     else
                       edtTipoLogradouro.Text := '';

                     if JSONObject.FindValue('estabelecimento.logradouro') <> nil then
                       edtLogradouro.Text :=  JSONObject.FindValue('estabelecimento.logradouro').Value
                     else
                       edtLogradouro.Text := '';

                     if JSONObject.FindValue('estabelecimento.numero') <> nil then
                       edtNumero.Text :=  JSONObject.FindValue('estabelecimento.numero').Value
                     else
                       edtNumero.Text := '';

                     if JSONObject.FindValue('estabelecimento.bairro') <> nil then
                       edtBairro.Text :=  JSONObject.FindValue('estabelecimento.bairro').Value
                     else
                       edtBairro.Text := '';

                     if JSONObject.FindValue('estabelecimento.cep') <> nil then
                       edtCEP.Text := JSONObject.FindValue('estabelecimento.cep').Value
                     else
                       edtCEP.Text := '';

                      if JSONObject.FindValue('estabelecimento.ddd1') <> nil then
                        edtDDD.Text := JSONObject.FindValue('estabelecimento.ddd1').Value
                      else
                        edtDDD.Text := '';

                      if JSONObject.FindValue('estabelecimento.telefone1') <> nil then
                        edtTelefone.Text := JSONObject.FindValue('estabelecimento.telefone1').Value
                      else
                        edtTelefone.Text := '';

                      if JSONObject.FindValue('estabelecimento.ddd2') <> nil then
                        edtDDD2.Text := JSONObject.FindValue('estabelecimento.ddd2').Value
                      else
                        edtDDD2.Text := '';

                      if JSONObject.FindValue('estabelecimento.telefone2') <> nil then
                        edtTelefone2.Text := JSONObject.FindValue('estabelecimento.telefone2').Value
                      else
                        edtTelefone2.Text := '';

                      if JSONObject.FindValue('estabelecimento.email') <> nil then
                        edtEmail.Text := JSONObject.FindValue('estabelecimento.email').Value
                      else
                        edtEmail.Text := '';

                      if JSONObject.FindValue('estabelecimento.estado.sigla') <> nil then
                        edtEstado.Text :=  JSONObject.FindValue('estabelecimento.estado.sigla').Value
                      else
                        edtEstado.Text := '';

                      if JSONObject.FindValue('estabelecimento.cidade.nome') <> nil then
                        edtCidade.Text :=  JSONObject.FindValue('estabelecimento.cidade.nome').Value
                      else
                        edtCidade.Text := '';

                      if JSONObject.FindValue('estabelecimento.complemento') <> nil then
                        edtComplemento.Text :=  JSONObject.FindValue('estabelecimento.complemento').Value
                      else
                        edtComplemento.Text := '';

                      if JSONObject.FindValue('estabelecimento.situacao_cadastral') <> nil then
                        edtSituacaoCadastral.Text :=  JSONObject.FindValue('estabelecimento.situacao_cadastral').Value
                      else
                        edtSituacaoCadastral.Text := '';

                      if JSONObject.FindValue('estabelecimento.inscricoes_estaduais[0].inscricao_estadual') <> nil then
                        edtIE.Text := JSONObject.FindValue('estabelecimento.inscricoes_estaduais[0].inscricao_estadual').Value
                      else
                        edtIE.Text := 'ISENTO';

                      if JSONObject.FindValue('estabelecimento.inscricoes_estaduais[0].ativo') <> nil then
                        edtIEAtivo.Text :=  JSONObject.FindValue('estabelecimento.inscricoes_estaduais[0].ativo').Value
                      else
                        edtIEAtivo.Text := 'INATIVO';

                      if JSONObject.FindValue('estabelecimento.motivo_situacao_cadastral.descricao') <> nil then
                        edtMotivo.Text := JSONObject.FindValue('estabelecimento.motivo_situacao_cadastral.descricao').Value
                      else
                        edtMotivo.Text := '';

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

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Application.Terminate;
end;

end.

