# fetch-ke

![fetch-ke](assets/main.png?raw=true "fetch-ke")
fetch-ke is a minimalistic, lightweight command-line system information tool written in bash.

The name comes from the Hungarian word <i>fecske</i> which means the bird `swallow`.

## Note

This was only tested on Nobara so far! It should work on any distro.

## Dependencies
- [figlet](https://github.com/cmatsuoka/figlet)

### For termux
You need to install the following utils alongside the dependecies:

```console
pkg install ncurses-utils
```
#### Note:
On termux the battery time displaying is not available currently, however the fetch should work.
## Installation

Clone the repo

```console
git clone https://github.com/MemerGamer/fetch-ke.git
```

Give executable permissions

```console
cd fetch-ke
sudo chmod +x fetch-ke
```

Copy the tool to `/bin`

```console
sudo cp fetch-ke /bin/fetch-ke
```

## Usage Examples

```console
fetch-ke -h # displays help

fetch-ke -v # displays version number

fetch-ke -b # disables long battery information

fetch-ke -c # disables colors

fetch-ke -B # disables battery information

fetch-ke -F # disables figlet at start
```

### Short battery display with `-b` flag

![short battery](assets/short_battery.png?raw=true "short battery")

### No colors displayed with `-c` flag

![no_colors](assets/no_colors.png?raw=true "no colors")

### No colors and short battery with combined `-bc` flag

![combined](assets/combined.png?raw=true "combined")
