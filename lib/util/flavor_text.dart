const gSheetsId = String.fromEnvironment('GSHEETSID');

const jsogSheetsCredentialsnKey = {
  'type': 'service_account',
  'project_id': String.fromEnvironment('PROJECTID'),
  'private_key_id': String.fromEnvironment('PRIVATEKEYID'),
  'private_key':
      '-----BEGIN PRIVATE KEY-----\n${const String.fromEnvironment('PRIVATEKEY')}\n-----END PRIVATE KEY-----\n',
  'client_email': String.fromEnvironment('CLIENTEMAIL'),
  'client_id': String.fromEnvironment('CLIENTID'),
  'auth_uri': String.fromEnvironment('AUTHURI'),
  'token_uri': String.fromEnvironment('TOKENURI'),
  'auth_provider_x509_cert_url': String.fromEnvironment('AUTHPROVIDERX509CERTURL'),
  'client_x509_cert_url': String.fromEnvironment('CLIENTX509CERTURL')
};

const admobId = String.fromEnvironment('ADMOBID');
