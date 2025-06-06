# SvelteKit + Supabase 範例

這是一個使用 AI Context Templates 配置的範例專案。

## 配置
- **前端**: SvelteKit
- **後端**: 無 (純前端)
- **資料庫**: Supabase
- **認證**: Supabase Auth

## AI 上下文載入
```
@onboarding-rule.md
```

## 範例對話

**你**: 幫我建立一個用戶註冊頁面

**AI**: 根據你的 SvelteKit + Supabase 配置，我會建立一個註冊頁面：

```svelte
<!-- src/routes/register/+page.svelte -->
<script>
  import { supabase } from '$lib/supabaseClient';
  import { goto } from '$app/navigation';
  
  let email = '';
  let password = '';
  let loading = false;
  
  async function handleRegister() {
    loading = true;
    const { error } = await supabase.auth.signUp({
      email,
      password
    });
    
    if (error) {
      alert(error.message);
    } else {
      goto('/login');
    }
    loading = false;
  }
</script>

<div class="max-w-md mx-auto">
  <h1 class="text-2xl font-bold mb-6">註冊</h1>
  <form on:submit|preventDefault={handleRegister}>
    <input 
      type="email" 
      bind:value={email}
      placeholder="Email"
      class="w-full p-2 border rounded mb-4"
      required 
    />
    <input 
      type="password" 
      bind:value={password}
      placeholder="密碼"
      class="w-full p-2 border rounded mb-4"
      required 
    />
    <button 
      type="submit"
      disabled={loading}
      class="w-full bg-blue-500 text-white p-2 rounded hover:bg-blue-600 disabled:opacity-50"
    >
      {loading ? '註冊中...' : '註冊'}
    </button>
  </form>
</div>
```

AI 自動理解這是 SvelteKit 專案，使用了正確的：
- SvelteKit 語法和路由
- Supabase 客戶端
- Tailwind CSS 樣式
- 專案資料夾結構
