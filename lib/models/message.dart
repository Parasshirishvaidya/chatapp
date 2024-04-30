class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;


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