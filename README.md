## RapidLinux
RapidLinux is "build your own LiveOS" framework that has been heavily influenced by the [Slax](http://www.slax.org/) project.
The goal of RapidLinux is to provide a complete operating system that boots up the *exact* same way every time, no exceptions. \
RapidLinux integrates a Slackware base with an AUFS root filesystem. \
Modules can be added/removed on demand with the activate/deactivate scripts.

## Pre-Built ISO
The easiest way to get started is to download and run on the [pre-built ISO files](http://www.rapidlinux.org/). \
RAPIDBUILD.iso and RAPIDWS.iso have the necessary tools to [re-]build a RapidLinux project.
* [RAPIDINSTALL.iso](http://www.rapidlinux.org/RAPIDINSTALL.iso) has just the core module to install a bootloader and the module layout to a HD
* [RAPIDBUILD.iso](http://www.rapidlinux.org/RAPIDBUILD.iso) has dev tools, but no GUI
* [RAPIDWS.iso](http://www.rapidlinux.org/RAPIDWS.iso) is a ~400MB image with dev tools and a fluxbox DE
* [RAPIDFS.iso](http://www.rapidlinux.org/RAPIDFS.iso) is a ~230MB image with samba and file-sharing tools
* [RAPIDDOCKER.iso](http://www.rapidlinux.org/RAPIDDOCKER.iso) is a ~220MB image with docker and docker-compose

## Using your own distro
WARNING: Minimal testing has been done on this method! \
If you want to build this outside of RapidLinux, see [this page](https://github.com/Fullaxx/RapidLinux/blob/master/FOREIGN_BUILD.md)

## Installation & Deployment
Check out this repository and run rapidlinux_prepare.sh
By default, it will make a tree in /opt/RL and fill it in with the necessary repositories.
Make sure you have permission to write to /opt, if you keep the default location.
When pulling software packages over curlftpfs, it might be slow.
You can speed this up by using rsync (or similar) to download packages.

## Repositories
* [RapidBuilds](https://github.com/Fullaxx/RapidBuilds) - Build scripts for the LiveCD
* [RapidModules](https://github.com/Fullaxx/RapidModules) - Build scripts for additional software
* [RapidKernel](https://github.com/Fullaxx/RapidKernel) - Scripts to compile your kernel

## File Tree
```
/opt/RL
|-- RapidBuilds
|-- RapidModules
|-- packages
`-- output
```

## More Info
* [Slackware](http://www.slackware.com/)
* [AUFS](http://aufs.sourceforge.net/)
* [Slax](http://www.slax.org/)
* [Linux-Live](https://www.linux-live.org/)

## License
MIT License
>  Copyright (c) 2021 Brett Kuskie and RapidLinux contributors
>
>  Permission is hereby granted, free of charge, to any person obtaining a copy
>  of this software and associated documentation files (the "Software"), to deal
>  in the Software without restriction, including without limitation the rights
>  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>  copies of the Software, and to permit persons to whom the Software is
>  furnished to do so, subject to the following conditions:
>
>  The above copyright notice and this permission notice shall be included in
>  all copies or substantial portions of the Software.
>
>  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>  THE SOFTWARE.

## Enjoy RapidLinux!
- Brett Kuskie, 2021
- [RapidLinux contributors](CONTRIBUTORS.md)
