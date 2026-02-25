# OpenClaw Command Center (ccc)

> 🦞 **OpenClaw 快捷面板 - 让管理像聊天一样简单**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)](https://www.gnu.org/software/bash/)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Plugin-orange.svg)](https://openclaw.ai)

---

## 🚀 快速开始

### 一键安装

```bash
# 克隆项目
git clone https://github.com/icoe44/openclaw-ccc.git
cd openclaw-ccc

# 安装到系统路径
chmod +x ccc.sh
sudo ln -sf $(pwd)/ccc.sh /usr/local/bin/ccc
```

### 开始使用

```bash
ccc
```

**就这么简单！** 接下来全是菜单导航，无需记忆任何命令。

---

## 📋 功能一览

### 主菜单（16 个功能）

| 分类 | 功能 | 说明 |
|------|------|------|
| **服务管理** | 启动/停止/重启/状态/日志 | 管理 OpenClaw 网关服务 |
| **配置管理** | 编辑配置/修改配置 | vim 编辑或交互式配置 |
| **模型管理** | 模型列表/模型状态 | 查看 AI 模型配置 |
| **诊断工具** | **网络连通性检测** | 一键检测代理和 API 连通性 ⭐ |
| **诊断工具** | **系统健康检查** | OpenClaw 官方健康检查 ⭐ |
| **更多** | 定时任务/插件/记忆管理 | 子菜单管理 |
| **更多** | **TUI 图形面板** | 打开终端控制面板 ⭐ |

---

## 🌐 网络连通性检测（亮点功能）

**选项 10** - 一键诊断网络问题，新手友好！

### 自动检测代理

支持自动检测以下代理端口：
- `7890`, `7891`, `7892` - Clash 默认端口
- `1080`, `1081` - V2Ray/Shadowsocks
- `8080`, `8888`, `9090` - 其他常见代理

**支持的代理软件：** Clash、V2Ray、Surge、Shadowsocks 等

### 检测项目

| 检测项 | 说明 |
|--------|------|
| Google DNS (8.8.8.8) | 基础网络连通性 |
| Cloudflare DNS (1.1.1.1) | 备用 DNS |
| Google.com (直连) | 检测是否被墙 |
| Google.com (代理) | 检测代理是否工作 |
| Telegram API | Telegram 机器人/频道 |
| Discord API | Discord 机器人 |
| GitHub API | 代码仓库/更新 |
| OpenAI API | ChatGPT/Codex |

### 新手友好的状态提示

| 显示 | 含义 | 解决方案 |
|------|------|----------|
| ✓ 正常 | 服务可用 | - |
| ✓ 重定向 | 正常跳转 | - |
| ! 需要认证 | 需要登录 | 检查账号配置 |
| ! 禁止访问 | 被服务器拒绝 | 检查 IP/权限 |
| ! 配置错误 | 代理配置问题 | 切换节点 |
| ✗ 连接超时 | 无法连接 | 检查代理软件 |

### 检测失败自动提示

```
✗ 部分检测失败

常见问题解决方案：
1. 检查代理软件是否运行（Clash/V2Ray/Surge 等）
2. 确认代理端口设置
3. 切换非香港节点（OpenAI 不支持香港）
4. 运行系统健康检查（选项 11）
```

---

## 📸 界面预览

### 主菜单

```
========================================
   OpenClaw 快捷面板
========================================

【服务管理】
1. 启动服务                gateway start
2. 停止服务                gateway stop
3. 重启服务                gateway restart
4. 查看状态                gateway status
5. 查看日志                logs

【配置管理】
6. 编辑主配置              vim openclaw.json
7. 修改配置                configure

【模型管理】
8. 模型列表                models list
9. 模型状态                models status

【诊断工具】
10. 网络连通性检测         check-connectivity
11. 系统健康检查           doctor

【更多】
12. 定时任务               cron
13. 插件管理               plugins
14. 记忆管理               memory
15. 打开 TUI 面板          openclaw tui
16. 高级选项               setup/onboard/run/scan

----------------------------------------
0. 退出

请输入序号：
```

### 网络检测示例

```
========================================
   网络连通性检测
========================================

代理地址：http://127.0.0.1:7890
检测中...

Google DNS                ✗ 不通
Cloudflare DNS            ✗ 不通
Google.com (直连)         ✗ 超时
Google.com (代理)         ✓ 正常
Telegram API              ✓ 重定向
Discord API               ! 禁止访问
GitHub API                ✓ 正常
OpenAI API                ! 配置错误

----------------------------------------
✗ 部分检测失败

常见问题解决方案：
1. 检查代理软件是否运行
2. 确认代理端口设置
3. 切换非香港节点
4. 运行系统健康检查
```

---

## 🎯 适合谁用？

| 用户类型 | 推荐理由 |
|----------|----------|
| **新手小白** | 菜单导航，无需记命令，网络检测一键诊断 |
| **开发者** | 快速切换配置，查看日志，管理模型 |
| **运维人员** | 服务状态一目了然，健康检查自动化 |
| **多代理用户** | 自动检测代理端口，支持多种代理软件 |

---

## 🔧 常见问题

### Q: 安装后输入 `ccc` 没反应？

```bash
# 检查软链接
ls -l /usr/local/bin/ccc

# 如果没有，重新安装
sudo ln -sf $(pwd)/ccc.sh /usr/local/bin/ccc
```

### Q: 网络检测显示"未检测到代理"？

1. 检查代理软件是否运行
2. 确认代理端口（常见：7890, 7891, 1080）
3. 手动输入端口号（检测失败时会提示）

### Q: OpenAI API 显示"配置错误"？

- OpenAI 不支持香港节点
- 切换到日本/新加坡/美国节点
- 检查代理软件的 SNI 设置

### Q: 如何卸载？

```bash
sudo rm /usr/local/bin/ccc
```

### Q: 支持 Windows 吗？

需要 WSL 或 Git Bash 环境。

---

## 📁 项目结构

```
openclaw-ccc/
├── ccc.sh              # 主脚本
├── README.md           # 本文档
├── LICENSE             # MIT 许可证
└── .gitignore          # Git 配置
```

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

### 可以贡献什么？

- 🐛 修复 Bug
- ✨ 新增功能
- 📖 完善文档
- 🎨 优化界面
- 🌍 多语言支持

### 贡献流程

1. Fork 本项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

---

## 📄 许可证

MIT License - 自由使用、修改、分发。

查看 [LICENSE](LICENSE) 文件了解详情。

---

## 📬 联系方式

- **项目地址**: https://github.com/icoe44/openclaw-ccc
- **问题反馈**: https://github.com/icoe44/openclaw-ccc/issues
- **OpenClaw Discord**: https://discord.com/invite/clawd

---

<div align="center">

**如果这个项目帮到了你，请给个 ⭐️ Star 支持一下！**

Made with ❤️ by G | Powered by OpenClaw

</div>
