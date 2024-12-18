class Course{

  String name;
  List<double> notes;

  Course({required this.name, required this.notes});

  double getAverage(){

    double total = 0.0;

    //fold sur une liste qui permet de faire le somme directement
    double sum = notes.fold(0, (prev, note) =>   prev + note);
    print(sum);

    //équivalent à
    for (var note in notes) {
      total += note;
    }
    print(total);

    print("La moyenne de la matière $name est ${(sum / notes.length).toStringAsFixed(2)}");
    return total / notes.length;
  }
}

double getTotalAverage(List<Course> courses){

  double sum = 0.0;

  for(var course in courses){
    sum += course.getAverage();
  }
  return sum  / courses.length;
}

void main(){

  List<Course> courses = [
    Course(name: "Informatique", notes: [15,18,20,20,16,0]),
    Course(name: "Français", notes: [5,8,0,0,16,10]),
  ];

  var average = getTotalAverage(courses);
  print("La moyenne totale est de ${average.toStringAsFixed(2)}");

}