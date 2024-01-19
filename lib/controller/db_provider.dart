import 'dart:io';

import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/db/second_function/function2.dart';
import 'package:contracterApp/db/services/db_Services.dart';
import 'package:contracterApp/main.dart';
import 'package:contracterApp/view/bottom_bar.dart';
import 'package:contracterApp/view/loginPage.dart';
import 'package:contracterApp/view/workersDetails.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ValueNotifier<List<Jobworkers>> jobworkernotifier=ValueNotifier([]);

// Future<void> getAllStud()async{
//    final studentDb= await Hive.openBox<Jobworkers>("jobworker_db");
//   jobworkernotifier.value.clear();
//   jobworkernotifier.value.addAll(studentDb.values);
//   jobworkernotifier.notifyListeners(); 
// }
// Future <void> addstud(Jobworkers value)async
// {
//   final jobworkerDb = await Hive.openBox<Jobworkers>("jobworker_db");
//     await jobworkerDb.add(value);
//     getAllStud();
// }
// Future<void> deletestud(int index)async{
//   final jobworkerDb= await Hive.openBox<Jobworkers>("jobworker_db"); 
//    await jobworkerDb.deleteAt(index);
//   getAllStud();
// }
// Future<void>getstoreditems()async{
//    final jobworkerDb = await Hive.openBox<Jobworkers>("jobworker_db");
   
// }
//  void checkLogin(BuildContext context,_username,_password)async{
//   final _usernames=_username.text;
//   final _passwords=_password.text;

//   if(_usernames=='mubu'&& _passwords=='7736'){
//     final _sharedprefe=await SharedPreferences.getInstance();
//     await _sharedprefe.setBool(save_key,true);
//       print('suuccessful');
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
//        }else{
//     final _errormessage='username password doesnot match';
//   }

//   }
//     Future<void> gotoScreen(context)async{
//     await Future.delayed(Duration(seconds: 4));
//   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => UserLogin(),));
//   }
//   Future<void>checkuserlogin(context)async{
//     final _sharedprefer= await SharedPreferences.getInstance();
//     final _userlogin=_sharedprefer.getBool(save_key);
//    if(_userlogin==null){
//     UserLogin();
//    }else{
//   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomeScreen()));

//    }
//   }
//  void showPopupMenu(BuildContext context) {
//     showMenu(
//       context: context,
//       position: RelativeRect.fromRect(
//       Rect.fromPoints(
//           Offset(100, 100), 
//           Offset(200, 200),
//         ),
//         Offset.zero & MediaQuery.of(context).size
//       ),
//       items: [
        
//         PopupMenuItem(
//           child: ListTile(
//             leading: Icon(Icons.logout),
//             title: Text('Logout'),
//             onTap: () {
//               Logout();
//               logout();
//               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserLogin(),), (route) => false);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// Future<void> Logout()async{
//   final jobworkerDb= await Hive.openBox<Jobworkers>("jobworker_db"); 
//    await jobworkerDb.clear();
//   getAllStud();
// }
// Future<void> updatestudent(int index)async{
//     final jobworkerDb=await Hive.openBox<Jobworkers>('student_db');
//       final stdupdate = Jobworkers(
//         name: _namecontroller.text,
//          number:_numberController.text ,
//          age:_agecontroller.text ,
//          jobcategories:_jobcategories.text ,
//          image: image,
//         );
//         await jobworkerDb.putAt(index, stdupdate);
//         getAllStud();
//   }
// import 'package:flutter/material.dart';
// import 'package:mini/model/model.dart';
// import 'package:mini/service/service.dart';

// class DbProvider extends ChangeNotifier{
//   List<TransactionModel> transaction = [];
//   DbService dbservice = DbService();

//   Future getAllTransactions()async{
//     transaction = await dbservice.getAllTransaction();
//     notifyListeners();
//   }

//   Future addTransaction(TransactionModel value)async{
//     await dbservice.addTransaction(value);
//     getAllTransactions();
//   }

//   Future deleteTransaction (int index)async{
//     await dbservice.deleteTransaction(index);
//     getAllTransactions();
//   }

//   Future updateTransaction(TransactionModel value, index)async{
//     await dbservice.updateTransaction(value, index);
//     getAllTransactions();
//   }
// }

class DbProvider extends ChangeNotifier{

  List<Jobworkers> workersList=[];
  Jobworkservices DBservices=Jobworkservices();
  
  Future getAllStud()async{
    workersList=await DBservices.getAllStud();
    notifyListeners();
  }
  
Future <void>addworkers(Jobworkers value)async{
 await DBservices.addstud(value);
 getAllStud();
 notifyListeners();
}
 Future deletestud(int index)async{
  await DBservices.deletestud(index);
  getAllStud();
  notifyListeners();
 }
  void showPopupMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
      Rect.fromPoints(
          Offset(100, 100), 
          Offset(200, 200),
        ),
        Offset.zero & MediaQuery.of(context).size
      ),
      items: [
        
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Logout();
              logout();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserLogin(),), (route) => false);
            },
          ),
        ),
      ],
    );
    
  }
  Future<void> Logout()async{
  final jobworkerDb= await Hive.openBox<Jobworkers>("jobworker_db"); 
   await jobworkerDb.clear();
  getAllStud();
  notifyListeners();
}
 void checkLogin(BuildContext context,_username,_password)async{
  final _usernames=_username.text;
  final _passwords=_password.text;

  if(_usernames=='mubu'&& _passwords=='7736'){
    final _sharedprefe=await SharedPreferences.getInstance();
    await _sharedprefe.setBool(save_key,true);
      print('suuccessful');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
       }else{
    final _errormessage='username password doesnot match';
  }

  }
    Future<void> gotoScreen(context)async{
    await Future.delayed(Duration(seconds: 4));
  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => UserLogin(),));
  }
  Future<void>checkuserlogin(context)async{
    final _sharedprefer= await SharedPreferences.getInstance();
    final _userlogin=_sharedprefer.getBool(save_key);
   if(_userlogin==null){
    UserLogin();
   }else{
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomeScreen()));

   }
  }
 
    File? selectimage;
   fromgallery() async {
    
    final returnedimage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      selectimage = File(returnedimage!.path);
      notifyListeners();
  
  }

  fromcam() async {
    
    File? selectimage;
    final returnedimage =
    await ImagePicker().pickImage(source: ImageSource.camera);
  
    selectimage = File(returnedimage!.path);
    notifyListeners();
  }
   Future<void> editTrip(int id, Jobworkers value) async {
    await DBservices.updateTrip(id, value);
    await getAllStud();
  }
}