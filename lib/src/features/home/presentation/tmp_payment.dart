// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pomakspo/src/core/common/widgets/appbar/custom_appbar.dart';
// import 'package:pomakspo/src/core/common/widgets/buttons/primary_button.dart';
// import 'package:pomakspo/src/core/common/widgets/cards/floating_card.dart';
// import 'package:pomakspo/src/core/common/widgets/rounded_scaffold.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   static const routePath = '/home';
//   static const name = 'home';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return RoundedScaffold(
//       appbar: CustomAppbar(
//         displayAction: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             FloatingCard(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                     child: Image.asset(
//                       'assets/images/beskydy.jpeg',
//                       height: 160,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Spolecna tura z Ostravice na Luksinec a Sepetnou',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         const Divider(),
//                         const SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             _InfoColumn(
//                                 title: 'DATUM', value: 'Sobota 13.6.2025'),
//                             _InfoColumn(title: 'CAS', value: 'od 9:00'),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             _InfoColumn(
//                                 title: 'MISTO',
//                                 value: 'Frydlant nad Ostravici'),
//                             _InfoColumn(title: 'UCASTNICI', value: '12'),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         const Divider(),
//                         const SizedBox(height: 16),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [
//                             Text(
//                               'STARTOVNE',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               '100 Kc',
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               'Prispet vice',
//                               style: TextStyle(
//                                 color: Colors.orange,
//                                 decoration: TextDecoration.underline,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             PrimaryButton(
//               text: 'Login',
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _InfoColumn extends StatelessWidget {
//   const _InfoColumn({
//     required this.title,
//     required this.value,
//   });

//   final String title;
//   final String value;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.w600,
//             color: Colors.grey,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: const TextStyle(
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ],
//     );
//   }
// }
