import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final _pageController = new PageController(
                                initialPage: 1,
                                viewportFraction: 0.3
                              );
  final Function siguientePagina;                   

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener((){
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });


    return Container(
      height: _screenSize.height * 0.25,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        //children: _tarjetas(context),
        //Hay que especificar cuantos elementos hay y si es dinámico debe declarse de esa forma para 
        //recargue los nuevos elementos que aparezcan
        itemCount: peliculas.length,
        itemBuilder: (context, i) => _tarjeta(context, peliculas[i])
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula){
    final _screenSize = MediaQuery.of(context).size;
    pelicula.uniqId = '${pelicula.id}-poster';

    final tarjeta =  Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: pelicula.uniqId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/loading.gif'),
                  fit: BoxFit.cover,
                  height: _screenSize.height * 0.22,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );

      return GestureDetector(
        child: tarjeta,
        onTap: () {
          Navigator.pushNamed(context, 'detalle', arguments: pelicula );
        },
      );
  }
}