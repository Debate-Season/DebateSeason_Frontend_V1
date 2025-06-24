class ProfileConstants {
  static const PROFILE_CREATE_APPBAR_TEXT = '프로필 입력';
  static const PROFILE_MODIFY_APPBAR_TEXT = '프로필 수정';
  static const VALID_NICKNAME = '유효하지 않은 닉네임입니다.';
  static const VALID_OVERLAP_NICKNAME = '중복된 닉네임입니다.';
  static const PROFILE_NEXT_BTN_TEXT = '다음';
  static const PROFILE_CREATE_BTN_TEXT = '토론철 시작하기';
  static const PROFILE_MODIFY_BTN_TEXT = '저장';
  static const PROFILE_SUPPORT_EMAIL = '카카오채널';
  static const PROFILE_WITHDRAW_POLICY_TITLE = '탈퇴 정책 안내';
  static const PROFILE_WITHDRAW_POLICY_DESCRIPTION = '탈퇴 정책 안내';
  static const PROFILE_WITHDRAW_PROCEDURE_TITLE = '절차';
  static const PROFILE_WITHDRAW_PROCEDURE_DESCRIPTION =
      '회원 탈퇴를 신청하면 계정이 로그아웃되고 5일 뒤 탈퇴가 진행됩니다. 삭제 전 다시 로그인하면 탈퇴를 취소할 수 있습니다.';
  static const PROFILE_WITHDRAW_WARNING = '탈퇴가 완료될 경우, 해당 아이는 복구가 불가능합니다.';
  static const PROFILE_WITHDRAW_DELETED_INFO_TITLE = '삭제되는 정보';
  static const PROFILE_WITHDRAW_DELETED_INFO_DESCRIPTION1 = '탈퇴가 완료되면 ';
  static const PROFILE_WITHDRAW_DELETED_INFO_DESCRIPTION2 = '고유아이디, 닉네임, 성별 정보';
  static const PROFILE_WITHDRAW_DELETED_INFO_DESCRIPTION3 =
      '가 삭제됩니다. 내가 선택한 진영과 작성한 대화는 삭제되지 않습니다.';
  static const PROFILE_WITHDRAW_DIALOG_TITLE = '회원 탈퇴 신청';
  static const PROFILE_WITHDRAW_DIALOG_DESCRIPTION =
      '회원 탈퇴를 신청하면 계정이 로그아웃되고 5일 뒤 회원 정보가 완전히 삭제됩니다.\n'
      '삭제 전 다시 로그인하면 탈퇴를 취소할 수 있습니다.\n'
      '탈퇴를 신청하시겠습니까?';
  static const PROFILE_WITHDRAW_DIALOG_CANCEL_TEXT = '탈퇴 취소';
  static const PROFILE_WITHDRAW_DONE_TEXT = '탈퇴 신청하기';
  static const PROFILE_WITHDRAW_SUCCESS_MESSAGE = '회원탈퇴 되었습니다.';
  static const Map<String, String> TERMS_TITLE_MAP = {
    'SERVICE': '서비스 이용 약관',
    'PRIVACY': '개인정보 수집/이용 동의',
    'THIRD_PARTY': '개인정보 제3자 제공 동의',
  };

  static const PROFILE_ESSENTIAL_STAR = '*';
  static const PROFILE_PRIVACY_NOTICE = '본 정보는 타인에게 공개되지 않습니다.';
  static const PROFILE_NICK_NAME = '닉네임';
  static const PROFILE_NICK_NAME_HINT_TEXT = '한글, 영문 조합 최대 8자';
  static const PROFILE_NICK_NAME_VALIDITY_REG_EXP = r'^[가-힣a-zA-Z]{1,8}$';
  static const PROFILE_AFFILIATED_COMMUNITY = '소속 커뮤니티';
  static const PROFILE_COMMUNITY_HINT_TEXT = '주로 활동하는 커뮤니티를 등록해 주세요.';
  static const PROFILE_GENDER = '성별';
  static const PROFILE_GENDER_MAN = '남성';
  static const PROFILE_GENDER_WOMEN = '여성';
  static const PROFILE_GENDER_OTHER = '무응답';
  static const PROFILE_AGE = '연령대';
  static const PROFILE_AGE_HINT_TEXT = '나이대를 선택해주세요.';
  static const PROFILE_AGE_RANGE = [
    '10대',
    '20대',
    '30대',
    '40대',
    '50대',
    '60대',
    '70대',
    '80대',
    '90대 이상',
  ];
  static const PROFILE_RESIDENCE = '거주지';
  static const PROFILE_RESIDENCE_HINT_TEXT = '거주지를 선택해주세요.';
  static const PROFILE_HOME_TOWN = '출신지';
  static const PROFILE_HOME_TOWN_HINT_TEXT = '출신지를 선택해주세요.';
  static const PROFILE_SAME_TO_RESIDENCE = '거주지와 동일';
  static const PROFILE_CHOICE = '선택하기';
  static const PROFILE_REGISTER = '등록하기';
  static const PROFILE_EMPTY_HINT_TEXT = '내용을 입력해 주세요.';
}
