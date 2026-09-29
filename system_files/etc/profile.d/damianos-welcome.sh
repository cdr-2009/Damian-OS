#!/bin/bash

# DamianOS welcome message
if [ -n "$PS1" ]; then
    clear

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

    fastfetch
    echo ""
fi
