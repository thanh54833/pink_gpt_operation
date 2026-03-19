# Phase 1 Tasks: Blank Skeleton

**Spec**: `.spec-kit/pink_gpt_operation.spec.md`  
**Plan**: `.spec-kit/001-blank-skeleton/plan.md`

## Task List

- [ ] **T001**: Verify root structure exists  
  - Check: `backend/`, `frontend/`, `.spec-kit/` directories present  
  - Files: None  
  - Effort: 1 min

---

- [ ] **T002**: Create backend placeholder files  
  - Create: `backend/app/api/v1/router.py` (empty APIRouter)  
  - Create: `backend/app/api/dependencies.py` (empty)  
  - Create: `backend/app/core/config.py` (empty)  
  - Create: `backend/app/core/security.py` (empty)  
  - Create: `backend/app/core/database.py` (empty)  
  - Effort: 5 min

---

- [ ] **T003**: Add root health check to backend  
  - Modify: `backend/app/main.py`  
  - Add: `GET /` returns `{"message": "API ready"}`  
  - Verify: `curl http://localhost:8001/`  
  - Effort: 5 min

---

- [ ] **T004**: Create frontend config files  
  - Create: `frontend/package.json`  
  - Create: `frontend/tsconfig.json`  
  - Create: `frontend/tailwind.config.ts`  
  - Create: `frontend/next.config.ts`  
  - Create: `frontend/postcss.config.js`  
  - Verify: `npm install` succeeds  
  - Effort: 10 min

---

- [ ] **T005**: Create frontend root page  
  - Modify: `frontend/app/page.tsx`  
  - Add: Simple page showing "Welcome – coming soon"  
  - Verify: `npm run dev` shows text  
  - Effort: 5 min

---

- [ ] **T006**: Add .gitignore  
  - Create: `.gitignore`  
  - Include: Python, Node, Next.js, env, IDE patterns  
  - Effort: 5 min

---

- [ ] **T007**: Add README.md  
  - Create: `README.md`  
  - Include: Structure, quick start commands  
  - Effort: 5 min

---

- [ ] **T008**: Final verification  
  - Run: `uvicorn backend.app.main:app --port 8001`  
  - Run: `npm run dev -- --port 3001` (in frontend/)  
  - Verify: `GET /` → `{"message": "API ready"}`  
  - Verify: Frontend shows "Welcome – coming soon"  
  - Effort: 10 min

---

## Execution Order

```
T001 (verify)
    ↓
T002 → T003 (backend)
T004 → T005 (frontend)
T006, T007 (docs)
T008 (verify all)
```

## Quick Reference

| # | Task | Time |
|---|------|------|
| T001 | Verify root | 1 min |
| T002 | Backend placeholders | 5 min |
| T003 | Root endpoint | 5 min |
| T004 | Frontend configs | 10 min |
| T005 | Frontend page | 5 min |
| T006 | .gitignore | 5 min |
| T007 | README | 5 min |
| T008 | Final verify | 10 min |

**Total**: ~45 min
