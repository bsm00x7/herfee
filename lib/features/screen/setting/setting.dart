import 'package:flutter/material.dart';
import 'package:herfee/common_widgets/container_decoration.dart';
import 'package:herfee/features/auth/shared_preferences/preference_manager.dart';
import 'package:herfee/features/screen/setting/setting_controller.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../generated/controller/lang_local_controller.dart';
import '../../../generated/l10n.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final S s = S.of(context);
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => ControllerSetting(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          foregroundColor: theme.appBarTheme.foregroundColor,
          backgroundColor: theme.appBarTheme.backgroundColor,
          iconTheme: theme.appBarTheme.iconTheme,
          actionsIconTheme: theme.appBarTheme.actionsIconTheme,
          elevation: theme.appBarTheme.elevation,
          title: Text(s.Setting, style: theme.textTheme.headlineLarge),
        ),
        body: ContainerDecoration(
          theme: theme,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Consumer<ControllerSetting>(
                  builder: (context, provider, child) {
                    return ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(
                        "${s.Online}  /${s.Offline}",
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      style: theme.listTileTheme.style,
                      leading: provider.isOnline
                          ? Icon(Icons.wifi)
                          : Icon(Icons.wifi_off),
                      trailing: Switch(
                        value: provider.isOnline,
                        onChanged: (value) => provider.changeStauts(value),
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  LangController().setLocale('ar');
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/image/Flag_of_Tunisia.svg.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "Arabic",
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              InkWell(
                                onTap: () {
                                  LangController().setLocale('fr');
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/image/Flag_of_French.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "French",
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              InkWell(
                                onTap: () {
                                  LangController().setLocale('en');
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/image/Flag_of_Englsih.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "English",
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text(
                    s.UpdateLanguages,
                    style: theme.textTheme.titleMedium!.copyWith(fontSize: 20),
                  ),
                  style: theme.listTileTheme.style,
                  leading: Icon(Icons.language),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
