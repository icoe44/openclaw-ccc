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
    echo -e "${YELLOW}【诊断工具】${NC}"
    echo -e "${YELLOW}10.${NC} 网络连通性检测         ${BLUE}check-connectivity${NC}"
    echo -e "${YELLOW}11.${NC} 系统健康检查           ${BLUE}doctor${NC}"
    echo ""
    echo -e "${YELLOW}【更多】${NC}"
    echo -e "${YELLOW}12.${NC} 定时任务               ${BLUE}cron${NC}"
    echo -e "${YELLOW}13.${NC} 插件管理               ${BLUE}plugins${NC}"
    echo -e "${YELLOW}14.${NC} 记忆管理               ${BLUE}memory${NC}"
    echo -e "${YELLOW}15.${NC} 打开 TUI 面板           ${BLUE}dashboard${NC}"
    echo -e "${YELLOW}16.${NC} 高级选项               ${BLUE}setup/onboard/run/scan${NC}"
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

# 网络连通性检测
check_connectivity() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   网络连通性检测${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    
    local all_passed=true
    local proxy_found=false
    local proxy=""
    
    # 自动检测代理端口（Clash/V2Ray/Surge/Shadowsocks 等）
    local proxy_ports=(7890 7891 7892 1080 1081 8080 8888 9090)
    for port in "${proxy_ports[@]}"; do
        if curl -s --connect-timeout 1 -x "http://127.0.0.1:$port" -o /dev/null -w '%{http_code}' "http://www.gstatic.com/generate_204" 2>/dev/null | grep -q "204\|301\|302"; then
            proxy="http://127.0.0.1:$port"
            proxy_found=true
            break
        fi
    done
    
    if ! $proxy_found; then
        echo -e "${RED}✗ 未检测到代理服务器${NC}"
        echo ""
        echo -e "${YELLOW}请检查：${NC}"
        echo "1. Clash/V2Ray/Surge 是否运行"
        echo "2. 代理端口设置（常见端口：7890, 7891, 1080, 8080）"
        echo "3. 系统代理是否开启"
        echo ""
        echo -e "${YELLOW}手动指定端口？输入端口号（回车跳过）：${NC}"
        read -r custom_port
        if [[ -n "$custom_port" && "$custom_port" =~ ^[0-9]+$ ]]; then
            proxy="http://127.0.0.1:$custom_port"
            proxy_found=true
        else
            echo ""
            echo -e "${YELLOW}按回车返回...${NC}"
            read
            return
        fi
    fi
    
    echo -e "${YELLOW}代理地址：${NC}$proxy"
    echo -e "${YELLOW}检测中...${NC}"
    echo ""
    
    # 检测函数
    check_ping() {
        local name="$1"
        local host="$2"
        if ping -c1 -W1 "$host" >/dev/null 2>&1; then
            printf "%-25s ${GREEN}✓ 通${NC}\n" "$name"
        else
            printf "%-25s ${RED}✗ 不通${NC}\n" "$name"
            all_passed=false
        fi
    }
    
    check_curl() {
        local name="$1"
        local url="$2"
        local proxy_opt="$3"
        local result
        local status_text
        
        if [[ -n "$proxy_opt" ]]; then
            result=$(curl -s --connect-timeout 3 -x "$proxy_opt" -o /dev/null -w '%{http_code}' "$url" 2>&1)
        else
            result=$(curl -s --connect-timeout 3 -o /dev/null -w '%{http_code}' "$url" 2>&1)
        fi
        
        # 状态码翻译（新手友好）
        case "$result" in
            200) status_text="${GREEN}✓ 正常${NC}" ;;
            204) status_text="${GREEN}✓ 正常${NC}" ;;
            301|302) status_text="${GREEN}✓ 重定向${NC}" ;;
            400) status_text="${YELLOW}! 请求错误${NC}" ;;
            401) status_text="${YELLOW}! 需要认证${NC}" ;;
            403) status_text="${YELLOW}! 禁止访问${NC}" ;;
            404) status_text="${YELLOW}! 页面不存在${NC}" ;;
            421) status_text="${YELLOW}! 配置错误${NC}" ;;
            500|502|503) status_text="${RED}✗ 服务器错误${NC}" ;;
            000) status_text="${RED}✗ 连接超时${NC}"; all_passed=false ;;
            *) status_text="${YELLOW}! 状态码 $result${NC}" ;;
        esac
        
        printf "%-25s %b\n" "$name" "$status_text"
    }
    
    # 执行检测
    check_ping "Google DNS" "8.8.8.8"
    check_ping "Cloudflare DNS" "1.1.1.1"
    check_curl "Google.com (直连)" "https://www.google.com" ""
    check_curl "Google.com (代理)" "https://www.google.com" "$proxy"
    check_curl "Telegram API" "https://api.telegram.org" "$proxy"
    check_curl "Discord API" "https://discord.com/api" "$proxy"
    check_curl "GitHub API" "https://api.github.com" "$proxy"
    check_curl "OpenAI API" "https://api.openai.com" "$proxy"
    
    echo ""
    echo -e "${CYAN}----------------------------------------${NC}"
    
    if $all_passed; then
        echo -e "${GREEN}✓ 所有检测通过！${NC}"
    else
        echo -e "${RED}✗ 部分检测失败${NC}"
        echo ""
        echo -e "${YELLOW}常见问题解决方案：${NC}"
        echo "1. 检查代理软件是否运行（Clash/V2Ray/Surge 等）"
        echo "2. 确认代理端口设置"
        echo "3. 切换非香港节点（OpenAI 不支持香港）"
        echo "4. 运行系统健康检查（选项 11）"
    fi
    
    echo ""
    echo -e "${YELLOW}按回车返回...${NC}"
    read
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
            10) check_connectivity ;;
            11) run_command "openclaw doctor" ;;
            12) cron_loop ;;
            13) plugins_loop ;;
            14) memory_loop ;;
            15) run_command "openclaw dashboard" ;;
            16) advanced_loop ;;
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
