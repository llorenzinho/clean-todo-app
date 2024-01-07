// A model should contain all variables and base functions
// to parse the object from apis or to send the object to apis
// It should also contain the logic to copy the object

mixin Model {
  Model copy();
  Map<String, dynamic> toJson();
}
