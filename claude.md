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

- `data/data_sources/`: Retrofit API 인터페이스 (`.g.dart` 포함)
- `data/models/request/` & `data/models/response/`: API DTO (`SomethingResponse`, `SomethingRequest`)
- `data/repository_impls/`: Repository 구현체 (`~RepositoryImpl`)
- `data/mappers/`: DTO ↔ Entity 변환 로직 (또는 `mapper/`)
- `domain/entities/`: UI 로직에서 사용하는 순수 객체 (`~Entity`)
- `domain/repositories/`: Repository 인터페이스 (`abstract class ~Repository`)
- `presentation/views/`: UI 스크린 및 페이지 (`~Screen`, `~Page`)
- `presentation/view_models/`: GetX Controller (`~ViewModel`)
- `presentation/widgets/`: 해당 기능 전용 위젯
- `bindings/`: GetX Binding 클래스

## 3) 비즈니스 규칙 및 용어

- **Prohibited Terms (Legacy Fix):**
    - `homeData` (사용 금지) → **`recommend`** 사용
    - `news` (사용 금지) → **`youtubeLive`** 사용
- **Classes:** PascalCase / **Files:** snake_case
- **Constants:** 모든 문자열/스타일 상수는 `lib/core/constants/`를 참조하며 하드코딩을 금지합니다.

## 4) 코드 스타일 및 유틸리티

- **Base Classes 활용:**
    - 상태 관리: `lib/utils/base/ui_state.dart`의 `UIState<T>`를 적극 활용합니다.
    - API 응답: `BaseRes<T>` 또는 `NullableBaseRes<T>` 래퍼를 사용합니다.
- **Immutability:** 변수는 `final`, 생성자는 가능한 `const`를 사용합니다.
- **Null-safety:** `!` 연산자 사용을 엄격히 금지합니다. `?.` 및 `??` 연산자를 활용하십시오.
- **Code Generator:** Freezed/Retrofit 사용 시 `part` 구문과 `factory` 메서드 템플릿을 정확히 작성하십시오.
- **Constraints:**
    - 파일당 100줄 이내 유지 (초과 시 파일 분리).
    - 함수는 30라인 이내 유지 (단일 책임 원칙).
    - `print`, `debugPrint` 사용 금지 (필요 시 `lib/utils/logger.dart` 활용).

## 5) 멀티 파일 출력 순서

파일 생성 시 의존성이 낮은 순서대로 출력하십시오:
1) `domain/` (entities -> repositories)
2) `data/` (models -> data_sources -> mappers -> repository_impls)
3) `bindings/`
4) `presentation/` (view_models -> views -> widgets)