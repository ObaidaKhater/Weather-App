import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helpers/constant.dart';
import 'package:weather_app/models/place_auto_complete_response.dart';
import 'package:weather_app/pages/widgets/custom_loading_widget.dart';
import 'package:weather_app/providers/location_service_provider.dart';

class CustomSearchTextFieldWidget extends StatefulWidget {
  final Color fillColor;
  final Color enableBorderColor;
  final Color borderColor;
  final String? hintText;
  final TextStyle? hintTextStyle;

  const CustomSearchTextFieldWidget({
    Key? key,
    this.fillColor = kGrayColor,
    this.borderColor = Colors.transparent,
    this.enableBorderColor = Colors.transparent,
    this.hintText,
    this.hintTextStyle,
  }) : super(key: key);

  @override
  State<CustomSearchTextFieldWidget> createState() =>
      _CustomSearchTextFieldWidgetState();
}

class _CustomSearchTextFieldWidgetState
    extends State<CustomSearchTextFieldWidget> {
  bool isShowClearButton = false;

  //
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    isShowClearButton = false;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationServiceProvider>(
      builder: (context, providerLocationService, x) {
        return TypeAheadField(
          onSuggestionSelected: (Predictions place) {
            textEditingController.clear();
            providerLocationService.getLocationPlace(place);
          },
          loadingBuilder: (context) => Container(
            color: kWhiteColor,
            child: const CustomLoadingWidget(),
          ),
          noItemsFoundBuilder: (context) => Container(
            color: kWhiteColor,
            height: 140.w,
            alignment: Alignment.center,
            child: Text(
              'العنوان غير موجود',
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: kBlackColor,
                  ),
            ),
          ),
          textFieldConfiguration: TextFieldConfiguration(
            controller: textEditingController,
            autofocus: true,
            style: Theme.of(context).textTheme.headline1,
            decoration: InputDecoration(
              errorStyle: Theme.of(context).textTheme.headline5!.copyWith(
                    color: kRedColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 10.sp,
                  ),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
                    color: kGray2Color,
                  ),
              labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                    color: kGray2Color,
                  ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 16.w,
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.search,
                    color: kGrayColor,
                  ),
                ],
              ),
              suffixIcon: (isShowClearButton)
                  ? TextButton(
                      style: TextButton.styleFrom(
                        primary: kGray3Color, // Text Color
                      ),
                      child: Icon(
                        FontAwesomeIcons.close,
                        size: 17.r,
                        color: kGray1Color,
                      ),
                      onPressed: () {
                        // clear text
                        textEditingController.clear();
                        setState(() {
                          isShowClearButton = false;
                        });
                      },
                    )
                  : null,
              filled: true,
              fillColor: kGray1Color.withOpacity(0.3),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  isShowClearButton = true;
                } else {
                  isShowClearButton = false;
                }
              });
            },
          ),
          suggestionsCallback: (searchText) async =>
              await providerLocationService.getListPlacesSearch(
            searchText: searchText,
          ),
          itemBuilder: (context, Predictions place) => Container(
            decoration: const BoxDecoration(
              color: kWhiteColor,
              border: Border(
                bottom: BorderSide(color: kGray1Color),
              ),
            ),
            child: ListTile(
              dense: true,
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 7.h,
              ),
              leading: const Icon(Icons.search),
              title: Text(
                place.description ?? '',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: kBlackColor,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
