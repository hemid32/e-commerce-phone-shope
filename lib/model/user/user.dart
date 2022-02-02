

class UserLocalModel {

  final String name ;
  final String email ;
  final String password ;
  final String nombrePhon ;
  final String image ;
  final String uid ;

  UserLocalModel( {required this.name,required  this.email,required  this.password,required this.nombrePhon ,required  this.image ,required this.uid,});


  factory UserLocalModel.fromJson(Map<String , dynamic> json){
    //print('UserLocalModel') ;
    return  UserLocalModel(
    name: json['name'] ,
      email: json['email'] ,
      password: json['password'] ,
      nombrePhon: json['nombrePhon'] ,
      image: json['image'] ,
      uid:  json['uid']
    ) ;
  }

  Map<String , dynamic> toMap(){


    return {
      'name' : name ,
      'email' :  email ,
      'password' : password ,
      'nombrePhon' : nombrePhon ,
      'image' : image ,
      'uid'  : uid ,

    };

  }


}