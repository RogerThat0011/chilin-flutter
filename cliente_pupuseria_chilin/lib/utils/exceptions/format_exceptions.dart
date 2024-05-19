/// Clase de excepción personalizada para manejar varios errores relacionados con el formato.
class TFormatException implements Exception {
  /// El mensaje de error asociado.
  final String message;

  /// Constructor predeterminado con un mensaje de error genérico.
  const TFormatException([this.message = 'Se produjo un error de formato inesperado. Por favor, verifique su entrada.']);

  /// Crea una excepción de formato a partir de un mensaje de error específico.
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  /// Obtiene el mensaje de error correspondiente.
  String get formattedMessage => message;

  /// Crea una excepción de formato a partir de un código de error específico.
  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException('El formato de la dirección de correo electrónico es inválido. Por favor, introduzca un correo electrónico válido.');
      case 'invalid-phone-number-format':
        return const TFormatException('El formato del número de teléfono proporcionado es inválido. Por favor, introduzca un número válido.');
      case 'invalid-date-format':
        return const TFormatException('El formato de fecha es inválido. Por favor, introduzca una fecha válida.');
      case 'invalid-url-format':
        return const TFormatException('El formato de URL es inválido. Por favor, introduzca una URL válida.');
      case 'invalid-credit-card-format':
        return const TFormatException('El formato de la tarjeta de crédito es inválido. Por favor, introduzca un número de tarjeta de crédito válido.');
      case 'invalid-numeric-format':
        return const TFormatException('La entrada debe tener un formato numérico válido.');
    // Agrega más casos según sea necesario...
      default:
        return const TFormatException();
    }
  }
}
