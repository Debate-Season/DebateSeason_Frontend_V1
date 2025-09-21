import 'district_type.dart';

enum ProvinceType {
  seoul('11', '서울특별시'),
  busan('21', '부산광역시'),
  daegu('22', '대구광역시'),
  incheon('23', '인천광역시'),
  gwangju('24', '광주광역시'),
  daejeon('25', '대전광역시'),
  ulsan('26', '울산광역시'),
  sejong('29', '세종특별자치시'),
  gyeonggi('31', '경기도'),
  gangwon('32', '강원특별자치도'),
  chungbuk('33', '충청북도'),
  chungnam('34', '충청남도'),
  jeonbuk('35', '전북특별자치도'),
  jeonnam('36', '전라남도'),
  gyeongbuk('37', '경상북도'),
  gyeongnam('38', '경상남도'),
  jeju('39', '제주특별자치도');

  final String code;
  final String name;

  const ProvinceType(this.code, this.name);

  static ProvinceType fromCode(String code) {
    for (final p in ProvinceType.values) {
      if (p.code == code) return p;
    }
    return ProvinceType.seoul;
  }

  static List<DistrictType> getDistrictList(ProvinceType province) {
    switch (province) {
      case ProvinceType.seoul:
        return DistrictType.seoul;
      case ProvinceType.busan:
        return DistrictType.busan;
      case ProvinceType.daegu:
        return DistrictType.daegu;
      case ProvinceType.incheon:
        return DistrictType.incheon;
      case ProvinceType.gwangju:
        return DistrictType.gwangju;
      case ProvinceType.daejeon:
        return DistrictType.daejeon;
      case ProvinceType.ulsan:
        return DistrictType.ulsan;
      case ProvinceType.sejong:
        return DistrictType.sejong;
      case ProvinceType.gyeonggi:
        return DistrictType.gyeonggi;
      case ProvinceType.gangwon:
        return DistrictType.gangwon;
      case ProvinceType.chungbuk:
        return DistrictType.chungbuk;
      case ProvinceType.chungnam:
        return DistrictType.chungnam;
      case ProvinceType.jeonbuk:
        return DistrictType.jeonbuk;
      case ProvinceType.jeonnam:
        return DistrictType.jeonnam;
      case ProvinceType.gyeongbuk:
        return DistrictType.gyeongbuk;
      case ProvinceType.gyeongnam:
        return DistrictType.gyeongnam;
      case ProvinceType.jeju:
        return DistrictType.jeju;
    }
  }
}
