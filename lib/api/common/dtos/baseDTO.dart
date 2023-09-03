abstract class BaseDTO {
  int? id;

  BaseDTO({this.id});

  Map<String, dynamic> toMap();
}
