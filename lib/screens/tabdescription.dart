import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Descriptiontab extends StatelessWidget {
  const Descriptiontab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: const SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n\nVivamus faucibus erat nibh, id tincidunt arcu posuere sed. Sed vitae odio sapien. Aliquam consequat, purus id sodales finibus, odio leo faucibus diam, at mollis libero diam nec tortor. \n\nDonec rhoncus aliquam nunc, et maximus sapien. Vestibulum blandit convallis velit sed pellentesque. Morbi vel pulvinar turpis, rutrum aliquet orci. Curabitur justo quam, consectetur ac ultricies sit amet, dapibus eget lorem. Pellentesque scelerisque maximus mi ut tristique. Nulla quam purus, gravida tincidunt convallis gravida, condimentum sit amet augue. Praesent vel euismod massa. Vestibulum et sapien imperdiet, posuere odio vitae, varius nisl. In pellentesque suscipit tortor. Phasellus dignissim mattis nisi, nec fermentum metus dictum vitae. Curabitur non elementum augue. Mauris in consequat elit. Sed id quam in ipsum lobortis tempus. Integer nec venenatis est.',
                  trimLines: 9,
                  textAlign: TextAlign.justify,
                  colorClickableText: Color.fromARGB(255, 136, 14, 14),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  style: TextStyle(height: 1.5),
                  trimExpandedText: ' Show less',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
