import 'package:notes_sharing_app/src/constants/image_strings.dart';
import 'package:notes_sharing_app/src/constants/text_strings.dart';

class CarouselModel {
  final String title;
  final String subtitle;
  final String img;

  CarouselModel(
      {required this.title, required this.subtitle, required this.img});

  static List<CarouselModel> carouselList = [
    CarouselModel(
        title: tCarouselTitle1,
        subtitle: tCarouselSubtitle1,
        img: carouselImg1),
    CarouselModel(
        title: tCarouselTitle2,
        subtitle: tCarouselSubtitle2,
        img: carouselImg2),
    CarouselModel(
        title: tCarouselTitle3,
        subtitle: tCarouselSubtitle3,
        img: carouselImg3),
  ];
}
