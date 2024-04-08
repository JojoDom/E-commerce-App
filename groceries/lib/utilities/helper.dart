class Helper{
  String formatDate(String inputDate) {
  if (inputDate.length != 8) {
   // throw ArgumentError("Input date must be in the format DDMMYYYY");
  }

  String day = inputDate.substring(0, 2);
  String month = inputDate.substring(2, 4);
  String year = inputDate.substring(4);

  return "$day/$month/$year";
}
}