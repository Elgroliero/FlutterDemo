
class MakeUp<T>{

  T color;

  MakeUp(this.color);

  T getColor(){
    return this.color;
  }

}

void main(){

  var makeup = MakeUp<int>(12);
  var makeup2 = MakeUp<String>("123456");
  
  //utilisation de liste
  List<int> liste = [1,2,3,4,5,12];

  for(var l in liste){
    print(l);
  }

  print('-------------');

  //fonction anonyme/callback
  for (var value in liste) {
    print(value);
  }


}

