# AI Context 初始化腳本 - PowerShell 版本

Write-Host "AI Context 初始化工具" -ForegroundColor Green

# 建立 active-context 目錄
Write-Host "建立專案配置..." -ForegroundColor Green
New-Item -ItemType Directory -Force -Path "active-context" | Out-Null

# 獲取專案資訊
Write-Host "請輸入專案資訊：" -ForegroundColor Green
$PROJECT_NAME = Read-Host "專案名稱"
$PROJECT_DESCRIPTION = Read-Host "專案描述"

# 選擇前端框架
Write-Host "`n選擇前端框架：" -ForegroundColor Blue
Write-Host "1) React Router 7"
Write-Host "2) SvelteKit"
Write-Host "3) Nuxt"
Write-Host "4) 純前端 (無框架)"

$FRONTEND_CHOICE = Read-Host "選擇 (1-4)"

switch ($FRONTEND_CHOICE) {
    "1" { $FRONTEND_PRESET = "react-router7" }
    "2" { $FRONTEND_PRESET = "sveltekit" }
    "3" { $FRONTEND_PRESET = "nuxt" }
    "4" { $FRONTEND_PRESET = "none" }
    default { $FRONTEND_PRESET = "react-router7" }
}

# 選擇後端
Write-Host "`n選擇後端 (可選)：" -ForegroundColor Blue
Write-Host "1) 無後端 (純前端 + 雲端服務)"
Write-Host "2) Node.js + Express"
Write-Host "3) Python FastAPI"
Write-Host "4) Python Flask"

$BACKEND_CHOICE = Read-Host "選擇 (1-4)"

switch ($BACKEND_CHOICE) {
    "1" { $BACKEND_PRESET = "none" }
    "2" { $BACKEND_PRESET = "node-express" }
    "3" { $BACKEND_PRESET = "python-fastapi" }
    "4" { $BACKEND_PRESET = "python-flask" }
    default { $BACKEND_PRESET = "none" }
}

# 選擇雲端服務
Write-Host "`n選擇雲端服務：" -ForegroundColor Blue
Write-Host "1) Supabase (推薦)"
Write-Host "2) PocketBase"
Write-Host "3) 無雲端服務"

$DATABASE_CHOICE = Read-Host "選擇 (1-3)"

switch ($DATABASE_CHOICE) {
    "1" { $DATABASE_PRESET = "supabase" }
    "2" { $DATABASE_PRESET = "pocketbase" }
    "3" { $DATABASE_PRESET = "none" }
    default { $DATABASE_PRESET = "supabase" }
}

# 複製模板檔案
Write-Host "`n產生配置檔案..." -ForegroundColor Green
Copy-Item "templates\*.md" "active-context\"

# 替換佔位符
$files = Get-ChildItem "active-context\*.md"
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $content = $content -replace '\{\{PROJECT_NAME\}\}', $PROJECT_NAME
    $content = $content -replace '\{\{PROJECT_DESCRIPTION\}\}', $PROJECT_DESCRIPTION
    Set-Content $file.FullName $content -Encoding UTF8
}

# 特別處理 tech-stack.md
$techStackFile = "active-context\tech-stack.md"
if (Test-Path $techStackFile) {
    $content = Get-Content $techStackFile -Raw -Encoding UTF8
    $content = $content -replace '\{\{FRONTEND_PRESET\}\}', $FRONTEND_PRESET
    $content = $content -replace '\{\{BACKEND_PRESET\}\}', $BACKEND_PRESET
    $content = $content -replace '\{\{DATABASE_PRESET\}\}', $DATABASE_PRESET
    Set-Content $techStackFile $content -Encoding UTF8
}

# 建立 onboarding-rule.md
$onboardingContent = @"
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
"@

Set-Content "active-context\onboarding-rule.md" $onboardingContent -Encoding UTF8

Write-Host "`n✅ 配置完成！" -ForegroundColor Green
Write-Host "`n下一步：" -ForegroundColor Blue
Write-Host "1. 在 AI 工具 (Windsurf/Cursor) 中使用: @onboarding-rule.md"
Write-Host "2. 等待 AI 載入完成後開始開發"
Write-Host "`n配置檔案位置: active-context\"
Write-Host "主要載入檔案: active-context\onboarding-rule.md"
