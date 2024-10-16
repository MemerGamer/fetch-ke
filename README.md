# fetch-ke

![fetch-ke](assets/main.png?raw=true "fetch-ke")
fetch-ke is a minimalistic, lightweight command-line system information tool written in bash.

The name comes from the Hungarian word <i>fecske</i> which means the bird `swallow`.

## Tests

| Distro                  | Result             |
| ----------------------- | ------------------ |
| Nobara / Fedora         | :heavy_check_mark: |
| Debian                  | :heavy_check_mark: |
| Ubuntu                  | :heavy_check_mark: |
| Arch                    | :heavy_check_mark: |
| Termux                  | :heavy_check_mark: |
| Windows 10 / Windows 11 | :heavy_check_mark: |
| WSL2                    | :heavy_check_mark: |

## Dependencies

- [git](https://git-scm.com/downloads)
- [figlet](https://github.com/cmatsuoka/figlet)

( [ncurses](https://github.com/mirror/ncurses) - This should be part of your distribution, unless you use termux, see below )

### For termux

You need to install the following utils alongside the dependecies:

```console
pkg install git ncurses-utils
```

#### Note

On termux the battery time displaying is not available currently, however the fetch should work.

## Installation

You can install `fetch-ke` easily using `curl`:

```console
curl -sL https://raw.githubusercontent.com/MemerGamer/fetch-ke/main/install-fetch-ke.sh | bash
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

### Short battery display with `-b` flag

![short battery](assets/short_battery.png?raw=true "short battery")

### No colors displayed with `-c` flag

![no_colors](assets/no_colors.png?raw=true "no colors")

### No colors and short battery with combined `-bc` flag

![combined](assets/combined.png?raw=true "combined")

### Windows 10 / Windows 11

![windows](assets/windows.png?raw=true "windows")
