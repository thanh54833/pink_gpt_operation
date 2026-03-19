# pink_gpt_operation

Monorepo with FastAPI backend and Next.js frontend.

## Structure

- `backend/` — FastAPI async-ready API
- `frontend/` — Next.js 15+ App Router
- `.spec-kit/` — Spec-driven development artifacts

## Quick Start

### Backend

```bash
cd backend
python -m venv .venv
source .venv/bin/activate
pip install fastapi uvicorn
uvicorn app.main:app --reload --port 8001
```

### Frontend

```bash
cd frontend
npm install
npm run dev -- --port 3001
```

## Development

This project uses Spec-Driven Development. See `.spec-kit/` for constitution and specs.
