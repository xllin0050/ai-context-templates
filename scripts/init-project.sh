#!/bin/bash

# AI Context 初始化腳本 - 簡化版

set -e

# 顏色定義
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_message() {
    echo -e "${GREEN}[AI-Context]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# 建立 active-context 目錄
print_message "建立專案配置..."
mkdir -p active-context

# 獲取專案資訊
print_message "請輸入專案資訊："
read -p "專案名稱: " PROJECT_NAME
read -p "專案描述: " PROJECT_DESCRIPTION

# 選擇技術棧
echo
print_info "選擇前端框架："
echo "1) React Router 7"
echo "2) SvelteKit" 
echo "3) Nuxt"
echo "4) 純前端 (無框架)"

read -p "選擇 (1-4): " FRONTEND_CHOICE

case $FRONTEND_CHOICE in
    1) FRONTEND_PRESET="react-router7" ;;
    2) FRONTEND_PRESET="sveltekit" ;;
    3) FRONTEND_PRESET="nuxt" ;;
    4) FRONTEND_PRESET="none" ;;
    *) FRONTEND_PRESET="react-router7" ;;
esac

echo
print_info "選擇後端 (可選)："
echo "1) 無後端 (純前端 + 雲端服務)"
echo "2) Node.js + Express"
echo "3) Python FastAPI"
echo "4) Python Flask"

read -p "選擇 (1-4): " BACKEND_CHOICE

case $BACKEND_CHOICE in
    1) BACKEND_PRESET="none" ;;
    2) BACKEND_PRESET="node-express" ;;
    3) BACKEND_PRESET="python-fastapi" ;;
    4) BACKEND_PRESET="python-flask" ;;
    *) BACKEND_PRESET="none" ;;
esac

echo
print_info "選擇雲端服務："
echo "1) Supabase (推薦)"
echo "2) PocketBase"
echo "3) 無雲端服務"

read -p "選擇 (1-3): " DATABASE_CHOICE

case $DATABASE_CHOICE in
    1) DATABASE_PRESET="supabase" ;;
    2) DATABASE_PRESET="pocketbase" ;;
    3) DATABASE_PRESET="none" ;;
    *) DATABASE_PRESET="supabase" ;;
esac

# 複製並自定義模板
print_message "產生配置檔案..."

# 複製模板
cp templates/*.md active-context/

# 替換佔位符 (跨平台兼容)
for file in active-context/*.md; do
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i "" "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$file"
        sed -i "" "s/{{PROJECT_DESCRIPTION}}/$PROJECT_DESCRIPTION/g" "$file"
    else
        sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$file"
        sed -i "s/{{PROJECT_DESCRIPTION}}/$PROJECT_DESCRIPTION/g" "$file"
    fi
done

# 特別處理 tech-stack.md
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i "" "s/{{FRONTEND_PRESET}}/$FRONTEND_PRESET/g" active-context/tech-stack.md
    sed -i "" "s/{{BACKEND_PRESET}}/$BACKEND_PRESET/g" active-context/tech-stack.md
    sed -i "" "s/{{DATABASE_PRESET}}/$DATABASE_PRESET/g" active-context/tech-stack.md
else
    sed -i "s/{{FRONTEND_PRESET}}/$FRONTEND_PRESET/g" active-context/tech-stack.md
    sed -i "s/{{BACKEND_PRESET}}/$BACKEND_PRESET/g" active-context/tech-stack.md
    sed -i "s/{{DATABASE_PRESET}}/$DATABASE_PRESET/g" active-context/tech-stack.md
fi

# 建立主要的載入規則
cat > active-context/onboarding-rule.md << EOF
# AI 上下文載入

請依序讀取以下檔案了解專案：

## 📋 專案概覽
參考: active-context/project-overview.md

## 🔧 技術棧
參考: active-context/tech-stack.md

## 🏗️ 專案結構  
參考: active-context/project-structure.md

## 🤖 你的角色
參考: active-context/ai-role.md

## 🤝 協作模式
參考: active-context/collaboration-modes.md

---

**讀取完成後回應**: ✅ 上下文載入完成！我了解這是一個使用 $FRONTEND_PRESET 的專案，準備開始協作！

EOF

print_message "✅ 配置完成！"
echo
print_info "下一步："
echo "1. 在 AI 工具 (Windsurf/Cursor) 中使用: @onboarding-rule.md"
echo "2. 等待 AI 載入完成後開始開發"
echo
print_info "配置檔案位置: active-context/"
print_info "主要載入檔案: active-context/onboarding-rule.md"
