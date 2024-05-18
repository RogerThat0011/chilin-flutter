/// Clase de excepción para manejar varios errores relacionados con la plataforma.
class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Credenciales de inicio de sesión inválidas. Por favor, verifique su información.';
      case 'too-many-requests':
        return 'Demasiadas solicitudes. Por favor, inténtelo de nuevo más tarde.';
      case 'invalid-argument':
        return 'Argumento inválido proporcionado al método de autenticación.';
      case 'invalid-password':
        return 'Contraseña incorrecta. Por favor, inténtelo de nuevo.';
      case 'invalid-phone-number':
        return 'El número de teléfono proporcionado es inválido.';
      case 'operation-not-allowed':
        return 'El proveedor de inicio de sesión está deshabilitado para su proyecto Firebase.';
      case 'session-cookie-expired':
        return 'La cookie de sesión de Firebase ha expirado. Por favor, inicie sesión nuevamente.';
      case 'uid-already-exists':
        return 'El ID de usuario proporcionado ya está en uso por otro usuario.';
      case 'sign_in_failed':
        return 'Inicio de sesión fallido. Por favor, inténtelo de nuevo.';
      case 'network-request-failed':
        return 'La solicitud de red falló. Por favor, verifique su conexión a internet.';
      case 'internal-error':
        return 'Error interno. Por favor, inténtelo de nuevo más tarde.';
      case 'invalid-verification-code':
        return 'Código de verificación inválido. Por favor, introduzca un código válido.';
      case 'invalid-verification-id':
        return 'ID de verificación inválido. Por favor, solicite un nuevo código de verificación.';
      case 'quota-exceeded':
        return 'Cuota excedida. Por favor, inténtelo de nuevo más tarde.';
    // Agrega más casos según sea necesario...
      default:
        return 'Se produjo un error de plataforma inesperado. Por favor, inténtelo de nuevo.';
    }
  }
}
