import 'package:calmind_admin/widgets/kelola_mitra_widget.dart';
import 'package:calmind_admin/widgets/kelola_pengguna_widget.dart';
import 'package:flutter/material.dart';

// class KelolaWidget extends StatefulWidget {
//   const KelolaWidget({super.key});

//   @override
//   State<KelolaWidget> createState() => _KelolaWidgetState();
// }

// class _KelolaWidgetState extends State<KelolaWidget>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   List<Widget> _tabViews = [
//     Center(child: Text('Content 1', style: TextStyle(color: Colors.black),)),
//     Center(child: Text('Content 2')),
//     Center(child: Text('Content 3')),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: kToolbarHeight - 8.0,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         children: [
//           TabBar(
//             controller: _tabController,
//             indicator: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               color: Colors.white,
//             ),
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.black,
//             tabs: [
//               Tab(text: 'Tab1'),
//               Tab(text: 'Tab2'),
//               Tab(text: 'Tab3'),
//             ],
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: _tabViews,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// @override
// void initState() {
//   super.initState();
//   _tabController = TabController(length: 3, vsync: this);
// }

// @override
// void dispose() {
//   _tabController.dispose();
//   super.dispose();
// }

// @override
// Widget build(BuildContext context) {
//   return Container(
//     height: kToolbarHeight - 8.0,
//     decoration: BoxDecoration(
//       color: Colors.grey.shade200,
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//     child: DefaultTabController(
//       length: 3,
//       child: Column(
//         children: [
//           TabBar(
//             controller: _tabController,
//             indicator: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               color: Colors.white,
//             ),
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.black,
//             tabs: [
//               Tab(text: 'Tab1'),
//               Tab(text: 'Tab2'),
//               Tab(text: 'Tab3'),
//             ],
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 // Konten Tab 1
//                 Container(
//                   child: Center(
//                     child: Text('Content 1'),
//                   ),
//                 ),
//                 // Konten Tab 2
//                 Container(
//                   child: Center(
//                     child: Text('Content 2'),
//                   ),
//                 ),
//                 Container(
//                   child: Center(
//                     child: Text('Content 3'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }

class KelolaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.only(right: 32, left: 32, top: 16),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: kToolbarHeight - 8.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4.0,
                            spreadRadius: 1.5,
                            offset: Offset(0, 1),
                          ),
                        ],
                        color: Colors.white),

                    tabs: [
                      Tab(
                        child: Text(
                          'Pengguna',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Mitra',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                    labelColor: Colors.black, // Warna teks tab aktif
                    unselectedLabelColor: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      KelolaPenggunaWidget(),
                      KelolaMitraWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
