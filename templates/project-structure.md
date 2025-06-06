# 專案結構指南

## 📁 資料夾結構

### React Router 7 專案
```
src/
├── components/     # 可重用組件
│   ├── ui/        # 基礎 UI 組件  
│   └── features/  # 功能性組件
├── pages/         # 頁面組件
├── hooks/         # 自定義 Hooks
├── services/      # API 服務 (Supabase/PocketBase)
├── utils/         # 工具函數
├── styles/        # 樣式檔案
└── main.jsx       # 應用入口
```

### SvelteKit 專案
```
src/
├── lib/
│   ├── components/  # 可重用組件
│   ├── services/    # API 服務
│   └── utils/       # 工具函數
├── routes/          # 路由頁面 (基於檔案的路由)
├── app.html         # HTML 模板
└── app.css          # 全域樣式
```

### Nuxt 專案
```
components/         # Vue 組件
pages/             # 路由頁面 (基於檔案的路由)  
layouts/           # 版面配置
plugins/           # 插件
middleware/        # 中間件
composables/       # 組合式函數
utils/             # 工具函數
```

## 📋 檔案命名

- **組件**: PascalCase (UserProfile.vue, LoginForm.svelte)
- **頁面**: kebab-case (user-profile.jsx, login.svelte)
- **工具函數**: camelCase (formatDate.js, apiClient.js)

## 🔧 特殊資料夾

- **/services**: API 調用和雲端服務整合
- **/utils**: 純函數工具
- **/components/ui**: 基礎 UI 組件庫
