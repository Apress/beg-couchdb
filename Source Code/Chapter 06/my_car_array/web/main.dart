import 'dart:html';

void main() {
  final cars = [
    {
      'make': 'Ford',
      'model': 'Mustang',
      'year': 2009,
      'body': 'Coupe',
      'color': 'Red',
      'engine': {'gas_type': 'Petrol', 'cubic_capacity': 4600},
      'current_owner': {'name': 'Joe Lennon', 'mileage': 500},
      'previous_owners': [
        {'name': 'John Smith', 'mileage': 1000},
        {'name': 'Jane Hunt', 'mileage': 2500}
      ]
    },
    {
      'make': 'Chevrolet',
      'model': 'Camaro',
      'year': 2001,
      'body': 'Convertible',
      'color': 'Blue',
      'engine': {'gas_type': 'Petrol', 'cubic_capacity': 3800},
      'current_owner': {'name': 'John Daly', 'mileage': 10500},
      'previous_owners': [
        {'name': 'Tony Bellic', 'mileage': 47000},
        {'name': 'Lisa McIntyre', 'mileage': 12050},
        {'name': 'John Thornton', 'mileage': 18500}
      ]
    },
    {
      'make': 'Dodge',
      'model': 'Challenger',
      'year': 2008,
      'body': 'Coupe',
      'color': 'Orange',
      'engine': {'gas_type': 'Petrol', 'cubic_capacity': 6100},
      'current_owner': {'name': 'Susan Long', 'mileage': 800},
      'previous_owners': [
        {'name': 'Devid White', 'mileage': 7500}
      ]
    }
  ];

  final parent = document.body.children;

  for (var car in cars) {
    parent.add(HRElement());
    var mileage_total = 0;

    final car_make = HeadingElement.h2();
    car_make.text = '${car["make"]} ${car["model"]}';
    parent.add(car_make);

    final year = ParagraphElement();
    year.children.add(
        Element.html('<span><strong>Year:</strong> ${car["year"]}</span>'));
    parent.add(year);

    final engine = ParagraphElement();
    engine.children.add(Element.html(
        '<span><strong>Engine:</strong>${(car["engine"] as Map)["cubic_capacity"]}cc ${(car["engine"] as Map)["gas_type"]}</span>'));

    final owners_title = HeadingElement.h3();
    owners_title.text = 'Owners, Past and Present:';
    parent.add(owners_title);

    final owners_list = UListElement();
    final list_element = Element.li();
    Map current_owner = car['current_owner'];
    list_element.text =
        '${current_owner["name"]} (${current_owner["mileage"]} miles)';
    owners_list.children.add(list_element);
    mileage_total += current_owner['mileage'];
    for (Map person in car['previous_owners']) {
      mileage_total += person['mileage'];
      final list_element = Element.li();
      list_element.text = '${person["name"]} (${person["mileage"]} miles)';
      owners_list.children.add(list_element);
    }
    parent.add(owners_list);
    final totalMileage = ParagraphElement();
    totalMileage.innerHtml = '<strong>Total Mileage:</strong> $mileage_total';
    parent.add(totalMileage);
  }
}
// webdev serve
