#!/usr/bin/env bash
# Выполняется один раз при создании рабочего места. Ошибки не роняют создание:
# если что-то не поставилось, Claude допоставит по команде «проверь рабочее место».
set +e
echo "=== Рабочее место: доустановка ==="

# Playwright для проверок сайтов (скрипты курса открывают страницы настоящим браузером)
python3 -m pip install --user --quiet playwright 2>&1 | tail -1
python3 -m playwright install --with-deps chromium 2>&1 | tail -2

# ~/.local/bin в PATH — туда ставятся пользовательские программы
grep -q 'HOME/.local/bin' ~/.bashrc || echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# Скиллы из репозитория видны Claude автоматически (.claude/skills), личных ставить не нужно
mkdir -p "$HOME/.claude"

echo "=== Готово. Напишите в терминале: claude ==="
