import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_dialog.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileViewModel> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: '프로필',
      isBack: true,
    );
  }

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                _profile(),
                Gaps.v40,
                _myCommunity(),
                Gaps.v40,
                _account(),
                Gaps.v40,
                _support(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _profile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Gaps.v8,
        DeText(
          '승정원일기',
          style: headerLarge,
        ),
        Gaps.v16,
        Container(
          padding: Dimensions.padding10x5,
          decoration: BoxDecoration(
            color: grey80,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DeText(
            '프로필 수정',
            style: cation12M,
          ),
        )
      ],
    );
  }

  Widget _myCommunity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '내 소속 커뮤니티',
          style: title,
        ),
        Gaps.v8,
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: brandDark,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Gaps.h12,
            DeText(
              '커뮤니티명',
              style: body16Sb,
            ),
          ],
        )
      ],
    );
  }

  Widget _account() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '계정',
          style: title,
        ),
        Gaps.v16,
        DeGestureDetector(
          onTap: () {
            DeDialog(
              '로그아웃 하시겠습니까?',
              doneText: '로그아웃',
              onTapDone: () {
                // todo 로그아웃
              },
            );
          },
          child: Row(
            children: [
              DeText(
                '로그아웃',
                style: body14M.copyWith(color: grey50),
              ),
              Gaps.h4,
              SvgPicture.asset('assets/icons/ic_sign_out_grey50.svg'),
            ],
          ),
        )
      ],
    );
  }

  Widget _support() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '고객센터',
          style: title,
        ),
        Gaps.v16,
        DeGestureDetector(
          onTap: () {
            // todo 복사
          },
          child: Row(
            children: [
              DeText(
                'tmddnjs1411@gmail.com',
                style: body14M.copyWith(color: grey50),
              ),
              Gaps.h8,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: grey80,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DeText(
                  '복사',
                  style: body14M.copyWith(color: grey50),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
