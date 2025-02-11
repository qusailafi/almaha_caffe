
enum ErrorType {
   badRequest(400),
  unauthorized(401),
  serverError(500),
  notFound(404),
  noInternet(1),
   none(2);


  final int code;
  const ErrorType(this.code);
}