#!/usr/bin/env bash
# PreToolUse(Bash): nếu lệnh do agent kiem-toan của plugin này chạy -> bắt người dùng xác nhận.
# Agent khác: im lặng (exit 0), lệnh đi theo luồng quyền bình thường.
input="$(cat)"
if printf '%s' "$input" | grep -Eq '"agent_type"[[:space:]]*:[[:space:]]*"ke-toan-kiem-toan:kiem-toan"'; then
  printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"Kiểm toán muốn chạy lệnh Bash này. Kiểm tra lệnh chỉ ĐỌC/TÍNH, không ghi/sửa/xoá file, rồi mới đồng ý."}}'
fi
exit 0
