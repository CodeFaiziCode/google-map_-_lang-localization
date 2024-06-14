import 'package:flutter/material.dart';
import 'package:gmap/Localisation.dart';
import 'package:gmap/google_map_view.dart';
import 'package:gmap/lang%20controller/lang_controller.dart';
import 'package:gmap/web_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum language { english, spanish, turkish, urdu }

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeAppBar),
        actions: [
          Consumer<LanguageController>(builder: (context, provider, child) {
            return PopupMenuButton(
                onSelected: (language item) {
                  if (language.english.name == item.name) {
                    provider.changeLanguage(Locale('en'));
                  } else if (language.spanish.name == item.name) {
                    provider.changeLanguage(Locale('es'));
                  } else if (language.turkish.name == item.name) {
                    provider.changeLanguage(Locale('tr'));
                  } else if (language.urdu.name == item.name) {
                    provider.changeLanguage(Locale('ur'));
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<language>>[
                      PopupMenuItem(
                        child: Text("English"),
                        value: language.english,
                      ),
                      PopupMenuItem(
                        child: Text("Spanish"),
                        value: language.spanish,
                      ),
                      PopupMenuItem(
                        child: Text("Turkish"),
                        value: language.turkish,
                      ),
                      PopupMenuItem(
                        child: Text("Urdu"),
                        value: language.urdu,
                      )
                    ]);
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoogleMapView(),
                      ));
                },
                child: Text(AppLocalizations.of(context)!.gMapButton)),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LangLoc(),
                      ));
                },
                child: Text(AppLocalizations.of(context)!.motivation)),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebView(),
                      ));
                },
                child: Text("Web View")),
          )
        ],
      ),
    );
  }
}
