import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_assignment/common/resources/app_colors.dart';
import 'package:movie_app_assignment/common/resources/app_strings.dart';
import 'package:movie_app_assignment/common/resources/app_style.dart';
import 'package:movie_app_assignment/data/model/movie_model.dart';
import 'package:movie_app_assignment/presentation/provider.dart';
import 'package:movie_app_assignment/presentation/shared_widgets/custom_full_width_button.dart';
import 'package:movie_app_assignment/presentation/shared_widgets/custom_rounded_button.dart';
import 'package:movie_app_assignment/presentation/shared_widgets/photos_list_view_item_widget.dart';

import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieModel movieModel;

  const MovieDetailsScreen({
    required this.movieModel,
    super.key,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieProvider _movieProvider;
  @override
  void initState() {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //a widget used to ensure that its childrens are positioned within the safe area of the device screen .
      top: true,
      child: Scaffold(
        // widget in flutter used to provide the basic structure to design the screen
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.movieModel.Poster,
                            ))),
                  ),
                  Positioned(
                    top: 210,
                    left: 15,
                    child: SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Transform.rotate(
                        angle: -9 * (3.141592653589793 / 180),
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Positioned(
                    top: 180,
                    left: 10,
                    child: Hero(
                      tag: widget.movieModel.imdbID.toString(),
                      child: SizedBox(
                        height: 150,
                        width: 110,
                        child: Card(
                          elevation: 20,
                          child: Image.network(
                            widget.movieModel.Poster,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 230,
                    left: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.movieModel.Title.toString(),
                          style: AppStyle.headerTextStyle,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  '3.3',
                                  style: AppStyle.headerTextStyle
                                      .copyWith(color: Colors.blue),
                                ),
                                Text(
                                  'Rating',
                                  style: AppStyle.customTextStyle,
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RatingBar.builder(
                              initialRating: 3.0,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                              onRatingUpdate: (rating) {},
                              updateOnDrag: true,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            CustomRoundedButtonWidget(
                              isShowBorder: true,
                              buttonTextName: 'Trailer',
                              icon: Icons.play_arrow_outlined,
                              color: AppColors.unselectTextColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomRoundedButtonWidget(
                              isShowBorder: true,
                              color: AppColors.unselectTextColor,
                              buttonTextName: 'Wishlist',
                              icon: Icons.add,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.175,
                    ),
                    const CustomFullWidthButtonWidget(
                      textColor: AppColors.white,
                      text: 'Rent',
                      bgColor: AppColors.green,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomFullWidthButtonWidget(
                      textColor: AppColors.green,
                      text: 'Buy',
                      bgColor: AppColors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Summery',
                        style: AppStyle.headerTextStyle.copyWith(fontSize: 16)),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      AppStrings().long_txt,
                      maxLines:
                          context.watch<MovieProvider>().expanded ? null : 4,
                      overflow: _movieProvider.expanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                    ),
                    if (AppStrings().long_txt.split('.').length > 4)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomRoundedButtonWidget(
                            color: Colors.blue,
                            onTap: () {
                              _movieProvider.setShowMore();
                            },
                            tailingIcon: Icons.arrow_drop_down_outlined,
                            isShowBorder: false,
                            buttonTextName: _movieProvider.expanded
                                ? 'Show Less'
                                : 'Show More',
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics:
                            const BouncingScrollPhysics(), //to make list  srollable
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return PhotosListViewItemWidget(
                            url: widget.movieModel.Poster,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
