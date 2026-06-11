# pdf-translate-skill

[ENGLISH](README.md)

PDF 레이아웃을 가능한 한 유지하면서 에이전트가 PDF를 번역하도록 돕는 스킬입니다.

- Codex, Claude Code, agents 호환 런타임에서 사용 가능
- 기본 엔진은 PDFMathTranslate의 공식 `pdf2zh` CLI
- 최종 산출물은 번역된 PDF

-그림위치-

## 설치

```bash
npx --yes skills add https://github.com/AIKONG2024/pdf-translate-skill --all -g
```

이 저장소에서 로컬 개발용으로 설치하려면:

```bash
npx --yes skills add . --all -g
```

## 설정

PDF 번역 엔진을 설치합니다:

```bash
python -m pip install pdf2zh
pdf2zh --help
```

유료 또는 API 키가 필요한 번역 서비스를 사용할 경우, 해당 서비스에 필요한 환경 변수만 설정하면 됩니다.

주요 예시:

| Provider | Environment variables |
| --- | --- |
| Google | 없음 |
| DeepL | `DEEPL_AUTH_KEY` |
| OpenAI | `OPENAI_API_KEY`, 선택적으로 `OPENAI_MODEL` |
| Gemini | `GEMINI_API_KEY`, 선택적으로 `GEMINI_MODEL` |
| Ollama | `OLLAMA_HOST`, `OLLAMA_MODEL` |

## 사용

에이전트에게 이렇게 요청하세요:

```text
이 PDF를 프랑스어로 번역하고 레이아웃을 유지해줘: /path/to/paper.pdf
```

에이전트는 원문 언어와 목표 언어를 확인해야 합니다. 클라우드 번역 서비스를 사용할 경우, PDF에서 추출한 텍스트를 해당 제공자에게 전송해도 되는지 먼저 확인해야 합니다.

## 출력

```text
outputs/pdf_translate/<run-id>/
├── source/
│   └── original.pdf
├── translated-<target-lang>.pdf
└── translation-summary.md
```

사용할 최종 파일은 다음입니다:

```text
translated-<target-lang>.pdf
```

## 참고

- 이 스킬은 PDFMathTranslate, BabelDOC, 모델, wheel, 샘플 PDF를 저장소에 포함하지 않습니다.
- 현재 공식 `pdf2zh` 릴리스는 BabelDOC 같은 upstream 런타임 의존성을 설치할 수 있습니다.
- 이 스킬은 기본적으로 선택 기능인 `--babeldoc` 백엔드를 호출하지 않습니다.
- 스캔본 또는 이미지 기반 PDF는 먼저 OCR을 수행해야 하며, 그렇지 않으면 결과가 제한될 수 있습니다.
- 자세한 사용법은 [docs/features/pdf-translate.md](docs/features/pdf-translate.md)에 있습니다.
