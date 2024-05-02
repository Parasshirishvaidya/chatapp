<<<<<<< Updated upstream
=======
import 'package:cloud_firestore/cloud_firestore.dart';

>>>>>>> Stashed changes
class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

<<<<<<< Updated upstream

  Message(
    {
      required this.senderID,
      required this.senderEmail,
      required this.receiverID,
      required this.message,
      required this.timeStamp,

    }
  );
Map<String,dynamic> toMap()
{
return{
  'senderID':senderID,
  'senderEmail':receiverID,
  'receiverID' : receiverID,
  'message' : message,
  'timestamp': timestamp,

}
}
}
=======
  const Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': receiverID,
      'receiverID': receiverID,
      'message': message,
      'time': timestamp,
    };
  }
}
>>>>>>> Stashed changes
