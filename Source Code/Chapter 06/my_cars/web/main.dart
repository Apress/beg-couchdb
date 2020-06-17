import 'dart:html';

void main() {

  final car = {
    'make': 'Ford',
    'model': 'Mustang',
    'year': 2009,
    'body': 'Coupe',
    'color': 'Red',
    'engine': {'gas_type': 'Petrol', 'cubic_capacity': 4600},
    'previous_owners': [
      {'name': 'John Smith', 'mileage': 1000},
      {'name': 'Jane Hunt', 'mileage': 2500}
    ]
  };

  final parent = document.body.children;
  final car_make = HeadingElement.h2();
  car_make.text = '${car["make"]} ${car["model"]}';
  parent.add(car_make);

  final year = ParagraphElement();
  year.children.add(Element.html('<span><strong>Year:</strong> ${car["year"]}</span>'));
  parent.add(year);

  final engine = ParagraphElement();
  engine.children.add(Element.html(
      '<span><strong>Engine:</strong>${(car["engine"] as Map)["cubic_capacity"]}cc ${(car["engine"] as Map)["gas_type"]}</span>'));

  final previous_owners = HeadingElement.h3();
  previous_owners.text = 'Previous Owners:';
  parent.add(previous_owners);

  final previous_owners_list = UListElement();

  for (Map person in car['previous_owners']) {
    final list_element = Element.li();
    list_element.text = '${person["name"]} (${person["mileage"]} miles)';
    previous_owners_list.children.add(list_element);
  }
  parent.add(previous_owners_list);
}
// webdev serve
