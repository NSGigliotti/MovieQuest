String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha inválidos';

    case 'Invalid session token':
      return 'Token inválido';

    case 'EMAIL_ALREADY':
      return 'Email Ja utilizado';

    default:
      return 'Um erro indefinido ocorreu';
  }
}
