import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horoscopo/models/astros_model.dart';
import 'package:horoscopo/providers/astros_provider.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';

final signo = new AstrosProvider();

class PruebaPage extends StatefulWidget {
  // PruebaPage({Key? key}) : super(key: key);

  @override
  _PruebaPageState createState() => _PruebaPageState();
}

class _PruebaPageState extends State<PruebaPage> {
  int pag = 1;
  String texto;

  void onChangeTab(int index) {
    pag = index;
    print(pag);
  }

  List<String> _zodiaco = [
    'Aries',
    'Tauro',
    'Géminis',
    'Cáncer',
    'Leo',
    'Virgo',
    'Libra',
    'Escorpión',
    'Sagitario',
    'Capricornio',
    'Acuario',
    'Piscis'
  ];
  @override
  Widget build(BuildContext context) {
    final tampant = MediaQuery.of(context).size;
    return PageView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              appBar(index, tampant),
              horoscopo(tampant, index),
            ],
          );
        });
  }

  Widget appBar(int index, Size tampant) {
    return Expanded(
      child: Container(
        color: Colors.amber,
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image(
                    image: AssetImage('assets/${_zodiaco[index]}.png'),
                    width: tampant.width * .22,
                    height: tampant.width * .22),
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    _zodiaco[index],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'AmaticSC', fontSize: tampant.width * .17),
                  )),

              // textoclasico(pagina, size),
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }

  Widget horoscopo(Size size, int index) {
    return Expanded(
      flex: 3,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          // appBar: AppBar(),
          body: TabBarView(
            children: [
              new Container(
                color: Colors.red,
                child: FutureBuilder(
                  future: signo.getAstros(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Astros> snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot);
                      for (var x in snapshot.data.horoscopo.values) {
                        if (x.nombre == _zodiaco[index]) {
                          texto = x.salud;
                        }
                      }
                      return SingleChildScrollView(
                        child: Container(
                            child: Text(
                          texto ?? 'default value',
                          style: TextStyle(
                              fontFamily: 'AmaticSC',
                              fontSize: size.width * .17),
                        )),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              new Container(
                color: Colors.pink,
                child: FutureBuilder(
                  future: signo.getAstros(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Astros> snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot);
                      for (var x in snapshot.data.horoscopo.values) {
                        if (x.nombre == _zodiaco[index]) {
                          texto = x.amor;
                        }
                      }
                      return SingleChildScrollView(
                        child: Container(
                            child: Text(
                          texto ?? 'default value',
                          style: TextStyle(
                              fontFamily: 'AmaticSC',
                              fontSize: size.width * .17),
                        )),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              new Container(
                color: Colors.green,
                child: FutureBuilder(
                  future: signo.getAstros(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Astros> snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot);
                      for (var x in snapshot.data.horoscopo.values) {
                        if (x.nombre == _zodiaco[index]) {
                          texto = x.dinero;
                        }
                      }
                      return SingleChildScrollView(
                        child: Container(
                            child: Text(
                          texto ?? 'default value',
                          style: TextStyle(
                              fontFamily: 'AmaticSC',
                              fontSize: size.width * .17),
                        )),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
          bottomNavigationBar: bottombar(),
        ),
      ),
    );
  }

  Widget bottombar() {
    return JumpingTabBar(
        duration: Duration(milliseconds: 500),
        onChangeTab: onChangeTab,
        items: [
          TabItemIcon(
              iconData: FontAwesomeIcons.firstAid, curveColor: Colors.red),
          TabItemIcon(
              iconData: FontAwesomeIcons.heart, curveColor: Colors.pink),
          TabItemIcon(
              iconData: FontAwesomeIcons.moneyBill, curveColor: Colors.green),
        ]);
  }
}
