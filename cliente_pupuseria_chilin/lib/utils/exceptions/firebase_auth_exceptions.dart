/// Clase de excepción personalizada para manejar varios errores relacionados con la autenticación de Firebase.
class TFirebaseAuthException implements Exception {
  /// El código de error asociado con la excepción.
  final String code;

  /// Constructor que toma un código de error.
  TFirebaseAuthException(this.code);

  /// Obtiene el mensaje de error correspondiente basado en el código de error.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'La dirección de correo electrónico ya está registrada. Por favor, utilice un correo electrónico diferente.';
      case 'invalid-email':
        return 'La dirección de correo electrónico proporcionada no es válida. Por favor, introduzca un correo electrónico válido.';
      case 'weak-password':
        return 'La contraseña es demasiado débil. Por favor, elija una contraseña más segura.';
      case 'user-disabled':
        return 'Esta cuenta de usuario ha sido deshabilitada. Por favor, póngase en contacto con el soporte para obtener ayuda.';
      case 'user-not-found':
        return 'Detalles de inicio de sesión no válidos. Usuario no encontrado.';
      case 'wrong-password':
        return 'Contraseña incorrecta. Por favor, compruebe su contraseña e inténtelo de nuevo.';
      case 'invalid-verification-code':
        return 'Código de verificación no válido. Por favor, introduzca un código válido.';
      case 'invalid-verification-id':
        return 'ID de verificación no válido. Por favor, solicite un nuevo código de verificación.';
      case 'quota-exceeded':
        return 'Cuota excedida. Por favor, inténtelo de nuevo más tarde.';
      case 'email-already-exists':
        return 'La dirección de correo electrónico ya existe. Por favor, utilice un correo electrónico diferente.';
      case 'provider-already-linked':
        return 'La cuenta ya está vinculada con otro proveedor.';
      case 'requires-recent-login':
        return 'Esta operación es sensible y requiere autenticación reciente. Por favor, vuelva a iniciar sesión.';
      case 'credential-already-in-use':
        return 'Esta credencial ya está asociada con una cuenta de usuario diferente.';
      case 'user-mismatch':
        return 'Las credenciales suministradas no corresponden al usuario que inició sesión anteriormente.';
      case 'account-exists-with-different-credential':
        return 'Ya existe una cuenta con el mismo correo electrónico pero con credenciales de inicio de sesión diferentes.';
      case 'operation-not-allowed':
        return 'Esta operación no está permitida. Póngase en contacto con el soporte para obtener ayuda.';
      case 'expired-action-code':
        return 'El código de acción ha expirado. Por favor, solicite un nuevo código de acción.';
      case 'invalid-action-code':
        return 'El código de acción es inválido. Por favor, compruebe el código e inténtelo de nuevo.';
      case 'missing-action-code':
        return 'Falta el código de acción. Por favor, proporcione un código de acción válido.';
      case 'user-token-expired':
        return 'El token del usuario ha caducado y se requiere autenticación. Por favor, inicie sesión nuevamente.';
      case 'user-not-found':
        return 'No se encontró ningún usuario para el correo electrónico o UID dado.';
      case 'invalid-credential':
        return 'La credencial suministrada está mal formada o ha caducado.';
      case 'wrong-password':
        return 'La contraseña es inválida. Por favor, compruebe su contraseña e inténtelo de nuevo.';
      case 'user-token-revoked':
        return 'El token del usuario ha sido revocado. Por favor, inicie sesión nuevamente.';
      case 'invalid-message-payload':
        return 'La carga útil del mensaje de verificación de la plantilla de correo electrónico no es válida.';
      case 'invalid-sender':
        return 'El remitente de la plantilla de correo electrónico no es válido. Por favor, verifique el correo electrónico del remitente.';
      case 'invalid-recipient-email':
        return 'La dirección de correo electrónico del destinatario no es válida. Por favor, proporcione un destinatario válido.';
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
      case 'invalid-app-credential':
        return 'La credencial de la aplicación no es válida. Por favor, proporcione una credencial de aplicación válida.';
      case 'session-cookie-expired':
        return 'La cookie de sesión de Firebase ha expirado. Por favor, inicie sesión nuevamente.';
      case 'uid-already-exists':
        return 'El ID de usuario proporcionado ya está en uso por otro usuario.';
      case 'invalid-cordova-configuration':
        return 'La configuración de Cordova proporcionada no es válida.';
      case 'app-deleted':
        return 'Esta instancia de FirebaseApp ha sido eliminada.';
      case 'user-disabled':
        return 'La cuenta de usuario ha sido deshabilitada.';
      case 'user-token-mismatch':
        return 'El token del usuario proporcionado no coincide con el ID de usuario autenticado.';
      case 'web-storage-unsupported':
        return 'El almacenamiento web no es compatible o está desactivado.';
      case 'invalid-credential':
        return 'La credencial suministrada no es válida. Por favor, compruebe la credencial e inténtelo de nuevo.';
      case 'app-not-authorized':
        return 'La aplicación no está autorizada para usar la Autenticación de Firebase con la clave API proporcionada.';
      case 'keychain-error':
        return 'Se produjo un error en el llavero. Por favor, compruebe el llavero e inténtelo de nuevo.';
      case 'internal-error':
        return 'Se produjo un error de autenticación interno. Por favor, inténtelo de nuevo más tarde.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Credenciales de inicio de sesión no válidas.';
      default:
        return 'Se produjo un error de autenticación inesperado. Por favor, inténtelo de nuevo.';
    }
  }
}
