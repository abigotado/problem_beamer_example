import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import 'chats_screen.dart';
import 'dating_screen.dart';
import 'friends_screen.dart';

class UsersLocation extends BeamLocation<BeamState> {
  UsersLocation(final BeamState state) : super(state);

  @override
  List<String> get pathBlueprints => <String>['/users'];

  @override
  List<BeamPage> buildPages(
    final BuildContext context,
    final BeamState state,
  ) =>
      <BeamPage>[
        BeamPage(
          key: const ValueKey<String>('users'),
          title: 'Users',
          type: BeamPageType.noTransition,
          child: const DatingScreen(),
        ),
      ];
}

class RestaurantsLocation extends BeamLocation<BeamState> {
  RestaurantsLocation(final BeamState state) : super(state);

  @override
  List<String> get pathBlueprints => <String>['/restaurants'];

  @override
  List<BeamPage> buildPages(
    final BuildContext context,
    final BeamState state,
  ) =>
      <BeamPage>[
        BeamPage(
          key: const ValueKey<String>('restaurants'),
          title: 'Restaurants',
          type: BeamPageType.noTransition,
          child: const DefaultScreen(),
        ),
      ];
}

class FriendsLocation extends BeamLocation<BeamState> {
  FriendsLocation(final BeamState state) : super(state);

  @override
  List<String> get pathBlueprints => <String>['/friends'];

  @override
  List<BeamPage> buildPages(
    final BuildContext context,
    final BeamState state,
  ) =>
      <BeamPage>[
        BeamPage(
          key: const ValueKey<String>('friends'),
          title: 'Friends',
          type: BeamPageType.noTransition,
          child: const FriendsScreen(),
        ),
      ];
}

class ChatsLocation extends BeamLocation<BeamState> {
  ChatsLocation(final BeamState state) : super(state);

  @override
  List<String> get pathBlueprints => <String>['/chats'];

  @override
  List<BeamPage> buildPages(
    final BuildContext context,
    final BeamState state,
  ) =>
      <BeamPage>[
        BeamPage(
          key: const ValueKey<String>('chats'),
          title: 'Chats',
          type: BeamPageType.noTransition,
          child: const ChatsScreen(),
        ),
      ];
}
