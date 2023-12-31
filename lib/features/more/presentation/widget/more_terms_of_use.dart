import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_expandable_group.dart';
import '../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

class MoreTermsOfUse extends StatelessWidget {
  const MoreTermsOfUse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpandableGroup(
      isExpanded: false,
      collapsedIcon: const Icon(Icons.arrow_drop_down),
      header: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomTextWidget(
          text: AppStrings.termsOfUse,
          style: AppStyles.font16SatoshiBold.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      items: const [
        ListTile(
          title: Text("Acceptance of Terms"),
          subtitle: Text(
              "By subscribing to any of the spoonacular API plans offered on our website or on rapidapi.com (previously mashape.com) or to a custom plan to which you are invited, you the API subscriber (“you”) confirm that you have read and agree to the Terms of Use outlined below. Failure to honor these terms will result in your use of the spoonacular API being suspended and/or permanently blocked."),
        ),
        ListTile(
            title: Text("License"),
            subtitle: Text(
                "A spoonacular API subscription grants you a nonexclusive, non-transferable license to use the spoonacular API on a month-by-month basis dependent on your payment of the monthly fee associated with your subscription (and any additional charges due to exceeding the number of calls per day covered by your subscription) and on your agreement to respect these terms. You will be charged every month until you cancel your subscription under My Console > Plan/Billing or on RapidAPI's website, depending on where you subscribed.")),
      ],
    );
  }
}
