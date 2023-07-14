class User {
  String? id;
  String userName;
  String userEmail;

  User({
    required this.id,
    required this.userName,
    required this.userEmail,
  });

  static List<User> userList() {
    return [
      User(
        id: '01',
        userName: 'Juan David Salazar Santa',
        userEmail: 'jsalazars@devco.com.co',
      ),
      User(
        id: '02',
        userName: 'Jorge Andres Salazar Santa',
        userEmail: 'asalazars@devco.com.co',
      ),
      User(
        id: '03',
        userName: 'Elliot Escovitch Riaño',
        userEmail: 'eescovitchr@devco.com.co',
      ),
      User(
        id: '04',
        userName: 'Jubel Alberto Correa Barco',
        userEmail: 'jcorreab@devco.com.co',
      ),
    ];
  }
}
