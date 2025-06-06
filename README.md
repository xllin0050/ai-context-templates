# AI Context Templates

> 🤖 輕量化的 AI 編程助手上下文管理系統

## 🚀 快速使用

### 方法一：下載使用 (簡單)
```bash
# 下載到新專案
curl -L https://github.com/YOUR_USERNAME/ai-context-templates/archive/main.zip | \
  unzip - && mv ai-context-templates-main/.ai-context ./
```

### 方法二：Git Subtree (推薦)
```bash
# 在新專案中添加
git subtree add --prefix=.ai-context \
  https://github.com/YOUR_USERNAME/ai-context-templates.git main --squash
```

## 📋 使用步驟

1. **初始化專案配置**
   ```bash
   cd .ai-context
   ./scripts/init-project.sh
   ```

2. **在 AI 工具中載入上下文**
   ```
   @onboarding-rule.md
   ```

3. **開始開發！**

## 🔧 支援的技術棧

### 前端框架
- **React Router 7**: 現代 React 路由
- **SvelteKit**: 全端 Svelte 框架  
- **Nuxt**: Vue.js 生態系

### 後端選項
- **Node.js + Express**: JavaScript 後端
- **Python FastAPI/Flask**: Python 後端
- **Frontend Only**: 純前端專案

### 雲端服務
- **Supabase**: 資料庫 + 認證
- **PocketBase**: 輕量化後端

## 📁 檔案結構

```
.ai-context/
├── templates/              # 模板檔案
├── scripts/
│   └── init-project.sh    # 初始化腳本
└── active-context/        # 專案配置 (初始化後產生)
    ├── project-overview.md
    ├── tech-stack.md
    ├── ai-role.md
    └── onboarding-rule.md  # 主要載入檔案
```

## 💡 使用示例

建立新的 SvelteKit 專案：
```bash
mkdir my-sveltekit-app && cd my-sveltekit-app
git subtree add --prefix=.ai-context YOUR_REPO_URL main --squash
cd .ai-context && ./scripts/init-project.sh
# 選擇: SvelteKit + Supabase
```

在 AI 工具中：
```
@onboarding-rule.md
"請幫我建立一個使用 Supabase 認證的登入頁面"
```

AI 會理解你的專案使用 SvelteKit 和 Supabase，產生符合架構的代碼！

---

**MIT License** | 基於 [Reid Kimball 的 AI Onboarding 概念](https://reidkimball.com/journal/stop-your-ai-coding-agents-from-making-a-mess/)
