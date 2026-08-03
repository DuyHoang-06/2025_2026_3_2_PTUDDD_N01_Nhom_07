import '../models/user.dart';

final fakeUsers = [
  {
    "email": "admin@gmail.com",
    "password": "123456",
    "user": const User(
      id: "1",
      name: "Administrator",
      email: "admin@gmail.com",
      phone: "+84 901 234 567",
      avatar: "https://i.pravatar.cc/200?img=12",
    ),
  },
  {
    "email": "hoang@gmail.com",
    "password": "123456",
    "user": const User(
      id: "2",
      name: "Duy Hoàng",
      email: "hoang@gmail.com",
      phone: "+84 902 111 222",
      avatar: "https://i.pravatar.cc/200?img=33",
    ),
  },
];