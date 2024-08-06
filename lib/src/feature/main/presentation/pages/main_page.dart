import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "../../../../common/routes/app_route_name.dart";
import "../../view_model/main_vm.dart";

class MainPage extends ConsumerWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainVM);
    final MainVM con = ref.read(mainVM);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: con.currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => con.changeIndex(index, context),
        // selectedFontSize: 12.sp,
        // unselectedFontSize: 12.sp,
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: const TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w400),
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet_outlined),
              activeIcon: Icon(
                Icons.text_snippet_outlined,
                color: Colors.amberAccent,
              ),
              label: "Records"),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_sharp),
              activeIcon: Icon(
                Icons.pie_chart_sharp,
                color: Colors.amberAccent,
              ),
              label: "Statistics"),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                ],
              ),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              activeIcon: Icon(
                Icons.receipt_long,
                color: Colors.amberAccent,
              ),
              label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp),
              activeIcon: Icon(
                Icons.person_sharp,
                color: Colors.amberAccent,
              ),
              label: "Me"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            context.go(AppRouteName.addDataPage);
          },
          icon: const Icon(Icons.add, color: Colors.black,),
          color: Colors.white,
        ),
      )
    );
  }
}
