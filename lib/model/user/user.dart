

class UserLocalModel {

  final String name ;
  final String email ;
  final String password ;
  final String nombrePhon ;
  final String image ;

  UserLocalModel({this.name, this.email, this.password, this.nombrePhon , this.image});


  factory UserLocalModel.fromJson(Map<String , dynamic> json){
    return  UserLocalModel(
    name: json['name'] ,
      email: json['email'] ,
      password: json['password'] ,
      nombrePhon: json['nombrePhon'] ,
      image: json['image'] ,
    ) ;
  }

  Map<String , dynamic> toMap(){


    return {
      'name' : name ,
      'email' :  email ,
      'password' : password ,
      'nombrePhon' : nombrePhon ,
      'image' : image ,

    };

  }


}