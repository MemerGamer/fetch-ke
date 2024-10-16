# fetch-ke

![fetch-ke](assets/main.png?raw=true "fetch-ke")
fetch-ke is a minimalistic, lightweight command-line system information tool written in bash.

The name comes from the Hungarian word <i>fecske</i> which means the bird `swallow`.

## Tests

| Distro                  | Latest supported version |
| ----------------------- | ------------------------ |
| Nobara / Fedora         | v.1.1.6                  |
| Debian                  | v.1.1.6                  |
| Ubuntu                  | v.1.1.6                  |
| Arch                    | v.1.1.6                  |
| Termux                  | v.1.1.6                  |
| Windows 10 / Windows 11 | v.1.0.4                  |
| WSL2                    | v.1.0.4                  |
| macOS                   | :question:               |

## Dependencies

- [curl](https://github.com/curl/curl)
- [figlet](https://github.com/cmatsuoka/figlet)
- [ncurses](https://github.com/mirror/ncurses)

### Note for termux

On termux the battery time displaying is not available currently, however the fetch should work.

## Installation

You can install `fetch-ke` easily using `curl`:

```console
curl -sL https://raw.githubusercontent.com/MemerGamer/fetch-ke/main/install.sh | bash
```

If you want to set this to run when you open a shell session you need to write the following line to your `.bashrc` or `.zshrc` file:

```console
fetch-ke
```

### Windows (maintainers needed)

Copy the tool to `C:\Windows` to make it available globally

If you want to set this to run when you open a shell session you need to follow [this guide](https://superuser.com/a/1009553).
After creating the profile file you need to add the following line to it:

```console
fetch-ke.ps1
```

## Usage Examples

```console
fetch-ke -h # displays help

fetch-ke -v # displays version number

fetch-ke -b # disables long battery information

fetch-ke -c # disables colors

fetch-ke -B # disables battery information

fetch-ke -F # disables figlet at start

fetch-ke -U # checks for updates
```

### No battery display with `-B` flag

![short battery](assets/no_battery.png?raw=true "short battery")

### No colors displayed with `-c` flag

![no_colors](assets/no_colors.png?raw=true "no colors")

### No colors and short battery with combined `-bc` flag

![combined](assets/combined.png?raw=true "combined")

### Windows 10 / Windows 11

![windows](assets/windows.png?raw=true "windows")
