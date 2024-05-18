/// Clase de excepción para manejar varios errores.
class TExceptions implements Exception {
  /// El mensaje de error asociado.
  final String message;

  /// Constructor predeterminado con un mensaje de error genérico.
  const TExceptions([this.message = 'Se produjo un error inesperado. Por favor, inténtelo de nuevo.']);

  /// Crea una excepción de autenticación a partir de un código de excepción de autenticación de Firebase.
  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('La dirección de correo electrónico ya está registrada. Por favor, utilice un correo electrónico diferente.');
      case 'invalid-email':
        return const TExceptions('La dirección de correo electrónico proporcionada no es válida. Por favor, introduzca un correo electrónico válido.');
      case 'weak-password':
        return const TExceptions('La contraseña es demasiado débil. Por favor, elija una contraseña más segura.');
      case 'user-disabled':
        return const TExceptions('Esta cuenta de usuario ha sido deshabilitada. Por favor, póngase en contacto con el soporte para obtener ayuda.');
      case 'user-not-found':
        return const TExceptions('Detalles de inicio de sesión no válidos. Usuario no encontrado.');
      case 'wrong-password':
        return const TExceptions('Contraseña incorrecta. Por favor, compruebe su contraseña e inténtelo de nuevo.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return const TExceptions('Credenciales de inicio de sesión no válidas. Por favor, verifique su información.');
      case 'too-many-requests':
        return const TExceptions('Demasiadas solicitudes. Por favor, inténtelo de nuevo más tarde.');
      case 'invalid-argument':
        return const TExceptions('Argumento no válido proporcionado al método de autenticación.');
      case 'invalid-password':
        return const TExceptions('Contraseña incorrecta. Por favor, inténtelo de nuevo.');
      case 'invalid-phone-number':
        return const TExceptions('El número de teléfono proporcionado no es válido.');
      case 'operation-not-allowed':
        return const TExceptions('El proveedor de inicio de sesión está deshabilitado para su proyecto de Firebase.');
      case 'session-cookie-expired':
        return const TExceptions('La cookie de sesión de Firebase ha expirado. Por favor, inicie sesión nuevamente.');
      case 'uid-already-exists':
        return const TExceptions('El ID de usuario proporcionado ya está en uso por otro usuario.');
      case 'sign_in_failed':
        return const TExceptions('Error al iniciar sesión. Por favor, inténtelo de nuevo.');
      case 'network-request-failed':
        return const TExceptions('La solicitud de red falló. Por favor, verifique su conexión a Internet.');
      case 'internal-error':
        return const TExceptions('Error interno. Por favor, inténtelo de nuevo más tarde.');
      case 'invalid-verification-code':
        return const TExceptions('Código de verificación no válido. Por favor, introduzca un código válido.');
      case 'invalid-verification-id':
        return const TExceptions('ID de verificación no válido. Por favor, solicite un nuevo código de verificación.');
      case 'quota-exceeded':
        return const TExceptions('Cuota excedida. Por favor, inténtelo de nuevo más tarde.');
      default:
        return const TExceptions();
    }
  }
}
