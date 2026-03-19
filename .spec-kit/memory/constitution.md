# my-awesome-app Constitution

## Core Principles

### I. Phase-Gated Development (NON-NEGOTIABLE)

**Rule**: Phase 1 creates ONLY blank project skeleton. No models, no endpoints, no auth, no CRUD, no database connection.

**Rationale**: Establishes clean foundation; complexity added only via future specs.

### II. Folder Structure (IMMUTABLE)

**Rule**: Monorepo structure MUST be:
```
pink_gpt_operation/
├── backend/              # FastAPI async-ready project
│   └── app/
│       ├── api/
│       │   ├── v1/
│       │   │   ├── endpoints/
│       │   │   └── router.py
│       │   └── dependencies.py
│       ├── core/
│       │   ├── config.py
│       │   ├── security.py
│       │   └── database.py
│       ├── models/
│       ├── schemas/
│       ├── services/
│       ├── repositories/
│       └── main.py
├── frontend/             # Next.js 15+ App Router
│   └── [standard Next.js structure: app/, components/, lib/, public/]
└── .spec-kit/            # Spec-Kit files (constitution, memory-bank, templates)
```

**Rationale**: Enforced structure ensures consistency across all developers.

### III. Phase Isolation (NON-NEGOTIABLE)

**Rule**: Each phase delivers ONLY its spec. No feature creep, no premature optimization, no "while we're at it" additions.

**Phase 1 Scope**:
- Backend: `main.py` with `FastAPI()` instance only (empty)
- Frontend: `/` page with text "Welcome – coming soon"

**Rationale**: Prevents scope creep; features added via new specs only.

### IV. Async-First Patterns (MANDATORY when adding code)

**Rule**: Backend uses async patterns, dependency injection, Pydantic v2 for future phases.

**Rationale**: Async-ready foundation prevents rewrite when adding I/O-bound features.

### V. Spec-Driven Development (NON-NEGOTIABLE)

**Rule**: No vibe coding. Everything originates from a spec. Implementation follows spec exactly.

**Rationale**: Traceability, testability, and deliberate design over ad-hoc changes.

## Development Phases

### Phase 1: Blank Skeleton (CURRENT)

**Deliverable**: Empty project structure per folder structure rule.

**Acceptance**:
- [ ] `backend/app/main.py` exists with `FastAPI()` instance
- [ ] `frontend/app/page.tsx` renders "Welcome – coming soon"
- [ ] All empty directories created
- [ ] No business logic, no models, no endpoints

### Future Phases (via new specs)

Each feature added via `/speckit.specify` → `/speckit.plan` → `/speckit.tasks` → `/speckit.implement`.

## Technical Standards (for future phases)

### Backend
- FastAPI with async patterns
- Pydantic v2 for schemas
- Dependency injection via FastAPI's `Depends()`
- Repository pattern for data access
- Service layer for business logic

### Frontend
- Next.js 15+ App Router
- TypeScript strict mode
- Tailwind CSS for styling
- Client/server component separation

### Testing & OpenAPI
- Tests added in later phases
- OpenAPI docs added when endpoints exist

## Governance

**Version**: 1.0.0 | **Ratified**: 2026-03-19 | **Last Amended**: 2026-03-19

- Constitution supersedes all practices
- Amendments require new spec
- Phase gates are immutably enforced
- No deviation from folder structure
