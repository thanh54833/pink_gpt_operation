# Implementation Plan: Phase 1 Skeleton

**Branch**: `001-blank-skeleton` | **Date**: 2026-03-19 | **Spec**: `.spec-kit/pink_gpt_operation.spec.md`

## Summary

Create blank monorepo skeleton for pink_gpt_operation with FastAPI backend and Next.js frontend. Phase 1 delivers only empty project structure — no business logic, no models, no endpoints beyond root health check.

## Constitution Check

- [x] Phase-Gated Development: Phase 1 creates ONLY blank skeleton
- [x] Folder Structure: Follows immutably defined structure
- [x] Phase Isolation: No feature creep, no premature additions
- [x] Spec-Driven Development: All work originates from this spec

## Project Structure

```
pink_gpt_operation/
├── backend/
│   └── app/
│       ├── __init__.py
│       ├── main.py
│       ├── api/
│       │   ├── __init__.py
│       │   ├── v1/
│       │   │   ├── __init__.py
│       │   │   ├── endpoints/
│       │   │   │   └── __init__.py
│       │   │   └── router.py
│       │   └── dependencies.py
│       ├── core/
│       │   ├── __init__.py
│       │   ├── config.py
│       │   ├── security.py
│       │   └── database.py
│       ├── models/
│       ├── schemas/
│       ├── services/
│       └── repositories/
├── frontend/
│   ├── app/
│   │   ├── layout.tsx
│   │   └── page.tsx
│   ├── components/
│   ├── lib/
│   ├── public/
│   ├── package.json
│   ├── tailwind.config.ts
│   ├── tsconfig.json
│   └── next.config.ts
└── .spec-kit/
    └── memory/
        └── constitution.md
```

## Tasks

---

### T001: Create Monorepo Root Structure

**Files to create**: None (structure already exists)

**What to verify**:
- [ ] `backend/` directory exists
- [ ] `frontend/` directory exists
- [ ] `.spec-kit/memory/` directory exists with `constitution.md`

**Dependencies**: None

**Acceptance**: Directory structure visible in filesystem

---

### T002: Setup Backend Core Files

**Files to create/modify**:
- `backend/app/api/v1/router.py` — Empty FastAPI APIRouter
- `backend/app/api/dependencies.py` — Empty file (placeholder for future dependencies)
- `backend/app/core/config.py` — Empty file (placeholder for future settings)
- `backend/app/core/security.py` — Empty file (placeholder for future auth)
- `backend/app/core/database.py` — Empty file (placeholder for future DB)

**What to put inside**:
- `router.py`: `from fastapi import APIRouter; router = APIRouter()` — empty router for future endpoints
- Other files: Empty or minimal placeholder comments

**Dependencies**: T001

**Acceptance**: All files exist, no Python errors on import

---

### T003: Add Root Health Check Endpoint

**Files to modify**:
- `backend/app/main.py`

**What to put inside**:
```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "API ready"}
```

**Dependencies**: T002

**Acceptance**: `GET /` returns `{"message": "API ready"}` with HTTP 200

---

### T004: Setup Frontend Core Files

**Files to create/modify**:
- `frontend/package.json` — Minimal Next.js 15+ config
- `frontend/tsconfig.json` — TypeScript config
- `frontend/tailwind.config.ts` — Tailwind CSS config
- `frontend/next.config.ts` — Next.js config
- `frontend/postcss.config.js` — PostCSS for Tailwind

**What to put inside**:
- `package.json`: Next.js 15, React 18, TypeScript, Tailwind CSS dependencies
- `tsconfig.json`: Standard Next.js TypeScript config
- `tailwind.config.ts`: Standard Tailwind config with content paths
- `next.config.ts`: Standard Next.js config
- `postcss.config.js`: `tailwindcss`, `autoprefixer`

**Dependencies**: T001

**Acceptance**: `npm install` succeeds in frontend/ directory

---

### T005: Create Frontend Root Page

**Files to modify**:
- `frontend/app/page.tsx` — Root page component

**What to put inside**:
```tsx
export default function Home() {
  return (
    <main className="min-h-screen flex items-center justify-center">
      <h1 className="text-2xl font-bold text-gray-900">Welcome – coming soon</h1>
    </main>
  )
}
```

**Dependencies**: T004

**Acceptance**: Page renders "Welcome – coming soon" text

---

### T006: Add Root Gitignore

**Files to create**:
- `.gitignore`

**What to put inside**:
```
# Python
__pycache__/
*.py[cod]
*$py.class
.venv/
venv/
ENV/
*.egg-info/
dist/
build/

# Node
node_modules/
.npm
.yarn/

# Next.js
.next/
out/
*.tsbuildinfo

# Environment
.env
.env.local
.env.*.local

# IDE
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
npm-debug.log*
```

**Dependencies**: None

**Acceptance**: `.gitignore` contains Python, Node, Next.js, and env patterns

---

### T007: Add Root README

**Files to create**:
- `README.md`

**What to put inside**:
```markdown
# pink_gpt_operation

Monorepo with FastAPI backend and Next.js frontend.

## Structure

- `backend/` — FastAPI async-ready API
- `frontend/` — Next.js 15+ App Router
- `.spec-kit/` — Spec-driven development artifacts

## Quick Start

### Backend

\`\`\`bash
cd backend
python -m venv .venv
source .venv/bin/activate
pip install fastapi uvicorn
uvicorn app.main:app --reload --port 8001
\`\`\`

### Frontend

\`\`\`bash
cd frontend
npm install
npm run dev -- --port 3001
\`\`\`

## Development

This project uses Spec-Driven Development. See `.spec-kit/` for constitution and specs.
```

**Dependencies**: T001, T003, T005

**Acceptance**: README describes project structure and startup commands

---

### T008: Final Verification

**Actions**:
- Run `uvicorn backend.app.main:app --port 8001 --reload`
- Run `npm run dev -- --port 3001` in frontend/
- Verify `GET http://localhost:8001/` returns `{"message": "API ready"}`
- Verify `http://localhost:3001/` shows "Welcome – coming soon"

**Dependencies**: T003, T005

**Acceptance**: Both services run without errors, return expected responses

---

## Dependencies & Execution Order

| Task | Dependencies | Notes |
|------|-------------|-------|
| T001 | — | Already done |
| T002 | T001 | |
| T003 | T002 | |
| T004 | T001 | |
| T005 | T004 | |
| T006 | — | |
| T007 | T001, T003, T005 | |
| T008 | T003, T005 | Final verification |

## Running Order

1. T002 → T003 (backend setup sequence)
2. T004 → T005 (frontend setup sequence)
3. T006, T007 (docs)
4. T008 (verification)
