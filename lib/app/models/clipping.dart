class Clipping{

  Clipping(
    this.book,
    this.author,
    this.type,
    this.location,
    this.date,
    this.clipping,
  );

  final String book;
  final String author;
  final String type;
  final String location;
  final String date;
  final String clipping;

  String toString(){
    return "Book :" + this.book + "\nAuthor: " + this.author +
        "\Type: " + this.type + "\nLocation: " + this.location +
        "\nDate: " + this.date + "\nClipping: " + this.clipping;
  }

}