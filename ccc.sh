#!/bin/bash

# OpenClaw 快捷命令面板 - ccc
# 用法：ccc 或 bash ccc.sh

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

clear

# 显示主菜单
show_main_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   OpenClaw 快捷面板${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}【服务管理】${NC}"
    echo -e "${YELLOW}1.${NC} 启动服务                ${BLUE}gateway start${NC}"
    echo -e "${YELLOW}2.${NC} 停止服务                ${BLUE}gateway stop${NC}"
    echo -e "${YELLOW}3.${NC} 重启服务                ${BLUE}gateway restart${NC}"
    echo -e "${YELLOW}4.${NC} 查看状态                ${BLUE}gateway status${NC}"
    echo -e "${YELLOW}5.${NC} 查看日志                ${BLUE}logs${NC}"
    echo ""
    echo -e "${YELLOW}【配置管理】${NC}"
    echo -e "${YELLOW}6.${NC} 编辑主配置              ${BLUE}vim openclaw.json${NC}"
    echo -e "${YELLOW}7.${NC} 修改配置                ${BLUE}configure${NC}"
    echo ""
    echo -e "${YELLOW}【模型管理】${NC}"
    echo -e "${YELLOW}8.${NC} 模型列表                ${BLUE}models list${NC}"
    echo -e "${YELLOW}9.${NC} 模型状态                ${BLUE}models status${NC}"
    echo ""
    echo -e "${YELLOW}【更多】${NC}"
    echo -e "${YELLOW}10.${NC} 定时任务               ${BLUE}cron${NC}"
    echo -e "${YELLOW}11.${NC} 插件管理               ${BLUE}plugins${NC}"
    echo -e "${YELLOW}12.${NC} 记忆管理               ${BLUE}memory${NC}"
    echo -e "${YELLOW}13.${NC} 高级选项               ${BLUE}setup/onboard/run/scan${NC}"
    echo ""
    echo -e "${CYAN}----------------------------------------${NC}"
    echo -e "${YELLOW}0.${NC} 退出"
    echo ""
    echo -e "${GREEN}请输入序号：${NC}"
}

# 高级选项菜单
show_advanced_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   高级选项${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} 初始化 OpenClaw          ${BLUE}setup${NC}"
    echo -e "${YELLOW}2.${NC} 引导配置                 ${BLUE}onboard${NC}"
    echo -e "${YELLOW}3.${NC} 前台运行（调试）          ${BLUE}gateway run${NC}"
    echo -e "${YELLOW}4.${NC} 扫描模型                 ${BLUE}models scan${NC}"
    echo -e "${YELLOW}5.${NC} 添加模型认证            ${BLUE}models auth${NC}"
    echo -e "${YELLOW}6.${NC} 设置默认模型            ${BLUE}models set${NC}"
    echo ""
    echo -e "${YELLOW}0.${NC} 返回主菜单"
    echo ""
    echo -e "${GREEN}请输入序号：${NC}"
}

# 定时任务菜单
show_cron_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   定时任务管理${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} 列出任务                 ${BLUE}cron list${NC}"
    echo -e "${YELLOW}2.${NC} 添加任务                 ${BLUE}cron add${NC}"
    echo -e "${YELLOW}3.${NC} 删除任务                 ${BLUE}cron rm <id>${NC}"
    echo -e "${YELLOW}4.${NC} 手动运行                 ${BLUE}cron run <id>${NC}"
    echo ""
    echo -e "${YELLOW}0.${NC} 返回主菜单"
    echo ""
    echo -e "${GREEN}请输入序号：${NC}"
}

# 插件菜单
show_plugins_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   插件管理${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} 列出插件                 ${BLUE}plugins list${NC}"
    echo -e "${YELLOW}2.${NC} 启用插件                 ${BLUE}plugins enable <id>${NC}"
    echo -e "${YELLOW}3.${NC} 禁用插件                 ${BLUE}plugins disable <id>${NC}"
    echo ""
    echo -e "${YELLOW}0.${NC} 返回主菜单"
    echo ""
    echo -e "${GREEN}请输入序号：${NC}"
}

# 记忆菜单
show_memory_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   记忆管理${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} 查看状态                 ${BLUE}memory status${NC}"
    echo -e "${YELLOW}2.${NC} 重建索引                 ${BLUE}memory index${NC}"
    echo -e "${YELLOW}3.${NC} 搜索记忆                 ${BLUE}memory search${NC}"
    echo ""
    echo -e "${YELLOW}0.${NC} 返回主菜单"
    echo ""
    echo -e "${GREEN}请输入序号：${NC}"
}

# 执行命令
run_command() {
    echo ""
    echo -e "${CYAN}>>> $1${NC}"
    echo -e "${CYAN}----------------------------------------${NC}"
    eval "$1"
    echo ""
    echo -e "${YELLOW}按回车返回...${NC}"
    read
}

# 查找配置文件
find_openclaw_config() {
    local paths=(
        "$HOME/.openclaw/openclaw.json"
        "$HOME/.openclaw/workspace/openclaw.json"
        "$HOME/clawd/openclaw.json"
    )
    for path in "${paths[@]}"; do
        [[ -f "$path" ]] && echo "$path" && return 0
    done
    local found=$(find "$HOME" -maxdepth 3 -name "openclaw.json" 2>/dev/null | head -1)
    [[ -n "$found" ]] && echo "$found" && return 0
    return 1
}

# 编辑配置
edit_config() {
    local config_path=$(find_openclaw_config)
    if [[ -n "$config_path" && -f "$config_path" ]]; then
        echo -e "${GREEN}找到：${NC}$config_path"
        echo -e "${CYAN}回车确认，或输入新路径：${NC}"
        read -r user_path
        [[ -n "$user_path" && -f "$user_path" ]] && config_path="$user_path"
        [[ -n "$user_path" && ! -f "$user_path" ]] && echo -e "${RED}文件不存在${NC}" && sleep 1 && return
        run_command "vim \"$config_path\""
    else
        echo -e "${RED}未找到，请输入路径：${NC}"
        read -r custom_path
        [[ -f "$custom_path" ]] && run_command "vim \"$custom_path\"" || echo -e "${RED}文件不存在${NC}" && sleep 1
    fi
}

# 主循环
main_loop() {
    while true; do
        show_main_menu
        read -r choice
        case $choice in
            1) run_command "openclaw gateway start" ;;
            2) run_command "openclaw gateway stop" ;;
            3) run_command "openclaw gateway restart" ;;
            4) run_command "openclaw gateway status" ;;
            5) run_command "openclaw logs" ;;
            6) edit_config ;;
            7) run_command "openclaw configure" ;;
            8) run_command "openclaw models list" ;;
            9) run_command "openclaw models status" ;;
            10) cron_loop ;;
            11) plugins_loop ;;
            12) memory_loop ;;
            13) advanced_loop ;;
            0) echo -e "${GREEN}再见！${NC}" && exit 0 ;;
            *) echo -e "${RED}无效输入${NC}" && sleep 1 ;;
        esac
    done
}

# 子菜单循环
cron_loop() { while true; do show_cron_menu; read -r c; case $c in 1) run_command "openclaw cron list";; 2) run_command "openclaw cron add";; 3) echo -n "ID: "; read id; run_command "openclaw cron rm $id";; 4) echo -n "ID: "; read id; run_command "openclaw cron run $id";; 0) return;; esac; done; }

plugins_loop() { while true; do show_plugins_menu; read -r c; case $c in 1) run_command "openclaw plugins list";; 2) echo -n "ID: "; read id; run_command "openclaw plugins enable $id";; 3) echo -n "ID: "; read id; run_command "openclaw plugins disable $id";; 0) return;; esac; done; }

memory_loop() { while true; do show_memory_menu; read -r c; case $c in 1) run_command "openclaw memory status";; 2) run_command "openclaw memory index";; 3) echo -n "关键词："; read q; run_command "openclaw memory search \"$q\"";; 0) return;; esac; done; }

advanced_loop() { while true; do show_advanced_menu; read -r c; case $c in 1) run_command "openclaw setup";; 2) run_command "openclaw onboard";; 3) run_command "openclaw gateway run";; 4) run_command "openclaw models scan";; 5) echo -n "add/paste-token: "; read s; run_command "openclaw models auth $s";; 6) echo -n "模型名："; read m; run_command "openclaw models set $m";; 0) return;; esac; done; }

main_loop
