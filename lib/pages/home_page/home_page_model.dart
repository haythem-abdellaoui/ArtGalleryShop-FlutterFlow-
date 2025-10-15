import '/components/event_card_widget.dart';
import '/components/news_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for newsCard component.
  late NewsCardModel newsCardModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for EventCard component.
  late EventCardModel eventCardModel;

  @override
  void initState(BuildContext context) {
    newsCardModel = createModel(context, () => NewsCardModel());
    eventCardModel = createModel(context, () => EventCardModel());
  }

  @override
  void dispose() {
    newsCardModel.dispose();
    eventCardModel.dispose();
  }
}
