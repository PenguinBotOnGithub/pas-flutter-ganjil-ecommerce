import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/detail_controller.dart';
import 'package:flutter_tugas_pas/widgets/components/default_button_custom_color.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/enums.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
        iconTheme: IconThemeData(color: mGreyColor),
      ),
      body: SafeArea(
          child: ColoredBox(
        color: mLightGreyColor,
        child: Obx(() => switch (controller.fetchLoad.value) {
              LoadState.complete => buildDetailPage(),
              LoadState.loading => buildLoadingPage(),
              LoadState.error => buildErrorPage(),
            }),
      )),
    );
  }

  Widget buildDetailPage() {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: PageView.builder(
                controller: controller.imagePageController,
                onPageChanged: controller.onImageCarouselPageChanged,
                itemCount: controller.product.value.images.length,
                itemBuilder: imagePageBuilder),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.product.value.images.length,
                    (index) => AnimatedContainer(
                      duration: kAnimationDuration,
                      margin: EdgeInsets.only(right: 5),
                      height: 6,
                      width:
                          controller.imageCarouselPage.value == index ? 20 : 6,
                      decoration: BoxDecoration(
                        color: controller.imageCarouselPage.value == index
                            ? kPrimaryColor
                            : mDarkGreyColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(81),
                  child: buildImagePreviewList(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: buildProductInfo(),
          ),
        ],
      ),
    );
  }

  Widget buildProductInfo() {
    return Container(
      decoration: BoxDecoration(
          color: mBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      padding: EdgeInsets.only(left: 12, right: 12, top: 22, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "FREE SHIPPING",
                style: TextStyle(color: mGreyColor),
              ),
              Spacer(),
              Icon(
                Icons.star,
                color: kColorYellow,
                size: getProportionateScreenWidth(24),
              ),
              Text("${controller.product.value.rating}")
            ],
          ),
          Row(
            children: [
              Text(controller.product.value.title,
                  style: mTitleStyleProductTitle),
              Spacer()
            ],
          ),
          Expanded(
            child: Text(
              controller.product.value.description,
              style: mStyleDescription,
            ),
          ),
          Row(
            children: [
              Text(
                "\$${controller.product.value.price}",
                style: mStylePrice,
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: getProportionateScreenWidth(105),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    border: Border.all(color: mGreyColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: controller.onReduceTap,
                      icon: Icon(Icons.remove),
                    ),
                    Text("${controller.amount.value}"),
                    IconButton(
                        onPressed: controller.onAddTap, icon: Icon(Icons.add))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: DefaultButtonCustomColor(
                  borderRadius: 36,
                  text: "Add To Cart",
                  color: kPrimaryColor,
                  press: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImagePreviewList() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.product.value.images.length,
        itemBuilder: (context, count) {
          var imageSize = getProportionateScreenWidth(80);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            clipBehavior: Clip.antiAlias,
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22)),
            ),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22)),
                border: Border.all(
                    width: 2,
                    color: controller.imageCarouselPage.value == count
                        ? kPrimaryColor
                        : mDarkGreyColor)),
            child: GestureDetector(
              onTap: () => controller.onPreviewImageTap(count),
              child: Image.network(
                controller.product.value.images[count],
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }

  Widget imagePageBuilder(BuildContext context, int count) {
    return Image.network(
      controller.product.value.images[count],
      fit: BoxFit.contain,
    );
  }

  Widget buildLoadingPage() {
    return Center(
      child: CircularProgressIndicator(
        color: kPrimaryColor,
      ),
    );
  }

  Widget buildErrorPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: kPrimaryColor,
            size: getProportionateScreenWidth(100),
          ),
          Text(controller.error.value)
        ],
      ),
    );
  }
}
