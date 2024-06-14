import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/data/model/profile/profile_info_model.dart';
import 'package:main_platform/app/domain/entity/profile/profile_info_entity.dart';
import 'package:main_platform/app/presentation/bloc/profile/profile_info_cubit.dart';
import 'package:main_platform/app/presentation/bloc/profile/profile_info_state.dart';
import 'package:main_platform/app/presentation/screens/profile/avtivites_view_screen.dart';
import 'package:main_platform/app/presentation/screens/profile/communities_view_screen.dart';
import 'package:main_platform/app/presentation/screens/profile/posts_view_screen.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/constants/api_constants.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';

@RoutePage()
class ProfileViewScreen extends StatefulWidget {
  final String userId;
  const ProfileViewScreen(@PathParam('id') this.userId, {super.key});

  @override
  State<StatefulWidget> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late bool isSelf;

  @override
  void initState() {
    super.initState();
    isSelf = widget.userId == getIt<AuthCache>().user!.id;
    _tabController = TabController(length: isSelf ? 3 : 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getProfileInfo(widget.userId),
      child: Scaffold(
        body: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            if (state is ProfileInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileInfoSuccess) {
              String? imgUrl = state.profile.avatar;
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 200,
                      color: const Color(0xff3680f4),
                      child: SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: imgUrl == null
                                    ? Image.asset(
                                        "assets/images/avatar.png",
                                        height: 100,
                                        width: 100,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl:
                                            ApiConstants.storageUrl + imgUrl,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.contain,
                                      ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.profile.displayName!,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 50.w),
                                            PopupMenuButton(
                                              icon: const Icon(Icons.more_vert,
                                                  color: Colors.white),
                                              onSelected: (value) {
                                                switch (value) {
                                                  case 'Edit Profile':
                                                    context.router.push(
                                                        const EditProfileRoute());
                                                    break;
                                                  case 'Privacy Settings':
                                                    context.router.push(
                                                        const PrivacySettingsRoute());
                                                    break;
                                                  case 'Connect':
                                                    // Handle connect action
                                                    break;
                                                  case 'Message':
                                                    // Handle message action
                                                    break;
                                                }
                                              },
                                              itemBuilder: (context) => isSelf
                                                  ? [
                                                      PopupMenuItem(
                                                          value: 'Edit Profile',
                                                          onTap: () {
                                                            context.router.push(
                                                                const EditProfileRoute());
                                                          },
                                                          child: const Text(
                                                              'Edit Profile')),
                                                      PopupMenuItem(
                                                          value:
                                                              'Privacy Settings',
                                                          onTap: () {
                                                            context.router.push(
                                                                const PrivacySettingsRoute());
                                                          },
                                                          child: const Text(
                                                              'Privacy Settings')),
                                                    ]
                                                  : [
                                                      const PopupMenuItem(
                                                          value: 'Block',
                                                          child: Text('Block')),
                                                      const PopupMenuItem(
                                                          value: 'Report',
                                                          child:
                                                              Text('Report')),
                                                    ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          [].join(' '),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 5.sp,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                            "${state.profile.connections} connections",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: isSelf
                                                ? [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              shape:
                                                                  MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          )),
                                                          onPressed: () {
                                                            handleButtonPress(
                                                                context,
                                                                state
                                                                    .profile
                                                                    .connection!
                                                                    .status,
                                                                state
                                                                    .profile
                                                                    .connection!
                                                                    .sender);
                                                          },
                                                          child: Text(
                                                            getButtonText(state
                                                                .profile
                                                                .connection),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 7.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              shape:
                                                                  MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          )),
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Share Profile',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 7.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )),
                                                    )
                                                  ]
                                                : [
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape:
                                                                MaterialStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        )),
                                                        onPressed: () =>
                                                            handleButtonPress(
                                                                context,
                                                                state
                                                                    .profile
                                                                    .connection!
                                                                    .status,
                                                                state
                                                                    .profile
                                                                    .connection!
                                                                    .sender),
                                                        child: Text(
                                                          getButtonText(
                                                            state.profile
                                                                .connection,
                                                          ),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 7.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )),
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape:
                                                                MaterialStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        )),
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Message',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 7.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ))
                                                  ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        TabBar(controller: _tabController, tabs: getTabs()),
                        Expanded(
                            child: TabBarView(
                                controller: _tabController,
                                children: getTabViews())),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is ProfileInfoFailure) {
              return const Center(
                  child: Text('Failed to load profile information'));
            } else {
              return const Center(child: Text('Unexpected state'));
            }
          },
        ),
      ),
    );
  }

  List<Widget> getTabs() {
    return isSelf
        ? const [
            Tab(text: "Posts"),
            Tab(text: "Activities"),
            Tab(text: "Communities")
          ]
        : const [Tab(text: "Posts")];
  }

  List<Widget> getTabViews() {
    return isSelf
        ? const [
            Padding(padding: EdgeInsets.all(8), child: PostsViewScreen()),
            ActivitiesViewScreen(),
            CommunitiesViewScreen()
          ]
        : const [Padding(padding: EdgeInsets.all(8), child: PostsViewScreen())];
  }

  String getButtonText(ConnectionStatusEntity? connection) {
    if (connection == null) {
      return 'Connect';
    }
    if (connection.status == UserConnectionStatus.declined ||
        connection.status == UserConnectionStatus.none) {
      return 'Connect';
    } else if (connection.status == UserConnectionStatus.connected) {
      return 'Remove Connection';
    } else if (connection.status == UserConnectionStatus.pending &&
        connection.sender) {
      return 'Cancel Connection';
    } else if (connection.status == UserConnectionStatus.pending &&
        !connection.sender) {
      return 'Respond to Request';
    } else {
      return 'Connect';
    }
  }

  void handleButtonPress(
      BuildContext context, UserConnectionStatus status, bool sender) {
    if (status == UserConnectionStatus.declined ||
        status == UserConnectionStatus.none) {
      log("connect");
    } else if (status == UserConnectionStatus.connected) {
      log("remove connection");
    } else if (status == UserConnectionStatus.pending && sender) {
      log("canecl connection");
    } else if (status == UserConnectionStatus.pending && !sender) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Connection Request'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Handle accept connection action
                  },
                  child: const Text('Accept Connection'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Handle decline connection action
                  },
                  child: const Text('Decline Connection'),
                ),
              ],
            ),
          );
        },
      );
    } else {
      log("connect");
    }
  }
}
