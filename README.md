# 소닉과 암흑의 기사 한국어 패치

**v0.1 alpha** · 북미판 Wii `RENE8P` · Dolphin용 시험 배포

한글 UI, 본편·인게임 자막, 특전 자막의 국가명 및 한국어 Wii 리모컨 안전 안내를 적용합니다. 영어·일본어 음성 선택은 유지합니다. 이름 입력 화면은 버튼과 안내만 번역했으며 한글 이름 입력 기능은 포함하지 않습니다.

[최신 릴리스 다운로드](https://github.com/nonunsaram/sonic-and-the-black-kinght-korean/releases) · [문제 제보](https://github.com/nonunsaram/sonic-and-the-black-kinght-korean/issues)

## 설치 — Windows

1. 릴리스에서 `sonic-and-the-black-kinght-korean-v0.1-alpha.zip`을 내려받아 **압축을 풉니다**.
2. 본인이 보유한 북미판 원본 ISO를 준비합니다. RVZ/WBFS는 먼저 Dolphin에서 ISO로 변환하고 아래 해시와 일치하는지 확인하세요.
3. `Apply-Patch.cmd`를 실행하고 원본 ISO를 선택합니다. 원본은 보존하며 같은 폴더에 `Sonic and the Black Knight KR v0.1 alpha.iso`를 만듭니다. 원본·패치·결과의 SHA-256을 자동 검사합니다.
4. Dolphin에서 새 ISO를 실행합니다. 게임 내 옵션의 **자막 언어를 한국어**로 선택하세요. 처음에는 원래 언어 메뉴의 **日本語/Japanese 위치**를 선택하면 됩니다. 음성 언어는 별도로 선택할 수 있습니다.
5. 기존 Riivolution 한국어 패치를 겹쳐 적용하지 말고 새 ISO 자체를 실행합니다. 게임 ID는 유지되므로 같은 Dolphin 사용자 폴더의 기존 세이브를 사용합니다.

원본 외에 출력 ISO를 위한 약 4.7GB의 여유 공간이 필요합니다. 동봉 xdelta 실행 파일은 Windows x64용입니다. macOS/Linux에서는 별도 xdelta3를 사용하세요.

### 다른 xdelta 도구로 적용

```text
xdelta3 -d -s "original.iso" "sonic-and-the-black-kinght-korean-v0.1-alpha.xdelta" "Sonic Black Knight Korean.iso"
```

`.xdelta` 단독 파일은 별도 패치 도구를 쓰는 분을 위한 것입니다. 처음 사용하시면 ZIP 묶음을 권장합니다. 패치에는 원본 ISO가 포함되지 않습니다.

## 지원 원본

| 항목 | 값 |
|---|---|
| 게임 | Sonic and the Black Knight (USA) (En,Ja,Fr,De,Es,It) |
| 게임 ID | RENE8P |
| 원본 크기 | 4,699,979,776 bytes |
| 원본 SHA-256 | `dd2fdfe0edbbd13fcf69cee9cf6bf5ce7096f8b340a67c6f56f7028c22df65ad` |
| 패치 후 SHA-256 | `1616c1a7ca2306e13160ac03f11fa5cb9ce62f6125dcc26fcc866a05cb1ffd5c` |

다른 지역판, NKit, 기존 수정 ISO 또는 해시가 다른 덤프에는 이 패치를 적용하지 않습니다. 파일명만 같다고 같은 원본은 아닙니다.

## Xbox 패드 설정

동봉 `Sonic-Black-Knight-Xbox.ini`은 제작자가 실제 사용 중인 Xbox/XInput 설정입니다. 스틱 끝·대각선에서 이동이 멈추던 문제를 해결한 **눈차크 보정값을 포함**합니다.

1. Dolphin → **파일 → 사용자 폴더 열기**.
2. `Config/Profiles/Wiimote` 폴더에 INI를 복사합니다. 폴더가 없으면 만드세요.
3. 컨트롤러 → Wii 리모컨 1 → **에뮬레이트된 Wii 리모컨** → 설정.
4. 프로필에서 `Sonic-Black-Knight-Xbox`를 선택하고 **불러오기**.
5. 장치를 실제 Xbox 패드로 선택하고 확장 장치가 **눈차크(Nunchuk)**인지 확인합니다.
6. 다른 패드는 눈차크 스틱을 **보정(Calibrate)**하세요. 바깥 테두리를 따라 천천히 한두 바퀴 돌린 뒤 손을 놓고 완료합니다. 포함된 보정값은 모든 패드에 동일하게 맞는 값은 아닙니다.

| Xbox | 기능 / 연결 |
|---|---|
| 왼쪽 스틱 | 이동·메뉴 선택 |
| A | 점프·확인 |
| B / RB | Wii B: 취소·소울 서지 |
| X | Wii 리모컨 흔들기: 검 공격 |
| Y | Wii 1 / 눈차크 흔들기 |
| LT / RT | 눈차크 Z: 방어·주민 대화 |
| LB | Wii 2 / 눈차크 C |
| 오른쪽 스틱 좌우 | Wii 리모컨 좌우 기울이기 |
| Start / View | Wii + / - |
| 방향키 | Wii 십자 버튼 |

기존 전체 설정 파일 `WiimoteNew.ini`를 덮어쓰는 방식이 아닙니다. `XInput/0/Gamepad`가 실제 장치와 다르면 불러온 뒤 장치 목록을 바꾸세요.

## 알파 상태와 검증 범위

- UI 번역 및 정렬 수정, 대사·특전 한국어 2,019셀 적용을 포함합니다.
- CG 28개·429항목의 원문과 장면을 대조했습니다. 짧은 반응·동시 발화 4항목의 개별 화자는 미확정이며 음성 전체 청취는 미완료입니다.
- 일부 원래 영문 연출 문구·작가명은 유지합니다. 전체 플레이에 따른 오역·줄바꿈·화면 겹침 검수는 계속 필요합니다.
- Wii 데이터 해시 검사, xdelta 적용 후 ISO 완전 일치 검사, 게임 파일 914개의 내용 비교를 통과했습니다. 변경 대상 35개 외 879개 파일과 실행 파일은 원본과 같습니다.
- **배포용 ISO의 실플레이·엔딩까지 크래시 검증은 하지 않았습니다.** 안정성이 보장된 정식판이 아닙니다. 실기 Wii는 지원 확인 대상이 아닙니다.

문제를 제보하실 때 화면 사진, 발생 위치, Dolphin 버전과 사용한 패치 버전을 남겨 주세요. 게임 ISO나 세이브에 포함된 개인 정보는 올리지 마세요.

## 출처

번역·패치: nonunsaram 프로젝트. 게임·캐릭터 저작권은 SEGA에 있습니다. 본 프로젝트는 비공식 팬 번역입니다. 글꼴과 동봉 도구의 출처·라이선스는 `CREDITS.md`와 `licenses/`를 확인하세요.
