#!/bin/bash

# DamianOS welcome message
# Only run for interactive shells.
if [[ $- != *i* ]]; then
    return
fi

echo ""
figlet -f slant "DamianOS" | lolcat
echo ""

echo "  ╔══════════════════════════════════════════════════════╗"
echo "  ║          Welcome to DamianOS                        ║"
echo "  ║                                                      ║"
echo "  ║  Inspired by Damian Whitehouse & his best mate Putin ║"
echo "  ║                                                      ║"
echo "  ║  Official colour: Papaya Whip  #FFEFD5              ║"
echo "  ║                                                      ║"
echo "  ║  \"The best teachers teach from the heart...\"        ║"
echo "  ╚══════════════════════════════════════════════════════╝"
echo ""

if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi

echo ""
