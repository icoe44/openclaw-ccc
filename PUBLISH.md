# 📦 发布到 GitHub 指南

## 前置准备

1. **GitHub 账号** - 确保你有 GitHub 账号
2. **Git 配置** - 配置好 Git 用户名和邮箱

## 步骤

### 1. 在 GitHub 创建新仓库

访问 https://github.com/new

- **Repository name**: `openclaw-ccc`
- **Description**: `Interactive command panel for OpenClaw - 让 OpenClaw 管理更简单`
- **Visibility**: Public（公开，贡献给社区）
- **不要** 勾选 "Initialize this repository with a README"（我们已经有本地代码了）

点击 **Create repository**

### 2. 关联远程仓库并推送

在终端执行：

```bash
cd /Users/clawd/.openclaw/workspace/openclaw-ccc

# 添加远程仓库（替换 YOUR_USERNAME 为你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/openclaw-ccc.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 3. 验证发布

访问 `https://github.com/YOUR_USERNAME/openclaw-ccc` 确认代码已上传成功。

### 4. 优化 README（可选）

编辑 README.md，把 `YOUR_USERNAME` 替换成你的实际 GitHub 用户名。

### 5. 添加 Topic 标签

在 GitHub 仓库页面：
- 点击右侧 **About** 区域的齿轮图标
- 添加 Topics：
  - `openclaw`
  - `cli`
  - `shell-script`
  - `devops`
  - `ai-assistant`

### 6. 分享给社区

发布后可以在以下地方分享：

- **OpenClaw Discord**: https://discord.com/invite/clawd
- **OpenClaw GitHub Discussions**: https://github.com/openclaw/openclaw/discussions
- **社交媒体**: Twitter/X, 微博等

---

## 📝 分享文案模板

```
🎉 给 @OpenClaw 社区贡献一个小工具！

openclaw-ccc - 交互式命令行面板
✨ 一个命令访问所有常用功能
🎨 彩色菜单 + 子导航
🔧 网关/模型/定时任务/插件/记忆管理

GitHub: https://github.com/YOUR_USERNAME/openclaw-ccc

安装：git clone + ln -sf 到 /usr/local/bin/ccc
使用：ccc

欢迎 Star & 贡献！🙏
```

---

## ✅ 检查清单

- [ ] 仓库已创建
- [ ] 代码已推送
- [ ] README 已更新用户名
- [ ] Topic 标签已添加
- [ ] 已分享到社区

---

**恭喜！你的贡献已上线！** 🎊
