#!/usr/bin/env bash
set -e

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"

USE_SYMLINK=false
DO_UNINSTALL=false
TARGET_TOOLS=()

for arg in "$@"; do
  case "$arg" in
    --symlink|-s)
      USE_SYMLINK=true
      ;;
    --uninstall|-u)
      DO_UNINSTALL=true
      ;;
    --agy|agy|antigravity)
      TARGET_TOOLS+=("agy")
      ;;
    --claude|claude|claude-code)
      TARGET_TOOLS+=("claude")
      ;;
    --codex|codex)
      TARGET_TOOLS+=("codex")
      ;;
    --all|all)
      TARGET_TOOLS=("agy" "claude" "codex")
      ;;
    --help|-h)
      echo "Usage: ./install.sh [OPTIONS]"
      echo ""
      echo "Targets:"
      echo "  --agy        Target Google Antigravity (~/.gemini/config/skills)"
      echo "  --claude     Target Claude Code (~/.claude/skills)"
      echo "  --codex      Target OpenAI Codex (~/.codex/skills)"
      echo "  --all        Target all assistants (default)"
      echo ""
      echo "Options:"
      echo "  --symlink, -s    Create symbolic links instead of copying"
      echo "  --uninstall, -u  Remove installed super-skills from targets"
      echo "  --help, -h       Show this help message"
      exit 0
      ;;
    *)
      echo "Unknown option: $arg"
      echo "Run ./install.sh --help for usage."
      exit 1
      ;;
  esac
done

if [ ${#TARGET_TOOLS[@]} -eq 0 ]; then
  TARGET_TOOLS=("agy" "claude" "codex")
fi

manage_target() {
  local target_dir="$1"
  local tool_name="$2"

  if [ "$DO_UNINSTALL" = true ]; then
    echo "Uninstalling Super-Skills from ${tool_name}..."
    local count=0
    for skill in "${SOURCE_DIR}"/*; do
      if [ -d "${skill}" ]; then
        local skill_name="$(basename "${skill}")"
        if [ -e "${target_dir}/${skill_name}" ] || [ -L "${target_dir}/${skill_name}" ]; then
          rm -rf "${target_dir}/${skill_name}"
          count=$((count + 1))
        fi
      fi
    done
    echo "Removed ${count} Super-Skills from ${target_dir}."
    echo ""
    return
  fi

  if [ "$USE_SYMLINK" = true ]; then
    echo "Linking Super-Skills (symlink) to ${tool_name}..."
  else
    echo "Installing Super-Skills to ${tool_name}..."
  fi
  echo "Target: ${target_dir}"
  mkdir -p "${target_dir}"

  local count=0
  for skill in "${SOURCE_DIR}"/*; do
    if [ -d "${skill}" ]; then
      local skill_name="$(basename "${skill}")"
      rm -rf "${target_dir}/${skill_name}"
      if [ "$USE_SYMLINK" = true ]; then
        ln -sf "${skill}" "${target_dir}/${skill_name}"
      else
        cp -r "${skill}" "${target_dir}/"
      fi
      count=$((count + 1))
    fi
  done
  echo "Successfully configured ${count} Super-Skills for ${tool_name}."
  echo ""
}

for tool in "${TARGET_TOOLS[@]}"; do
  case "$tool" in
    agy)
      manage_target "${HOME}/.gemini/config/skills" "Google Antigravity (agy)"
      ;;
    claude)
      manage_target "${HOME}/.claude/skills" "Claude Code"
      ;;
    codex)
      manage_target "${HOME}/.codex/skills" "OpenAI Codex"
      ;;
  esac
done

if [ "$DO_UNINSTALL" = true ]; then
  echo "Uninstallation complete."
else
  echo "Configuration complete. Your AI assistants are now equipped with the Super-Skills suite."
fi
