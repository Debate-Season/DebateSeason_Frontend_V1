# PRD — 토론방 위계 통합 및 컨테이너 방 전환 (모바일)

- 작성일: 2026-08-15 (개정: 2026-08-16 — 백엔드 확정분 반영)
- 대상: DebateSeason 모바일 앱 (Flutter, `toronchul_mobile`)
- 관련 세션: 웹 프론트(`toronchul_web_v1`), 백엔드(`debateseason-backend-v1-9c`)
- 상태: **구현 착수 보류 (사용자 지시)** — 문서만 유지. 잔여 블로커는 §9-2 `ChatMessageResponse.userId` 백엔드 승인 하나

---

## 1. 배경

웹이 이슈/토론 위계를 3단계에서 2단계로 줄이고 구현을 마쳤습니다(미커밋). 모바일도 같은 구조로 가야 하며,
특히 **실시간 채팅의 컨테이너 방 전환은 웹·앱이 같은 시점에 배포되지 않으면 운영에서 대화가 갈라집니다.**
이 문서는 모바일 작업 범위와 배포 순서를 정의합니다.

### 1.1 근거 표기 규칙

이 문서의 사실은 출처를 구분해 표기합니다. 추측으로 스펙을 만들지 않습니다.

| 표기 | 의미 |
|---|---|
| `[앱-실측]` | 이 저장소 코드에서 직접 확인 |
| `[웹-전달]` | 웹 세션 전달분. 앱에서 미검증 |
| `[BE-전달]` | 백엔드 세션이 코드/운영DB로 확인했다고 전달한 분. 앱에서 미검증 |
| `[미정]` | 결정 필요 |

---

## 2. 현재 앱 구조 `[앱-실측]`

### 2.1 화면 위계 — 웹의 변경 전 구조와 동일한 3단계

```
IssueRoomScreen (/issue)
  └ 토론방 카드 탭 → DebateRoomScreen (/debate)   ← 찬반 투표 + 위키 탭만 있는 중간 화면
       └ [토론방 입장] 버튼 → ChatRoomScreen (/chat)
```

관련 파일:

| 역할 | 경로 |
|---|---|
| 이슈 상세 | `lib/features/issue/presentation/views/issue_room_screen.dart:246` (→ `/debate` 이동) |
| 중간 화면 | `lib/features/chat/presentation/views/debate_room_screen.dart` |
| 중간 화면 VM | `lib/features/chat/presentation/view_models/debate_room_view_model.dart` |
| 채팅 화면 | `lib/features/chat/presentation/views/chat_room_screen.dart` |
| 채팅 VM | `lib/features/chat/presentation/view_models/chat_room_view_model.dart` |
| 라우트 정의 | `lib/core/routers/get_router_name.dart`, `get_router.dart:73,98` |

`/debate` 진입점은 3곳입니다:
- `issue_room_screen.dart:256` (이슈 상세의 토론방 카드)
- `home_recommend_page.dart:91` (홈 "이런 토론은 어때요")
- `home_recommend_page.dart:259` (홈 토론방 목록)

### 2.2 발언 게이팅 — 현재는 "투표해야 **입장**"

`debate_room_screen.dart:277-283` 에서 `voteStatus == OpinionType.neutral` 이면
스낵바로 막고 채팅 화면 진입 자체를 차단합니다. 버튼도 `enable: false` 입니다.

### 2.3 데이터 소스

| API | 사용처 |
|---|---|
| `GET /api/v1/room?chatroom-id={id}` | `room_data_source.dart` — **방 하나 단위** 조회 |
| `POST /api/v1/room/vote?opinion=&chatroom-id=` | `vote_data_source.dart` |
| `GET /api/v1/chat/rooms/{roomId}/messages?cursor=` | `chat_rooms_messages_data_source.dart` |

즉 앱은 **`/api/v2/room` 을 아직 쓰지 않습니다.** 스레드 개념도 코드에 없습니다.

### 2.4 실시간(STOMP) — `lib/core/services/web_socket/stomp_service.dart`

- 구독: `/topic/room{chatRoomId}` (`:96`)
- 발행: `/stomp/chat.room.{chatRoomId}` (`:120`)
- `chatRoomId` 는 **스레드 방 id** 가 들어갑니다 (`chat_room_view_model.dart:61,129` — `_room.value.chatRoomId`)
- CONNECT 헤더에 `Authorization: accessToken` 전달 (`:55`)
- **`/user/queue/errors` 를 구독하지 않습니다.** → 발행 실패가 조용히 삼켜집니다 (§6.4)

### 2.5 메시지 정렬 — `chat_message.dart:102-109`

`opinionType == AGREE` → 좌측 정렬, 그 외 → 우측 정렬. **화자 기준이 아니라 찬반 기준 고정입니다.**

### 2.6 메시지 모델 — `chat_message_entity.dart`

필드: `id, messageType, content, sender, opinionType, userCommunity, timeStamp, profileColor`.
**`threadId` 도 `userId` 도 없습니다.** 발행 payload는 `toStompMessage()` 가 `id`/`profileColor` 제거 후 그대로 전송합니다.
`sender` 는 닉네임 문자열이며 화자 식별에 쓸 수 없습니다 (§4.6.1).

### 2.7 딥링크 — **`/room/*` 미사용 (웹 세션 질문 3에 대한 답)**

앱 전수 조사 결과 **웹 URL로의 딥링크·웹뷰 진입이 존재하지 않습니다.**

- `app_links` / `uni_links` 등 딥링크 패키지 **미사용** (`pubspec.yaml`, `lib/` 전수 검색)
- Android `AndroidManifest.xml` 의 `intent-filter` 는 LAUNCHER 와 **카카오 OAuth 스킴 1개뿐**. App Links 없음
- iOS `Runner.entitlements` 에 `associated-domains` **없음**. `Info.plist` 에 커스텀 URL 스킴 없음
- 앱 내 하드코딩 URL은 API(`api.toronchul.app`), 노션 약관, 카카오 채널, 유튜브뿐. **웹 프론트 도메인 링크 0건**

> **결론: 웹의 `/room/*` 삭제는 앱에 영향이 없습니다.** 웹은 이 건으로 앱을 기다릴 필요가 없습니다.

---

## 3. 변경 목표

### 3.1 위계 2단계로 축소

```
IssueRoomScreen (/issue)         이슈 상세 — 토론 주제 목록(제목 + 찬반 게이지)
  └ 주제 탭 → 토론방 (채팅 + 주제별 스레드 탭)
```

- 찬반 투표만 있던 `DebateRoomScreen` 은 **제거**하고, 그 안의 찬반 투표 UI는 토론방 상단으로 이동합니다.
- 홈 "이런 토론은 어때요" 카드는 해당 주제 탭이 열린 토론방으로 **바로** 이동합니다.

### 3.2 "전체" 탭 신설 `[웹-전달]`

모든 토론 주제의 대화를 한 곳에 모아 보는 탭. 주제 탭들과 나란히 놓이되 **데이터상 스레드가 아니라 컨테이너 방 자체**입니다.

### 3.3 화면 구성 `[웹-전달]`

```
┌ ← 제21대 대통령 선거                     (이슈로 돌아가기)
├ 주제 탭 ────────────────────────────── (가로 스크롤)
│  ( 전체 )( 사전투표 절차 )( 정당·도덕성 )( TV토론 )
├ 사전투표 절차는 신뢰할 만한가?            ← 주제 탭에서만 노출
│  52% ▓▓▓▓▓░░░░░ 48%
│  [👍 찬성]  [👎 반대]
├ ──────────────────────────────────────
│  (메시지 목록)
└ [입력창]
```

### 3.4 탭별 동작 차이 — 이 표가 이 작업의 핵심입니다

| 항목 | 주제 탭 | 전체 탭 |
|---|---|---|
| 조회 | 스레드 기준 | 컨테이너 방 전체 스트림 |
| 메시지 정렬 | **찬반 기준** 좌우 (기존 유지) | **나/남 기준** 좌우 (오른쪽=내 메시지) |
| 말풍선 색 | 찬성/반대 색 | 중립 배경 + **주제 배지**에 찬반 색 |
| 주제 배지 | 없음 | `사전투표 절차 · 찬성` — 누르면 해당 주제 탭으로 이동 |
| 찬반 투표 UI | 노출 | 미노출 |
| 발언 권한 | **투표해야 발언 가능** | **투표 없이 발언 가능** |
| 발행 `threadId` | 해당 스레드 id | `null` |
| 발행 `opinionType` | 그 주제의 `myOpinion` | **`NEUTRAL`** (확정 — §4.7) |
| 팀점수 UI | 노출 | **붙이지 않음** (확정 — §4.7) |

**전체 탭에서 나/남 정렬을 쓰는 이유** `[웹-전달]`: 서로 다른 주제의 "찬성"이 같은 색으로 섞이면
"무엇에 대한 찬성인지" 알 수 없어 오독됩니다. 배지로 정보를 보존하고 말풍선은 중립으로 둡니다.

### 3.5 게이팅 재정의

기존 "투표해야 **입장** 가능"은 폐지합니다. **읽기는 항상 허용**입니다.
"입장을 밝히면 그 쟁점에서 말할 수 있고, 밝히기 싫으면 전체 탭에서 말한다"로 바뀝니다.

- 백엔드에 투표 게이트는 없습니다 `[BE-전달]`. **클라이언트에서 막는 형태**입니다.
- 부수효과 `[BE-전달]`: 주제 탭 발언이 전부 `AGREE`/`DISAGREE` 를 갖게 되어 팀점수·MVP 집계의 `NEUTRAL` 누락이 해소됩니다.

---

## 4. API 스펙 `[웹-전달]` `[BE-전달]` — 앱에서 미검증

### 4.1 토론방 진입 조회

```
GET /api/v2/room?issue-id={issueId}
→ containerRoomId, issueTitle,
  threads[] { threadId, title, agreeCount, disagreeCount, myOpinion }
```

- 이 호출 **하나로** 탭·투표바·목록이 공유합니다. 방별 추가 조회 없음.
- ⚠️ **서버에 threadId 소속 검증이 없습니다** `[BE-전달]`. 반드시 이 응답이 준 `threadId` 만 사용합니다.

### 4.2 메시지 조회

| 탭 | 호출 |
|---|---|
| 주제 탭 | 스레드 기준 조회 (기존 방식) |
| 전체 탭 | `GET /api/v1/chat/rooms/{containerRoomId}/messages` — **threadId 없이** |

백엔드에 `컨테이너 + threadId 없음 → 전체 스트림` 분기가 이미 있습니다 `[BE-전달]`.

- ⚠️ 스레드 조회 쿼리는 `WHERE thread_id = :threadId` 입니다 `[BE-전달]`.
  → **전체 탭에서 쓴 미분류 메시지(`thread_id = null`)는 스레드 방 조회에 절대 안 걸립니다.** §6.2의 근거입니다.

### 4.3 STOMP 발행/구독

| 항목 | 값 |
|---|---|
| 구독 | `/topic/room{containerRoomId}` |
| 발행 | `/stomp/chat.room.{containerRoomId}` |
| payload 필드명 | **`threadId`** (`debateId` 아님 — `ChatMessageRequest.threadId`) |
| CONNECT | `Authorization: Bearer <token>` 또는 raw 토큰 (운영 `auth-required: true`) |
| 에러 수신 | `/user/queue/errors` |
| 본문 길이 | 1~500자 |

동작 `[BE-전달]`:
- 컨테이너로 발행 + `threadId` → `chat_room_id=157, thread_id=71` 정상 저장
- 스레드 방으로 발행 → 클라 `threadId` 는 **버려지고** 방 id 로 덮어씀
- 브로드캐스트 프레임에도 `threadId` 가 실려 옵니다
- `opinionType` 은 **서버 판정이 아니라 클라이언트 값을 그대로 저장** → 계속 전송해야 하며, 값은 선택된 주제의 `myOpinion`
- 발행 시 프로필 없으면 `NOT_FOUND_PROFILE` 실패

### 4.4 ⚠️ `roomId` 는 REST 와 소켓이 다릅니다 `[BE-전달]`

REST 는 컨테이너(157), 소켓은 발행 주소 기준입니다.
**탭 판별은 `threadId` 로만** 하십시오. `roomId` 로 필터하면 어긋납니다.

### 4.5 검증값 `[BE-전달]`

이슈 14 기준 스레드 71/72/73 = 각 15/7/14건.

### 4.6 "내 메시지" 판별 — `userId` + JWT `sub` `[BE-전달]` (2026-08-16 확정)

전체 탭의 나/남 정렬에 필요한 판별 근거입니다. 결론부터: **닉네임 비교는 쓰면 안 되고, `userId` 비교로 갑니다.**

#### 4.6.1 닉네임 비교가 불가능한 이유

`profile.nickname` 에 DB unique index 가 **있습니다**(운영 204 프로필 = 204 고유 닉네임). 그런데도 못 씁니다:

**`chat.sender` 는 프로필 참조가 아니라 발화 시점의 문자열 스냅샷**입니다. 발행 시 그 순간 닉네임을 박아 넣고 끝이며, 닉네임은 변경 가능합니다. 운영 데이터에서 이미 깨져 있습니다:

```
distinct_senders            70
senders_absent_in_profile   32     ← 46%
```

과거 발화자 70명 중 32명의 `sender` 가 현재 어떤 프로필과도 매칭되지 않습니다.
유니크 제약은 "지금 이 순간"만 보장하고 시간축은 보장하지 않습니다.

#### 4.6.2 `isMine` 이 아니라 `userId` 인 이유

브로드캐스트가 `@SendTo` 로 **단일 페이로드를 모든 구독자에게 그대로** 뿌리므로 수신자별 값을 넣을 수 없습니다.
REST 만 `isMine` 을 주면 소켓/REST 판별 로직이 갈라져 더 나쁩니다.

→ `ChatMessageResponse.userId` 를 **REST·소켓 양쪽**에 싣고, 클라가 자기 userId 와 비교합니다.
`chat.user_id` 는 이미 저장 중이라 DTO 노출만 하면 되고 스키마 변경이 없어 **구버전 앱 무파손**입니다.
**단, 백엔드 사용자 승인 대기 중입니다 — 이 작업의 유일한 잔여 블로커.**

#### 4.6.3 ⚠️ 과거 메시지 98% 가 `userId` null 입니다

```
user_id 있음     6
user_id NULL   381
```

`user_id` 저장이 WebSocket 인증 게이트 이후부터라 기존 387건 중 381건이 null 입니다.
앞으로 쌓이는 건 전부 채워집니다(운영 `auth-required: true` 라 미인증 발행 거부).

→ **`userId == null` 은 "판별 불가 → 남의 메시지(왼쪽)" 로 렌더**합니다.
null 을 내 것으로 떨어뜨리면 **옛 대화가 전부 오른쪽에 붙습니다.**

#### 4.6.4 "내 userId" 는 JWT `sub` 에서 — 프로필 API 변경 불필요

액세스 토큰 payload:

```json
{ "typ": "JWT", "sub": "123", "iat": ..., "exp": ..., "type": "ACCESS", "role": "USER" }
```

- 별도 `userId` 클레임은 **없습니다.** 표준 `sub` 를 씁니다.
- 발급부가 `.subject(userId.toString())` 이라 **`sub` 는 문자열**입니다.

**⚠️ 타입 불일치 — 조용히 실패합니다:**

| | 값 | 타입 |
|---|---|---|
| JWT `sub` | `"123"` | **문자열** |
| `ChatMessageResponse.userId` | `123` | **숫자** (Jackson Long → JSON number) |

같은 값인데 타입이 달라 그냥 비교하면 **항상 false** → 전체 탭 메시지가 **전부 왼쪽에 붙는 형태로 조용히 실패**합니다. 에러가 안 나서 놓치기 쉽습니다.

**필수 구현 순서 (null 체크가 캐스팅보다 먼저):**

```
if (message.userId == null) → 남의 메시지 (왼쪽)
else → int.parse(sub) == message.userId 비교
```

캐스팅을 먼저 하면 `null → 0` 으로 떨어져 오작동 여지가 생깁니다.

**앱 적용 가능성 `[앱-실측]` — 가능합니다.** `lib/utils/jwt_util.dart` 에 외부 패키지 없이
`base64Url` 로 payload 를 디코드하는 `JwtUtil` 이 이미 있습니다(만료 체크용, `splash_view_model.dart:70` 에서 사용 중).
`_readExp` 와 동일한 방식으로 `sub` 를 읽는 메서드만 추가하면 됩니다. **프로필 API 변경 요청 불필요.**

부수 사항:
- **액세스 토큰을 쓸 것.** refresh 에도 같은 `sub` 가 있으나 `type` 클레임으로 구분됩니다.
- `role` 클레임은 구버전 토큰에 **없을 수 있습니다.** 훗날 ADMIN 분기에 쓸 일이 있으면 `null` → USER 로 취급 (서버도 동일).
- 자릿수 문제 없음 (프로필 204개).
- 서명 검증 생략 가능 — 서버가 요청마다 검증하고, 클라 용도는 "내 말풍선 정렬" 뿐이라 위조해도 자기 화면만 이상해집니다.
  **단 권한 판단에는 절대 쓰지 말 것.**

### 4.7 전체 탭 `opinionType` 과 팀점수 `[BE-전달]` (2026-08-16 확정)

- **`opinionType` 은 `NEUTRAL`** 로 보냅니다. `null` 아님 — 미투표 기본값 관례와 맞고,
  null 은 "값 없음"과 "중립"이 구분되지 않아 나중에 곤란해집니다.
- 미분류 발언(`thread_id = null`)은 **주제 팀점수에 안 샙니다** (집계 쿼리 양쪽 절 모두 불일치).
- 컨테이너 기준 조회 경로가 존재하지만(`GET /api/v1/room?chat-room-id=157`) `NEUTRAL` 이라 걸러집니다.
  덧붙여 그 경로에서는 주제 발언도 안 잡혀 **컨테이너 기준 팀점수는 사실상 항상 0** 입니다.
  → **전체 탭에 팀점수 UI 를 붙이지 마십시오.**
- **백엔드 집계 정책 변경 불필요** 확정.
- §3.5 발언 권한 규칙과 위 `NEUTRAL` 처리는 **확정**입니다.

---

## 5. 모바일 작업 범위

### 5.1 데이터 레이어

| 작업 | 대상 |
|---|---|
| `RoomV2Res` / `ThreadRes` DTO 추가 | `lib/features/chat/data/models/` |
| `getRoomV2({@Query('issue-id') int issueId})` 추가 | `room_data_source.dart` |
| 메시지 조회에 스레드/컨테이너 분기 | `chat_rooms_messages_data_source.dart` |
| `ChatMessageEntity` 에 `int? threadId` 추가 | `chat_message_entity.dart` — `toStompMessage()` 에 포함 |
| `ChatMessageEntity` 에 `int? userId` 추가 (수신 전용, 발행 payload 제외) | `chat_message_entity.dart` — §4.6 |
| `JwtUtil` 에 `sub` 읽기 추가 (`static int? readUserId(String token)`) | `lib/utils/jwt_util.dart` — `_readExp` 와 동일 패턴, **`int.parse` 로 문자열→숫자 변환** |
| Entity/Mapper (`ThreadEntity`, `ContainerRoomEntity`) | `domain/entities/`, `data/mappers/` |

`build_runner` 재생성 필요 (`*.g.dart`, `*.freezed.dart`).

### 5.2 실시간 레이어 — `stomp_service.dart`

| 작업 |
|---|
| 구독 대상을 `containerRoomId` 로 변경 |
| 발행 대상을 `/stomp/chat.room.{containerRoomId}` 로 변경 + payload 에 `threadId` |
| `/user/queue/errors` 구독 추가 → 발행 실패를 사용자에게 노출 (현재 조용히 삼켜짐) |
| 수신 프레임을 `threadId` 로 분류해 탭별 스트림에 배분 (**`roomId` 로 필터 금지** — §4.4) |

### 5.3 프레젠테이션 레이어

| 작업 | 대상 |
|---|---|
| `DebateRoomScreen` 제거, 찬반 투표 UI를 토론방 상단으로 이동 | `debate_room_screen.dart`, `debate_room_view_model.dart` |
| 주제 탭바(가로 스크롤) + 전체 탭 | 신규 위젯 |
| 전체 탭 전용 메시지 정렬(나/남) + 주제 배지 | `chat_message.dart` (현재 찬반 고정 정렬 — §2.5). **§4.6.4 순서 준수: null 체크 → `int.parse` 비교** |
| 배지 탭 → 해당 주제 탭 이동 | 신규 |
| 발언 게이팅 재구현 (주제 탭만 투표 요구) | `chat_input_field.dart` 부근 |
| `/debate` 진입점 3곳을 토론방 직행으로 교체 | `issue_room_screen.dart:256`, `home_recommend_page.dart:91,259` |
| 라우트 정리 (`GetRouterName.debate` 제거 여부) | `get_router_name.dart`, `get_router.dart` |

**"내 메시지" 판별 근거가 필요합니다 — §9-2.** 현재 `ChatMessageEntity` 에는 `sender`(닉네임 문자열)뿐이고
사용자 id 가 없습니다. 닉네임 비교는 동명이인에서 깨집니다.

---

## 6. ⚠️ 컨테이너 방 전환은 웹·앱이 **같이** 가야 합니다

이 절이 이 작업의 핵심 제약입니다. `[BE-전달]` — 백엔드 세션이 코드·운영 DB 실측으로 확인한 내용입니다.

### 6.1 지금 상태

- 메시지 **저장은 이미 합쳐져** 있습니다: `chat_room_id=157(컨테이너), thread_id=71(스레드)`
- 그런데 **실시간은 분리**돼 있습니다. `WebSocketControllerV1` 의 `@SendTo("/topic/room{roomId}")` 가 전부이고
  **fan-out 이 없습니다** — 발행한 주소로만 브로드캐스트됩니다.
- 웹·앱 둘 다 현재 스레드 방(71/72/73)에 구독·발행 중이라 지금은 갈라지지 않습니다.

### 6.2 한쪽만 옮기면 생기는 일

| 상황 | 결과 |
|---|---|
| 앱만 컨테이너(157)로 이동 | 웹(스레드 방)과 앱이 **실시간으로 서로 안 보임**. 새로고침하면 보이고 실시간은 안 보이는 최악의 형태 |
| 한쪽이 구버전인 채 전체 탭 사용 | 전체 탭 발언은 `thread_id = null` → 스레드 방 조회(`WHERE thread_id = :threadId`)에 **절대 안 걸림** → 그쪽 사용자는 **영원히 못 봄** |

전체 탭 발언은 지금까지 없던 데이터입니다. **현재 운영 DB에 미분류 메시지는 0건** `[BE-전달]` 이라,
없던 상태를 새로 만드는 것입니다.

### 6.3 필요한 것

1. **웹·앱 동시 전환**: 구독 `/topic/room{containerRoomId}`, 발행 `/stomp/chat.room.{containerRoomId}` + payload `threadId`
2. **구버전 앱 사용자 처리** — 아래 둘 중 하나 `[미정]` §9-1
   - (A) **강제 업데이트**: 앱에 이미 서버 주도 `forceUpdate` 플래그가 있습니다 `[앱-실측]`
     (`splash_screen.dart:55`, `app_version_entity.dart:8`) → 별도 개발 없이 서버 설정으로 발동 가능
   - (B) **백엔드 fan-out**: 컨테이너·스레드 두 토픽 동시 브로드캐스트 + 앱 중복 수신 방지.
     백엔드 세션 입장은 "규모는 작지만 앱 중복 수신 처리가 얽혀서 그냥 작진 않다"

### 6.4 부수 위험 — 조용한 실패

앱은 `/user/queue/errors` 를 구독하지 않습니다 `[앱-실측]`.
전환 후 `threadId` 불일치나 `NOT_FOUND_PROFILE` 이 나면 **"보냈는데 아무 일도 안 일어남"** 으로 보입니다.
전환 배포 **전에** 에러 큐 구독을 먼저 넣는 것을 권장합니다 (단독으로 안전하며, 되돌릴 필요 없는 개선).

---

## 7. 배포 순서 — 어긋나면 운영에서 대화가 갈라집니다

```
[0] 앱: /user/queue/errors 구독 추가             ← 단독 선행 가능. 안전
     │
[1] 앱: 컨테이너 전환 + 탭/전체탭 구현 → 스토어 심사 제출
     │   iOS 심사 1~3일 소요. 이 기간 동안 아무것도 전환하지 않음
     │
[2] 앱 심사 통과 & 배포 완료 확인
     │
[3] 구버전 차단: forceUpdate 플래그 ON (안 A) 또는 fan-out 배포 완료 (안 B)
     │
[4] 웹 배포 (컨테이너 전환분)     ← 앱보다 먼저 나가면 안 됩니다
     │
[5] 전체 탭 개방 (양쪽 다 컨테이너에 있는 것을 확인한 뒤)
```

**핵심**: 전체 탭(`thread_id = null`)은 **[3]이 끝나기 전에는 열면 안 됩니다.**
구버전 앱 사용자가 그 메시지를 영영 못 보기 때문입니다.

- 웹은 "모바일 배포 뒤에 붙인다"는 입장을 이미 밝혔습니다 `[웹-전달]` — [4]와 일치합니다.
- **웹의 `/room/*` 삭제분은 이 순서와 무관하게 먼저 나가도 됩니다** (§2.7 — 앱이 안 씁니다).

### 7.1 릴리스 편성 — **같은 빌드에 합류 (사용자 결정, 2026-08-16)**

다음 앱 출시에 잡혀 있는 "빌드/배포 품질 개선" 3건(Flutter 3.27→3.44 업그레이드, iOS/Android 스토어 권장조치)과
**같은 빌드로 나갑니다.** 현재 브랜치 `fix/store-build-deploy-warnings` 도 그중 하나입니다 `[앱-실측]`.

기록해 둘 트레이드오프: Flutter 3.44 업그레이드는 89파일 규모라, 채팅 구조 변경과 한 빌드에 들어가면
문제 발생 시 회귀 원인 분리가 어렵습니다. 이를 감안한 결정이므로 아래를 검증 단계에서 보완합니다.

- 두 작업을 **별개 브랜치·별개 PR** 로 유지해 develop 에서 합칩니다 (기존 계획과 동일).
- 실기기 회귀 테스트를 **업그레이드분 먼저 / 채팅 변경분 나중** 2회로 나눠, 원인 구간을 좁힙니다.
- 채팅 구조 변경은 §7 의 [1] 단계에 해당하므로, **이 합본 빌드가 스토어에 올라간 뒤에야 웹이 [4] 로 갈 수 있습니다.**
  즉 3.44 업그레이드 일정이 밀리면 웹 배포도 같이 밀립니다. 웹 세션에 공유 필요.

---

## 8. 작업 분해 (제안)

| # | 작업 | 선행 | 비고 |
|---|---|---|---|
| 1 | `/user/queue/errors` 구독 | — | 단독 배포 가능 |
| 2 | `/api/v2/room` DTO·DataSource·Entity·Mapper | — | `build_runner` |
| 3 | `ChatMessageEntity.threadId` 추가 | 2 | 발행 payload 포함 |
| 3b | `ChatMessageEntity.userId` (수신 전용) + `JwtUtil.readUserId` | — | §4.6. **백엔드 `userId` 승인·배포 후에야 검증 가능** |
| 4 | STOMP 컨테이너 전환 + threadId 라우팅 | 3 | §4.4 주의 |
| 5 | 토론방 탭 UI (주제 탭바) | 2 | |
| 6 | 찬반 투표 UI 이동 + 중간 화면 제거 | 5 | 진입점 3곳 수정 |
| 7 | 전체 탭 (조회·정렬·배지) | 4,5 | §9-2 선결 |
| 8 | 발언 게이팅 재구현 | 5 | |
| 9 | 라우트 정리 | 6 | |
| 10 | 검증 (§4.5 검증값 대조, 양 플랫폼 실기기) | 전부 | |

---

## 9. 결정 현황

### 9.1 확정됨

| # | 항목 | 결정 | 일자 |
|---|---|---|---|
| 2 | "내 메시지" 판별 | `ChatMessageResponse.userId` (REST·소켓 양쪽) vs JWT `sub`. 닉네임 비교 폐기. **앱은 기존 `JwtUtil` 확장으로 대응 가능, 프로필 API 변경 불필요** — §4.6 | 08-16 |
| 3 | 전체 탭 `opinionType` | **`NEUTRAL`**. 집계 정책 변경 불필요. 전체 탭에 팀점수 UI 금지 — §4.7 | 08-16 |
| 4 | 릴리스 편성 | **Flutter 3.44 빌드에 합류** — §7.1 | 08-16 |
| — | 딥링크 | 앱은 `/room/*` 미사용. 웹은 삭제분 선행 배포 가능 — §2.7 | 08-15 |

### 9.2 미해결 — 착수 전 필요

| # | 항목 | 상태 | 결정 주체 |
|---|---|---|---|
| 1 | 구버전 앱 처리 | (A) 강제 업데이트 / (B) 백엔드 fan-out. 앱에 `forceUpdate` 플래그가 이미 있어 (A) 가 저렴 — §6.3 | 기획 + 백엔드 |
| 2' | `ChatMessageResponse.userId` DTO 노출 | **백엔드 사용자 승인 대기 중.** 이게 없으면 전체 탭 착수 불가 — §4.6.2 | 백엔드 |
| 5 | `/debate` 라우트 | 완전 제거 / 유지 후 리다이렉트 | 모바일 |
| 6 | 전체 탭 기본 선택 여부 | 진입 시 전체 탭이 기본인지, 특정 주제 탭이 기본인지 | 기획 |

---

## 10. 웹 세션 공유 현황

### 10.1 회신 완료 (08-15)

1. **`/room/*` 딥링크 — 앱은 사용하지 않습니다.** 딥링크 패키지·App Links·Universal Links·커스텀 스킴 모두 없습니다.
   웹은 이 건으로 앱을 기다릴 필요가 없습니다. (§2.7 근거)
2. 백엔드 확인 요청 2건 전달 → **둘 다 답변 수령, §4.6·§4.7 에 반영 완료.**

### 10.2 회신 예정 (08-16)

1. **릴리스 편성: Flutter 3.44 업그레이드와 같은 빌드로 확정.** 3.44 일정이 밀리면 웹 배포도 같이 밀립니다 (§7.1).
2. **JWT `sub` 방식 앱에서도 채택.** `lib/utils/jwt_util.dart` 에 동일 방식 유틸이 이미 있어 프로필 API 변경 요청 불필요 (§4.6.4).
3. **모바일은 사용자 지시로 구현 착수 보류.** PRD 만 유지 중입니다. 착수 시점이 정해지면 즉시 공유합니다.
4. 웹도 §4.6.3(과거 메시지 98% `userId` null → 왼쪽 렌더)과 §4.6.4(문자열/숫자 타입 불일치)를 동일하게 적용해야 합니다.
