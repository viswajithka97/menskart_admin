import 'package:flutter/cupertino.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:menskart_admin/view/core/color_constants.dart';
import 'package:menskart_admin/view/core/space_constants.dart';
import 'package:menskart_admin/view/widgets/heading_text.dart';

class EditProductTopSection extends StatelessWidget {
  const EditProductTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingText(headingText: 'Edit Image'),
        kHeight10,
        Center(
          child: Container(
            height: 250,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://www.rei.com/dam/content_team_010818_52427_htc_running_shoes_hero2_lg.jpg'),
                    fit: BoxFit.cover),
                borderRadius: kBRadius10),
            child: Container(
              height: 35,
              width: 130,
              decoration:
                  BoxDecoration(borderRadius: kBRadius30, color: kWhite),
              child: const Center(
                child: Text(
                  'Change Image',
                  style: TextStyle(color: kBlack, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        kHeight20,
        SizedBox(
          // color: kBlack,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // controller.selectImage2();
                },
                child: Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                        border: Border.all(color: kBlack, width: 1),
                        borderRadius: kBRadius10,
                        color: kWhite),
                    child: const Center(
                      child: Text(
                        'Select Image',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
              Container(
                  color: kGreen,
                  height: 40,
                  width: 250,
                  child: Center(
                      child:
                          //  controller.imagefile2 == null
                          //     ?
                          const Text('Select an Image',
                              maxLines: 1, style: TextStyle(fontSize: 20))
                      // : Text(controller.imagefile2.toString(),
                      //     maxLines: 1,
                      //     style: const TextStyle(fontSize: 20))
                      )),
            ],
          ),
        ),
        kHeight10,
        SizedBox(
          // color: kBlack,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // controller.selectImage3();
                },
                child: Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                        border: Border.all(color: kBlack, width: 1),
                        borderRadius: kBRadius10,
                        color: kWhite),
                    child: const Center(
                      child: Text(
                        'Select Image',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
              Container(
                  color: kGreen,
                  height: 40,
                  width: 250,
                  child: Center(
                      child:
                          // controller.imagefile3 == null
                          // ?
                          const Text('Select an Image',
                              maxLines: 1, style: TextStyle(fontSize: 20))
                      // : Text(controller.imagefile2.toString(),
                      //     maxLines: 1,
                      //     style: const TextStyle(fontSize: 20))
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
