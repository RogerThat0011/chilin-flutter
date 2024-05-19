/// Clase de excepción personalizada para manejar varios errores relacionados con Firebase.
class TFirebaseException implements Exception {
  /// El código de error asociado con la excepción.
  final String code;

  /// Constructor que toma un código de error.
  TFirebaseException(this.code);

  /// Obtiene el mensaje de error correspondiente basado en el código de error.
  String get message {
    switch (code) {
      case 'unknown':
        return 'Se produjo un error desconocido de Firebase. Por favor, inténtelo de nuevo.';
      case 'invalid-custom-token':
        return 'El formato del token personalizado es incorrecto. Por favor, verifique su token personalizado.';
      case 'custom-token-mismatch':
        return 'El token personalizado corresponde a una audiencia diferente.';
      case 'user-disabled':
        return 'La cuenta de usuario ha sido deshabilitada.';
      case 'user-not-found':
        return 'No se encontró ningún usuario para el correo electrónico o UID dado.';
      case 'invalid-email':
        return 'La dirección de correo electrónico proporcionada no es válida. Por favor, introduzca un correo electrónico válido.';
      case 'email-already-in-use':
        return 'La dirección de correo electrónico ya está registrada. Por favor, utilice un correo electrónico diferente.';
      case 'wrong-password':
        return 'Contraseña incorrecta. Por favor, compruebe su contraseña e inténtelo de nuevo.';
      case 'weak-password':
        return 'La contraseña es demasiado débil. Por favor, elija una contraseña más segura.';
      case 'provider-already-linked':
        return 'La cuenta ya está vinculada con otro proveedor.';
      case 'operation-not-allowed':
        return 'Esta operación no está permitida. Contacte al soporte para obtener ayuda.';
      case 'invalid-credential':
        return 'La credencial proporcionada está mal formada o ha caducado.';
      case 'invalid-verification-code':
        return 'Código de verificación no válido. Por favor, introduzca un código válido.';
      case 'invalid-verification-id':
        return 'ID de verificación no válido. Por favor, solicite un nuevo código de verificación.';
      case 'captcha-check-failed':
        return 'La respuesta reCAPTCHA no es válida. Por favor, inténtelo de nuevo.';
      case 'app-not-authorized':
        return 'La aplicación no está autorizada para usar la Autenticación de Firebase con la clave API proporcionada.';
      case 'keychain-error':
        return 'Se produjo un error en el llavero. Por favor, compruebe el llavero e inténtelo de nuevo.';
      case 'internal-error':
        return 'Se produjo un error de autenticación interno. Por favor, inténtelo de nuevo más tarde.';
      case 'invalid-app-credential':
        return 'La credencial de la aplicación no es válida. Por favor, proporcione una credencial de aplicación válida.';
      case 'user-mismatch':
        return 'Las credenciales proporcionadas no corresponden al usuario que inició sesión anteriormente.';
      case 'requires-recent-login':
        return 'Esta operación es sensible y requiere autenticación reciente. Por favor, inicie sesión nuevamente.';
      case 'quota-exceeded':
        return 'Cuota excedida. Por favor, inténtelo de nuevo más tarde.';
      case 'account-exists-with-different-credential':
        return 'Ya existe una cuenta con el mismo correo electrónico pero con credenciales de inicio de sesión diferentes.';
      case 'missing-iframe-start':
        return 'Falta la etiqueta de inicio del iframe en la plantilla de correo electrónico.';
      case 'missing-iframe-end':
        return 'Falta la etiqueta de fin del iframe en la plantilla de correo electrónico.';
      case 'missing-iframe-src':
        return 'Falta el atributo src del iframe en la plantilla de correo electrónico.';
      case 'auth-domain-config-required':
        return 'La configuración authDomain es necesaria para el enlace de verificación del código de acción.';
      case 'missing-app-credential':
        return 'Falta la credencial de la aplicación. Por favor, proporcione credenciales de aplicación válidas.';
      case 'session-cookie-expired':
        return 'La cookie de sesión de Firebase ha expirado. Por favor, inicie sesión nuevamente.';
      case 'uid-already-exists':
        return 'El ID de usuario proporcionado ya está en uso por otro usuario.';
      case 'web-storage-unsupported':
        return 'El almacenamiento web no es compatible o está desactivado.';
      case 'app-deleted':
        return 'Esta instancia de FirebaseApp ha sido eliminada.';
      case 'user-token-mismatch':
        return 'El token del usuario proporcionado no coincide con el ID de usuario autenticado.';
      case 'invalid-message-payload':
        return 'La carga útil del mensaje de verificación de la plantilla de correo electrónico es inválida.';
      case 'invalid-sender':
        return 'El remitente de la plantilla de correo electrónico es inválido. Por favor, verifique el correo electrónico del remitente.';
      case 'invalid-recipient-email':
        return 'La dirección de correo electrónico del destinatario es inválida. Por favor, proporcione un destinatario válido.';
      case 'missing-action-code':
        return 'Falta el código de acción. Por favor, proporcione un código de acción válido.';
      case 'user-token-expired':
        return 'El token del usuario ha expirado y se requiere autenticación. Por favor, inicie sesión nuevamente.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Credenciales de inicio de sesión no válidas.';
      case 'expired-action-code':
        return 'El código de acción ha expirado. Por favor, solicite un nuevo código de acción.';
      case 'invalid-action-code':
        return 'El código de acción es inválido. Por favor, compruebe el código e inténtelo de nuevo.';
      case 'credential-already-in-use':
        return 'Esta credencial ya está asociada con una cuenta de usuario diferente.';
      default:
        return 'Se produjo un error inesperado de Firebase. Por favor, inténtelo de nuevo.';
    }
  }
}
