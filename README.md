# Luke Dotfiles README

Welcome! This is my collection of Linux dotfiles: the configuration files, aliases, and helper scripts that assist in my daily workflow.  
If you’re tired of typing the same commands, want your shell to feel smarter, or are just looking to borrow some tricks, you might find something helpful in here.

---
## What’s Included

- `.bashrc` — Main Bash configuration file. Sets up environment variables, prompt, shell behavior, and loads everything.
- `.alias.bash` — Some of my favorite shell aliases and helper functions.
- More files to come...maybe...probably.

---
## Quickstart

1. **Clone this repo:**
    ```bash
    git clone https://github.com/<your-username>/dotfiles.git
    ```
2. **Back up your originals!**
    ```bash
    cp ~/.bashrc ~/.bashrc.bak
    cp ~/.alias.bash ~/.alias.bash.bak
    ```
3. **Copy these files to your home directory:**
    ```bash
    cp dotfiles/.bashrc ~/
    cp dotfiles/.alias.bash ~/
    ```
4. **Review each file before running:**
    - Make sure you’re not overwriting anything critical.
    - Update paths, sourced files, or variables as needed.
    - Especially check any custom scripts you did NOT write yourself.

5. **Activate:**
    ```bash
    source ~/.bashrc
    ```

---
## Features

- **Handy Aliases**: `ll`, `gs`, `editbash`, `myip`, and more.
- **Custom Functions**: Set timers, extract archives, find recent files, display the time in multiple timezones, and more.
- **Safe Defaults**: Dangerous commands like `rm`, `cp`, and `mv` prompt before destruction.
- **Git Cheat Sheet**: Type `githelp` for a quick reference of aliased git commands, with explanations.

---
## FAQ

**Q: What if I don’t want all of these settings?**  
A: Comment out what you don’t want. I tried to make it easy to see what each bit does.

**Q: Are there any secrets in here?**  
A: Not if you read before you use! Double-check anything that sources private or system-specific files.

**Q: Will this work on MacOS or WSL?**  
A: Mostly, but some aliases or paths may need tweaking.

---
## Contributing

If you find a typo, want to suggest an alias open a pull request or issue!

---
## License

MIT

---

*and while you're at it, Take a hike! or don't, 'saul good man!— Luke*