# 技術棧配置

## 🔧 當前配置

```yaml
FRONTEND: "{{FRONTEND_PRESET}}"     # react-router7 | sveltekit | nuxt | none
BACKEND: "{{BACKEND_PRESET}}"       # node-express | python-fastapi | python-flask | none  
DATABASE: "{{DATABASE_PRESET}}"     # supabase | pocketbase | none
```

---

## 🎯 前端框架

### react-router7 (React Router 7)
- **路由**: React Router 7 (使用 `react-router` package)
- **建構工具**: Vite
- **樣式**: Tailwind CSS
- **狀態**: React hooks + Context

### sveltekit (SvelteKit)
- **框架**: SvelteKit
- **路由**: SvelteKit 內建路由
- **樣式**: Tailwind CSS
- **狀態**: Svelte stores

### nuxt (Nuxt.js)
- **框架**: Nuxt 3
- **路由**: Nuxt 內建路由 
- **樣式**: Tailwind CSS
- **狀態**: Pinia

---

## 🔗 後端選項

### node-express (Node.js + Express)
- **運行時**: Node.js 18+
- **框架**: Express.js
- **認證**: 與 Supabase/PocketBase 整合

### python-fastapi (Python + FastAPI)
- **語言**: Python 3.9+
- **框架**: FastAPI
- **認證**: JWT + Supabase/PocketBase

### python-flask (Python + Flask)
- **語言**: Python 3.9+
- **框架**: Flask
- **認證**: 與雲端服務整合
---

## 🗃️ 雲端服務

### supabase
- **資料庫**: PostgreSQL (託管)
- **認證**: Supabase Auth (內建)
- **檔案**: Supabase Storage
- **即時**: Realtime subscriptions

### pocketbase  
- **資料庫**: SQLite/PostgreSQL
- **認證**: PocketBase 內建
- **檔案**: 內建檔案管理
- **API**: 自動產生 REST/Realtime API

---

## ⚠️ 重要約束

### 必須遵守的規則:
1. **React Router**: 永遠使用 `react-router` (v7)，**不要使用** `react-router-dom`
2. **Supabase**: 使用官方 JavaScript 客戶端
3. **PocketBase**: 使用官方 JavaScript SDK
4. **資料夾結構**: 遵循 project-structure.md 的規範

### 避免使用:
- 過時的路由套件
- 自建認證系統 (使用雲端服務)
- 複雜的狀態管理 (除非必要)

---

## 🔄 常見組合

**全端 React 應用**:
```yaml
FRONTEND: "react-router7"
BACKEND: "node-express" 
DATABASE: "supabase"
```

**SvelteKit 應用**:
```yaml
FRONTEND: "sveltekit"
BACKEND: "none"
DATABASE: "supabase"
```

**Nuxt 應用**:
```yaml
FRONTEND: "nuxt"
BACKEND: "none"
DATABASE: "pocketbase"
```
