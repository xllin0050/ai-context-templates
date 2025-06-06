# 快速使用指南

## 🚀 第一次使用

### 1. 下載到新專案
```bash
# 方法一：直接下載
curl -L https://github.com/YOUR_USERNAME/ai-context-templates/archive/main.zip | \
  unzip - && mv ai-context-templates-main/.ai-context ./

# 方法二：Git Subtree (推薦)
git subtree add --prefix=.ai-context \
  https://github.com/YOUR_USERNAME/ai-context-templates.git main --squash
```

### 2. 執行配置
```bash
cd .ai-context
./scripts/init-project.sh
```

### 3. 在 AI 工具中使用
```
@onboarding-rule.md
```

## 📋 典型工作流

### SvelteKit + Supabase 專案
```bash
mkdir my-sveltekit-app && cd my-sveltekit-app
git subtree add --prefix=.ai-context GITHUB_URL main --squash
cd .ai-context && ./scripts/init-project.sh
# 選擇: SvelteKit + Supabase
```

### React Router 7 + Node.js 專案  
```bash
mkdir my-react-app && cd my-react-app
git subtree add --prefix=.ai-context GITHUB_URL main --squash
cd .ai-context && ./scripts/init-project.sh
# 選擇: React Router 7 + Node.js + Supabase
```

## 🔄 更新模板
```bash
# 當 GitHub 上有新版本時
git subtree pull --prefix=.ai-context GITHUB_URL main --squash
```

## 💡 使用技巧

1. **首次建議選擇預設組合**，熟悉後再自定義
2. **優先使用雲端服務** (Supabase/PocketBase) 而非自建後端
3. **團隊協作時將 `.ai-context/active-context/` 加入版本控制**
4. **需要切換 AI 行為時使用協作模式**

## 🎯 效果對比

**使用前**:
```
你: 幫我建立登入功能
AI: 我建議使用 react-router-dom...
你: 不對，我們用 react-router v7...
[來回 5-10 次對話]
```

**使用後**:
```
你: @onboarding-rule.md
AI: ✅ 上下文載入完成！
你: 幫我建立登入功能  
AI: 根據你的 SvelteKit + Supabase 配置，我會建立...
[一次到位]
```
