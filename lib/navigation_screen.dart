import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_nav_bar_item.dart';
import 'locations.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({final Key? key}) : super(key: key);

  final List<BeamerDelegate<BeamState>> routerDelegates =
      <BeamerDelegate<BeamState>>[
    BeamerDelegate<BeamState>(
      initialPath: '/users',
      locationBuilder: (final BeamState state) {
        debugPrint('userBeamU: ${state.uri.pathSegments}');
        if (state.uri.pathSegments.contains('users')) {
          return UsersLocation(state);
        }
        return NotFound();
      },
    ),
    BeamerDelegate<BeamState>(
      initialPath: '/restaurants',
      locationBuilder: (final BeamState state) {
        debugPrint('userBeamR: ${state.uri.pathSegments}');
        if (state.uri.pathSegments.contains('restaurants')) {
          return RestaurantsLocation(state);
        }
        return NotFound();
      },
    ),
    BeamerDelegate<BeamState>(
      initialPath: '/friends',
      locationBuilder: (final BeamState state) {
        if (state.uri.pathSegments.contains('friends')) {
          return FriendsLocation(state);
        }
        return NotFound();
      },
    ),
    BeamerDelegate<BeamState>(
      initialPath: '/chats',
      locationBuilder: (final BeamState state) {
        if (state.uri.pathSegments.contains('chats')) {
          return ChatsLocation(state);
        }
        return NotFound();
      },
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    const Color _selectedColor = Colors.purple;
    const Color _unselectedColor = Colors.grey;

    final String uriString = Beamer.of(context).state.uri.toString();
    final RxInt _page = 0.obs;
    if (uriString.contains('users')) {
      _page.value = 0;
    } else if (uriString.contains('restaurants')) {
      _page.value = 1;
    } else if (uriString.contains('friends')) {
      _page.value = 2;
    } else if (uriString.contains('chats')) {
      _page.value = 3;
    }

    final PageController _pageController = PageController(
      initialPage: _page.value,
    );

    routerDelegates[_page.value].active = true;
    routerDelegates[_page.value].update();

    _pageController.addListener(() {
      if (_pageController.page == 0) {
        routerDelegates[0].active = true;
        routerDelegates[1].active = false;
        routerDelegates[2].active = false;
        routerDelegates[3].active = false;
        routerDelegates[0].update(rebuild: true);
      } else if (_pageController.page == 1) {
        routerDelegates[1].active = true;
        routerDelegates[0].active = false;
        routerDelegates[2].active = false;
        routerDelegates[3].active = false;
        routerDelegates[1].update(rebuild: true);
      } else if (_pageController.page == 2) {
        routerDelegates[2].active = true;
        routerDelegates[1].active = false;
        routerDelegates[0].active = false;
        routerDelegates[3].active = false;
        routerDelegates[2].update(rebuild: true);
      } else if (_pageController.page == 3) {
        routerDelegates[3].active = true;
        routerDelegates[1].active = false;
        routerDelegates[2].active = false;
        routerDelegates[0].active = false;
        routerDelegates[3].update(rebuild: true);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Beamer.of(context)
              .currentBeamLocation
              .state
              .uri
              .pathSegments
              .printInfo();
          Beamer.of(context).beamToNamed('/friends', replaceCurrent: true);
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (final int newPage) {
          _page.value = newPage;
        },
        children: <Widget>[
          Beamer(
            key: const Key('users-page'),
            routerDelegate: routerDelegates[0],
          ),
          Beamer(
            key: const Key('restaurants-page'),
            routerDelegate: routerDelegates[1],
          ),
          Beamer(
            key: const Key('friends-page'),
            routerDelegate: routerDelegates[2],
          ),
          Beamer(
            key: const Key('chats-page'),
            routerDelegate: routerDelegates[3],
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _page.value,
          onTap: (final int index) {
            if (index != _page.value) {
              _page.value = index;
              routerDelegates[_page.value].active = true;
              routerDelegates[_page.value].update();
              _pageController.jumpToPage(_page.value);
              Beamer.of(context)
                  .currentBeamLocation
                  .state
                  .uri
                  .pathSegments
                  .printInfo();
            }
          },
          items: <BottomNavigationBarItem>[
            navBarItem(
              label: 'Dating',
              icon: const Icon(
                Icons.wc,
                color: _unselectedColor,
              ),
              activeIcon: const Icon(
                Icons.wc,
                color: _selectedColor,
              ),
            ),
            navBarItem(
              label: 'Restaurants',
              icon: const Icon(
                Icons.place_outlined,
                color: _unselectedColor,
              ),
              activeIcon: const Icon(
                Icons.place_outlined,
                color: _selectedColor,
              ),
            ),
            navBarItem(
              label: 'Friends',
              icon: const Icon(
                Icons.people,
                color: _unselectedColor,
              ),
              activeIcon: const Icon(
                Icons.people,
                color: _selectedColor,
              ),
            ),
            navBarItem(
              label: 'Chats',
              icon: const Icon(
                Icons.chat,
                color: _unselectedColor,
              ),
              activeIcon: const Icon(
                Icons.chat,
                color: _selectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
