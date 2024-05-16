import 'package:flutter/material.dart';
import 'package:grass_test/ui/widgets/bottom_navigation_bar_widget.dart';
import 'package:grass_test/common/colors.dart';
import 'package:grass_test/common/text_styles.dart';
import 'package:grass_test/ui/screens/home_screen.dart';

class StructureOrganizationScreen extends StatelessWidget {
  const StructureOrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      appBar: const StructureOrganizationAppBar(),
      body: const EmployeesList(),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 0,
        onTap: (index) {
          // Обработка нажатия
        },
      ),
    );
  }
}

class StructureOrganizationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const StructureOrganizationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Image.asset(
          'assets/icons/arrow_left.png',
          width: 24,
          height: 24,
        ),
      ),
      title: Text(
        'Структура организации',
        style: textStyleMyriadPro_600_20_white(),
      ),
      backgroundColor: CustomColors.greenColorBackground,
    );
  }
}

class EmployeesList extends StatelessWidget {
  const EmployeesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 27.0,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: CustomColors.lightGreyColorBackground,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (BuildContext context, int index) {
          return EmployeeItem(
            employee: employees[index],
            index: index,
          );
        },
      ),
    );
  }
}

class EmployeeItem extends StatelessWidget {
  final Employee employee;
  final int index;

  const EmployeeItem({
    super.key,
    required this.employee,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
        bottom: 8,
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              employee.icon,
              width: 38,
              height: 38,
            ),
            title: Text(
              employee.name,
              style: index == 0
                  ? textStyleMyriadPro_600_16_black()
                  : textStyleMyriadPro_400_16_black(),
            ),
          ),
          const SizedBox(height: 8),
          EmployeeDepartments(departments: employee.departments),
          const SizedBox(height: 16),
          if (index == 0)
            const Divider(color: CustomColors.greyDividerColor, height: 1.0),
        ],
      ),
    );
  }
}

class EmployeeDepartments extends StatelessWidget {
  final List<String> departments;

  const EmployeeDepartments({
    super.key,
    required this.departments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        shape: const Border(bottom: BorderSide.none),
        iconColor: CustomColors.greyArrowsColor,
        collapsedIconColor: CustomColors.greyArrowsColor,
        title: Text(
          'Подразделения',
          style: textStyleMyriadPro_400_16_black(),
        ),
        children: departments
            .map((department) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    department,
                    style: const TextStyle(color: Colors.black),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class Employee {
  final String name;
  final String icon;
  final List<String> departments;

  Employee({
    required this.name,
    required this.icon,
    required this.departments,
  });
}

List<Employee> employees = [
  Employee(
    name: 'Генеральный директор',
    icon: 'assets/icons/director.png',
    departments: ['Отдел продаж', 'Отдел продаж'],
  ),
  Employee(
    name: 'Малыхин Дмитрий',
    icon: 'assets/icons/managers.png',
    departments: ['Отдел продаж', 'Отдел продаж'],
  ),
  Employee(
    name: 'Смирнов Александр',
    icon: 'assets/icons/managers.png',
    departments: ['Отдел продаж', 'Отдел продаж'],
  ),
  Employee(
    name: 'Шалаев Алексей',
    icon: 'assets/icons/managers.png',
    departments: ['Отдел продаж', 'Отдел продаж'],
  ),
  Employee(
    name: 'Климов Алексей',
    icon: 'assets/icons/managers.png',
    departments: ['Отдел продаж', 'Отдел продаж'],
  ),
];
