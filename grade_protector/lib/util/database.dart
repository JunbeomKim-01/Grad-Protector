
class Data{
  static Map<String,dynamic> quizDataset={};
  static Map<String,dynamic> assignDataset={};

  static setQuizdata(var data) async{
    quizDataset=data;
  }
  static getQuizdata() async{
    if(quizDataset==null){
      return {'error':"존재하지 않음"};
    }
      return quizDataset;
  }

  static setAssignData(var data) async{
    assignDataset=data;
  }
  static getAssignData()async{
    if(assignDataset==null){
      return {'error':"존재하지 않음"};
    }
    return assignDataset;
  }
}