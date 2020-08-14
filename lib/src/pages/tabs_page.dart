import 'package:appdis/src/pages/credit_page.dart';
import 'package:appdis/src/pages/home_page.dart';
import 'package:appdis/src/pages/transfer_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //como si fuera un singleton
    final navegacionModel = Provider.of<NavegacionModel>(context);
    // final newsService = Provider.of<NewsService>(context);

    return BottomNavigationBar(
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xff2D6A67),
      type: BottomNavigationBarType.fixed,
      currentIndex: navegacionModel.paginaActual,
      onTap: (index) => navegacionModel.paginaActual = index,
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            // color: Colors.white,
          ),
          title: Text('Inicio'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xff2E57A6),
          icon: Icon(
            Icons.ac_unit,
            // color: Colors.white,
          ),
          title: Text('Transferencias'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.credit_card,
            // color: Colors.white,
          ),
          title: Text('Creditos'),
        ),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionMOdel = Provider.of<NavegacionModel>(context);
    return PageView(
      controller: navegacionMOdel.pageController,
      // physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) => navegacionMOdel.paginaActual = index,
      children: <Widget>[
        HomePage(),
        TransferPage(),
        CreditPage(),
      ],
    );
  }
}

class NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();
  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
