import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({
    @required this.peliculas
  });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
            peliculas[index].uniqId = '${peliculas[index].id}-tarjeta';

            return Hero(
              tag: peliculas[index].uniqId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  child: FadeInImage(
                    image: NetworkImage( peliculas[index].getPosterImg()),
                    placeholder: AssetImage('assets/img/loading.gif'),
                    fit: BoxFit.cover
                  ),
                  onTap: () => Navigator.pushNamed(context, 'detalle', arguments: peliculas[index] ),
                )
              ),
            );
          },
          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),
          //control: new SwiperControl(),
          itemWidth: _screenSize.width * 0.65,
          itemHeight: _screenSize.height * 0.55,
          layout: SwiperLayout.STACK,
        ),
    );
  }
}