// import 'dart:convert';

// class LeaderBoardModel { 
//   final String name;
//   final String email;
 

//   LeaderBoardModel({ 
//     required this.name,
//     required this.email, required String userId, required String totalCalory,
//   });

//   Map<String, dynamic> toMap() {
//     return { 
//       'name': name,
//       'email': email,
//     };
//   }

//   factory LeaderBoardModel.fromMap(Map<String, dynamic> map) {
//     return LeaderBoardModel( 
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory LeaderBoardModel.fromJson(String source) =>
//       LeaderBoardModel.fromMap(json.decode(source));

//   LeaderBoardModel copyWith({ 
//     String? name,
//     String? email,
//   }) {
//     return LeaderBoardModel( 
//       name: name ?? this.name,
//       email: email ?? this.email,
//     );
//   }
// }
