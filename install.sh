#!/usr/bin/env bash
set -e

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"

install_to() {
  local target_dir="$1"
  local tool_name="$2"
  echo "Installing Super-Skills for ${tool_name}..."
  echo "Target: ${target_dir}"
  mkdir -p "${target_dir}"
  
  local count=0
  for skill in "${SOURCE_DIR}"/*; do
    if [ -d "${skill}" ]; then
      local skill_name="$(basename "${skill}")"
      rm -rf "${target_dir}/${skill_name}"
      cp -r "${skill}" "${target_dir}/"
      count=$((count + 1))
    fi
  done
  echo "Successfully installed ${count} Super-Skills for ${tool_name}."
  echo ""
}

MODE="${1:---all}"

case "$MODE" in
  --agy|agy|antigravity)
    install_to "${HOME}/.gemini/config/skills" "Google Antigravity (agy)"
    ;;
  --claude|claude|claude-code)
    install_to "${HOME}/.claude/skills" "Claude Code"
    ;;
  --codex|codex)
    install_to "${HOME}/.codex/skills" "OpenAI Codex"
    ;;
  --all|all)
    echo "Installing Super-Skills across all supported AI assistants..."
    echo ""
    install_to "${HOME}/.gemini/config/skills" "Google Antigravity (agy)"
    install_to "${HOME}/.claude/skills" "Claude Code"
    install_to "${HOME}/.codex/skills" "OpenAI Codex"
    ;;
  *)
    echo "Usage: ./install.sh [OPTION]"
    echo ""
    echo "Options:"
    echo "  --agy       Install for Google Antigravity (agy) (~/.gemini/config/skills)"
    echo "  --claude    Install for Claude Code (~/.claude/skills)"
    echo "  --codex     Install for OpenAI Codex (~/.codex/skills)"
    echo "  --all       Install across all tools (default)"
    exit 1
    ;;
esac

echo "Installation complete. Your AI assistants are now equipped with the Super-Skills suite."
