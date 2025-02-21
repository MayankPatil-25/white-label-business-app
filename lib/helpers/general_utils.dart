
extension DateUtils on DateTime {

  String getFormattedDate() {
    return "${this.year.toString()}-${this.month.toString().padLeft(2,'0')}-${this.day.toString().padLeft(2,'0')}";
  }
}