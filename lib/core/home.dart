import 'package:flutter/material.dart';

import '../configs/constants.dart';

/// Display all products
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: kCanvasColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Choose your zone'),
        foregroundColor: kPrimaryTextColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: kPaddingM, left: kPaddingS + 2, right: kPaddingM + 2),
            child: Center(child: Image.asset(AssetsImages.product2, width:250, height:200)),
          ),
        ),
      ),
    );
  }
}

class _GridContainer extends StatelessWidget {
  const _GridContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (ctx, index) {
        return InkWell(
            onTap: (() {
              debugPrint('Position $index clicked');
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.0),
                  ),
                ),
                context: context,
                builder: (_) => QuestionForm(
                  name: categories[index].categoryName,
                  imageUrl: categories[index].categoryImgSrc,
                  tag: categories[index].categoryTag,
                ),
              );
            }),
            child: Card(
              elevation: kCardElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kMediumRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 50, height: 50),
                    child: Image.asset(categories[index].categoryImgSrc),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        categories[index].categoryName.removeColon(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}


