import 'dart:io';

import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      title: DeText(
        '프로필',
        style: DeFonts.header,
      ),
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
                Obx(() {
                  final profile = controller.profile;

                  return profile.when(
                    loading: () {
                      return const Center(
                        child: DeProgressIndicator(),
                      );
                    },
                    success: (profile) {
                      return Column(
                        children: [
                          _profile(profile: profile),
                          DeGaps.v40,
                          _myCommunity(profile: profile),
                        ],
                      );
                    },
                    failure: (error) {
                      return Center(
                        child: DeText(
                          error,
                          style: DeFonts.body16Sb.copyWith(color: DeColors.red),
                        ),
                      );
                    },
                  );
                }),
                DeGaps.v40,
                _account(),
                DeGaps.v40,
                _support(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _profile({required ProfileEntity profile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: DeColors.red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        DeGaps.v8,
        DeText(
          profile.nickname,
          style: DeFonts.headerLarge,
        ),
        DeGaps.v16,
        DeGestureDetector(
          onTap: () {
            Get.toNamed(GetRouterName.profileInput, arguments: profile);
          },
          child: Container(
            padding: DeDimensions.padding10x5,
            decoration: BoxDecoration(
              color: DeColors.grey80,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DeText(
              '프로필 수정',
              style: DeFonts.caption12M,
            ),
          ),
        )
      ],
    );
  }

  Widget _myCommunity({required ProfileEntity profile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '내 소속 커뮤니티',
          style: DeFonts.title,
        ),
        DeGaps.v8,
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: DeCachedImage(
                profile.community.iconUrl,
                width: 44,
                height: 44,
              ),
            ),
            DeGaps.h12,
            DeText(
              profile.community.name,
              style: DeFonts.body16Sb,
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
          style: DeFonts.title,
        ),
        DeGaps.v16,
        DeGestureDetector(
          onTap: () {
            DeDialog.show(
              dialogTitle: '로그아웃 하시겠습니까?',
              doneText: '로그아웃',
              cancelText: '취소',
              onTapDone: () {
                controller.postLogout().then((result) {
                  result.when(
                    loading: () {},
                    success: (msg) {
                      if (Platform.isAndroid) {
                        controller.kakaoLogout().then((_) {
                          Get.offAllNamed(GetRouterName.auth);
                        });
                      } else {
                        Get.offAllNamed(GetRouterName.auth);
                      }
                      deSnackBar('로그아웃되었습니다.');
                    },
                    failure: (msg) {
                      deSnackBar(msg);
                    },
                  );
                });
              },
            );
          },
          child: Row(
            children: [
              DeText(
                '로그아웃',
                style: DeFonts.body14M.copyWith(color: DeColors.grey50),
              ),
              DeGaps.h4,
              SvgPicture.asset(DeIcons.ic_sign_out_grey50),
            ],
          ),
        ),
        DeGaps.v8,
        DeGestureDetector(
          onTap: () {
            Get.toNamed(GetRouterName.profileWithdraw);
          },
          child: Row(
            children: [
              DeText(
                '회원탈퇴',
                style: DeFonts.body14M.copyWith(color: DeColors.grey50),
              ),
              DeGaps.h4,
              SvgPicture.asset(DeIcons.ic_sign_out_grey50),
            ],
          ),
        ),
      ],
    );
  }

  Widget _support() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '고객센터',
          style: DeFonts.title,
        ),
        DeGaps.v16,
        DeGestureDetector(
          onTap: () async {
            await Clipboard.setData(
              ClipboardData(text: ProfileConstants.profileSupportEmail),
            );
          },
          child: Row(
            children: [
              DeText(
                'tmddnjs1411@gmail.com',
                style: DeFonts.body14M.copyWith(color: DeColors.grey50),
              ),
              DeGaps.h8,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: DeColors.grey80,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DeText(
                  '복사',
                  style: DeFonts.body14M.copyWith(color: DeColors.grey50),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
