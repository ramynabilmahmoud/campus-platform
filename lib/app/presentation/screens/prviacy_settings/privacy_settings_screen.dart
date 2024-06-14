import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/privacy_settings/privacy_settings_cubit.dart';
import 'package:main_platform/app/presentation/bloc/privacy_settings/privacy_settings_state.dart';
import 'package:main_platform/app/presentation/widgets/custom_privacy_field_widget.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';

@RoutePage()
class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PrivacySettingsCubit>().loadSettings();
    });

    return BlocListener<PrivacySettingsCubit, PrivacySettingsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (ModalRoute.of(context)!.isCurrent != true) {
          Navigator.of(context).pop();
        }
        if (state.status == PrivacySettingsStatus.loading) {
          showCustomDialog(context: context, content: [
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text(LocaleKeys.loading.tr())
          ]);
        } else if (state.status == PrivacySettingsStatus.error) {
          showCustomDialog(
              context: context,
              crossAxisAlignment: CrossAxisAlignment.start,
              title: LocaleKeys.failed.tr(),
              dismissable: true,
              icon: Icons.warning_rounded,
              content: [
                Text(state.error?.message.tr() ??
                    LocaleKeys.error_unexpeceted_error.tr())
              ],
              actions: [
                TextButton(
                  child: Text(LocaleKeys.close.tr()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.privacy_settings_title.tr(),
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.w900)),
        ),
        body: BlocListener<PrivacySettingsCubit, PrivacySettingsState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (ModalRoute.of(context)!.isCurrent != true) {
              Navigator.of(context).pop();
            }
            if (state.status == PrivacySettingsStatus.loading) {
              showCustomDialog(context: context, content: [
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                Text(LocaleKeys.loading.tr())
              ]);
            } else if (state.status == PrivacySettingsStatus.error) {
              showCustomDialog(
                  context: context,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  title: LocaleKeys.failed.tr(),
                  dismissable: true,
                  icon: Icons.warning_rounded,
                  content: [
                    Text(state.error?.message.tr() ??
                        LocaleKeys.error_unexpeceted_error.tr())
                  ],
                  actions: [
                    TextButton(
                      child: Text(LocaleKeys.close.tr()),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ]);
            }
          },
          child: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocBuilder<PrivacySettingsCubit, PrivacySettingsState>(
                        builder: (context, state) => CustomPrivacyFieldWidget(
                            title: LocaleKeys.privacy_settings_private_profile,
                            description: LocaleKeys
                                .privacy_settings_private_profile_description,
                            enabled: state.entity.isPrivateProfile ?? false,
                            onChanged: (value) => context
                                .read<PrivacySettingsCubit>()
                                .updatePrivateProfile(value)),
                      ),
                      const Divider(),
                      BlocBuilder<PrivacySettingsCubit, PrivacySettingsState>(
                        buildWhen: (previous, current) =>
                            previous.entity.isAcceptingConnections !=
                            current.entity.isAcceptingConnections,
                        builder: (context, state) => CustomPrivacyFieldWidget(
                          title:
                              LocaleKeys.privacy_settings_accepting_connection,
                          description: LocaleKeys
                              .privacy_settings_accepting_connection_description,
                          enabled: state.entity.isAcceptingConnections ?? false,
                          onChanged: (value) => context
                              .read<PrivacySettingsCubit>()
                              .updateAcceptingConnections(value),
                        ),
                      ),
                      const Divider(),
                      BlocBuilder<PrivacySettingsCubit, PrivacySettingsState>(
                        buildWhen: (previous, current) =>
                            previous.entity.isShowingConnectionsCount !=
                            current.entity.isShowingConnectionsCount,
                        builder: (context, state) => CustomPrivacyFieldWidget(
                            title: LocaleKeys.privacy_settings_show_connections,
                            description: LocaleKeys
                                .privacy_settings_show_connections_description,
                            enabled:
                                state.entity.isShowingConnectionsCount ?? false,
                            onChanged: (value) => context
                                .read<PrivacySettingsCubit>()
                                .updateShowConnectionsCount(value)),
                      ),
                      const Divider(),
                      BlocBuilder<PrivacySettingsCubit, PrivacySettingsState>(
                        buildWhen: (previous, current) =>
                            previous.entity.isPrivatePhoneNumber !=
                            current.entity.isPrivatePhoneNumber,
                        builder: (context, state) => CustomPrivacyFieldWidget(
                            title: LocaleKeys.privacy_settings_private_phone,
                            description: LocaleKeys
                                .privacy_settings_private_phone_description,
                            enabled: state.entity.isPrivatePhoneNumber ?? false,
                            onChanged: (value) => context
                                .read<PrivacySettingsCubit>()
                                .updatePhoneNumber(value)),
                      ),
                      const Divider(),
                      BlocBuilder<PrivacySettingsCubit, PrivacySettingsState>(
                        buildWhen: (previous, current) =>
                            previous.entity.isReceivingPrivateMessages !=
                            current.entity.isReceivingPrivateMessages,
                        builder: (context, state) => CustomPrivacyFieldWidget(
                          title: LocaleKeys.privacy_settings_receive_dm,
                          description: LocaleKeys
                              .privacy_settings_receive_dm_description,
                          enabled:
                              state.entity.isReceivingPrivateMessages ?? false,
                          onChanged: (value) => context
                              .read<PrivacySettingsCubit>()
                              .updateReceivingPrivateMessage(value),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: FilledButton.icon(
                            onPressed: () {
                              context
                                  .read<PrivacySettingsCubit>()
                                  .saveSettings();
                            },
                            icon: const Icon(Icons.save),
                            label: Text(LocaleKeys.save.tr()),
                            style: FilledButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                          ),
                        ),
                      ),
                    ])),
          ),
        ),
      ),
    );
  }
}
