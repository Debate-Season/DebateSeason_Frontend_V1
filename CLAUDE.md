# Claude Project Rules (DebateSeason Frontend)

이 저장소의 시니어 플러터 엔지니어로서 다음 규칙을 엄격히 준수하십시오. 정보가 부족할 경우 추측하지 말고 최소한의 질문(1~3개)을 하십시오.

## 0) 출력 계약 (Hard rules)

- **설명이나 불렛 포인트 없이 코드만 출력하십시오.**
- 모든 파일의 시작 부분에 파일 경로를 명시하십시오: `// filename: <relative/path>.dart`
- 기존 프로젝트 의존성 내에서 컴파일 가능한 코드만 작성하십시오. 새로운 패키지를 추가하지 마십시오.
- API 엔드포인트, JSON 필드, 라우트 이름 등을 임의로 생성하지 마십시오. 모를 경우 반드시 질문하십시오.

## 1) 아키텍처 및 기술 스택 (Hard rules)

- **Architecture:** Feature-based Clean Architecture + MVVM.
- **State Management:** GetX (Obx, Rx variables).
    - **중요:** 단순 상태 관리는 Controller 없이 `Rx` 변수나 `ValueNotifier`를 사용하고, 비즈니스 로직이 복잡한 경우에만 ViewModel(Controller)을 생성합니다.
- **Networking:** Dio + Retrofit.
- **Data Modeling:** Freezed + JsonSerializable.
- **DI:** GetX Bindings를 통해 의존성을 주입합니다.
- **Layer Boundaries:**
    - `presentation`은 `domain`에만 의존하며, `data` 레이어의 DTO를 절대 참조하지 않습니다.
    - `data`는 `domain/repositories`를 구현하고, 반드시 Mapper를 통해 `DTO` ↔ `Entity` 변환을 수행합니다.

## 2) 디렉토리 구조 및 네이밍 (Hard rules)

실제 프로젝트 구조(`snake_case` 폴더명)를 엄격히 따릅니다. 새로운 기능은 `lib/features/<feature_name>/` 하위에 위치합니다.

```
lib/
├── core/                     # 핵심 인프라 (네트워크, 라우팅, 상수, 서비스)
│   ├── constants/           # DeColors, DeFonts, DeGaps, DeIcons, DeDimensions
│   ├── errors/              # 예외 처리
│   ├── model/               # 공유 모델 (CursorPaginationModel 등)
│   ├── network/             # DioClient(싱글턴), DioInterceptor
│   ├── routers/             # GetRouter, GetRouterName
│   └── services/            # StompService, SecureStorageService, PipController
├── features/<feature>/       # 기능 모듈
│   ├── domain/entities/     # Freezed Entity (~Entity)
│   ├── domain/repositories/ # abstract class (~Repository)
│   ├── data/models/         # Request DTO (~Req), Response DTO (~Res)
│   ├── data/data_sources/   # Retrofit API 인터페이스 (~DataSource, .g.dart)
│   ├── data/mappers/        # DTO ↔ Entity 변환 (또는 모델 내 toEntity())
│   ├── data/repository_impls/ # Repository 구현체 (~RepositoryImpl)
│   ├── bindings/            # GetX Binding 클래스
│   └── presentation/
│       ├── view_models/     # GetxController (~ViewModel)
│       ├── views/           # UI 스크린 (~Screen)
│       ├── widgets/         # 기능 전용 위젯
│       └── <feature>_constants.dart  # 해당 기능 전용 문자열 상수
├── common/                  # 공유 상수, Enum (OpinionType 등)
├── utils/                   # 유틸리티
│   └── base/               # BaseRes<T>, NullableBaseRes<T>, UiState<T>
└── widgets/                 # 공용 위젯 (De* 접두사)
```

### 네이밍 규칙

| 대상 | 규칙 | 예시 |
|------|------|------|
| 파일명 | snake_case | `auth_view_model.dart` |
| ViewModel | `*ViewModel` (extends GetxController) | `ChatViewModel` |
| Screen | `*Screen` (extends GetView / StatelessWidget) | `ChatRoomScreen` |
| Repository (인터페이스) | `*Repository` (abstract) | `UsersLoginRepository` |
| Repository (구현체) | `*RepositoryImpl` | `UsersLoginRepositoryImpl` |
| DataSource | `*DataSource` (Retrofit) | `UsersLoginDataSource` |
| Entity | `*Entity` (Freezed) | `ChatMessageEntity` |
| Request DTO | `*Req` | `LoginReq` |
| Response DTO | `*Res` | `LoginRes` |
| 공용 위젯 | `De*` 접두사 | `DeScaffold`, `DeButton`, `DeCachedImage` |
| 디자인 상수 | `De*` 접두사 | `DeColors`, `DeFonts`, `DeGaps` |
| 기능별 문자열 상수 | `<feature>_constants.dart` | `home_constants.dart` |

## 3) 비즈니스 규칙 및 용어

- **Classes:** PascalCase / **Files:** snake_case
- **Constants:**
    - 디자인 시스템 상수(색상·폰트·간격)는 `lib/core/constants/`에 정의합니다.
    - 각 화면에서만 사용하는 문자열 상수는 해당 기능의 `presentation/constants/` 내에서 정의합니다. `lib/core/constants/`에 혼용 금지.

## 4) 코드 스타일 및 유틸리티

- **Base Classes 활용:**
    - 상태 관리: `lib/utils/base/ui_state.dart`의 `UiState<T>`를 적극 활용합니다.
    - API 응답: `BaseRes<T>` 또는 `NullableBaseRes<T>` 래퍼를 사용합니다.
- **Immutability:** 변수는 `final`, 생성자는 가능한 `const`를 사용합니다.
- **Null-safety:** `!` 연산자 사용을 엄격히 금지합니다. `?.` 및 `??` 연산자를 활용하십시오.
- **Code Generator:** Freezed/Retrofit 사용 시 `part` 구문과 `factory` 메서드 템플릿을 정확히 작성하십시오.
- **Constraints:**
    - 파일당 100줄 이내 유지 (초과 시 파일 분리).
    - 함수는 30라인 이내 유지 (단일 책임 원칙).
    - `print`, `debugPrint` 사용 금지 → `lib/utils/logger.dart`의 `log` 인스턴스 사용 (`log.d()`, `log.e()`).

## 5) 멀티 파일 출력 순서

파일 생성 시 의존성이 낮은 순서대로 출력하십시오:
1) `domain/` (entities → repositories)
2) `data/` (models → data_sources → mappers → repository_impls)
3) `bindings/`
4) `presentation/` (view_models → views → widgets)

## 6) 네트워크 레이어

- **DioClient:** 싱글턴. Base URL은 플랫폼별 환경 파일(`.env.dev.android` / `.env.dev.ios` / `.env.prod`)에서 로드 (`flutter_dotenv`).
- **DioInterceptor:** Access Token 자동 주입, 응답/에러 로깅, 401 시 토큰 갱신 후 요청 재시도 (실패 시 로그아웃).
- **Retrofit DataSource:** `@RestApi`, `@GET`, `@POST` 등. 반환 타입은 `Future<BaseRes<T>>`.
- **WebSocket:** `StompService` (STOMP 프로토콜). 구독: `/topic/room{roomId}`, 발행: `/stomp/chat.room.{roomId}`.
- **환경변수:** 환경 파일을 직접 참조. 변수 키 이름은 코드베이스에서 확인.

## 7) 라우팅

- GetX Named Routes 사용.
- 라우트 이름: `GetRouterName` 상수 클래스에 정의.
- 라우트 목록: `GetRouter.getPages`에 등록. 각 라우트에 Binding 연결.
- 네비게이션: `Get.toNamed()`, `Get.offNamed()`, `Get.offAllNamed()`.

## 8) 인증 흐름

- Kakao(Android) / Apple(iOS) 소셜 로그인.
- JWT: AccessToken + RefreshToken → `flutter_secure_storage`에 저장.
- 401 → DioInterceptor에서 자동 토큰 갱신 → 갱신 실패 시 SecureStorage 초기화 후 로그인 화면 이동.

## 9) 코드 생성

Freezed Entity, Retrofit DataSource, JsonSerializable Model 수정 후 반드시 실행:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
생성 파일: `*.freezed.dart`, `*.g.dart` — 이 파일들은 직접 수정하지 마십시오.

## 10) 금지 사항

- `print()` / `debugPrint()` 사용 금지.
- 하드코딩된 색상/폰트/간격 사용 금지 → `DeColors`, `DeFonts`, `DeGaps`, `DeDimensions` 사용.
- ViewModel에서 직접 UI 위젯(BuildContext) 참조 금지.
- Data 레이어에서 Domain 레이어 구현체 참조 금지 (의존성 역전 원칙).
- `Get.put()` 남용 금지 → `Get.lazyPut()` 우선 사용.
- `!` (bang operator) 사용 금지 → `?.`, `??` 사용.
- 새로운 패키지 임의 추가 금지.
