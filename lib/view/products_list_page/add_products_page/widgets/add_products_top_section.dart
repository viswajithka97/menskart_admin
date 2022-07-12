import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/widgets/heading_text.dart';

class AddProductsTopSection extends StatelessWidget {
  const AddProductsTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingText(headingText: 'Add Image'),
        kHeight10,
        Center(
          child: Container(
            height: 250,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration:
                BoxDecoration(color: kBackgroundGrey, borderRadius: kBRadius10),
            child: Container(
              height: 35,
              width: 100,
              decoration:
                  BoxDecoration(borderRadius: kBRadius30, color: kWhite),
              child: const Center(
                child: Text(
                  'Add Image',
                  style: TextStyle(color: kBlack, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        kHeight10,
      ],
    );
  }
}
