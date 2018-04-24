## RapidLinux
RapidLinux is "build your own LiveOS" project that has been heavily influenced by the [Slax](http://www.slax.org/) project.
The goal of RapidLinux is to provide a complete operating system that boots up the *exact* same way every time, no exceptions.
RapidLinux integrates a Slackware base with an AUFS root filesystem.
Modules can be added/removed on demand with activate/deactivate.

## Pre-Built ISO
The easiest way to get started is to download and run on the pre-built ISO files. These have all the necessary tools to [re-]build a RapidLinux project.
* [RAPIDINSTALL.iso](ftp://rapidlinux.org/isos/RAPIDISNTALL.iso) has just the core module to install grub2 and the module layout
* [RAPIDBUILD.iso](ftp://rapidlinux.org/isos/RAPIDBUILD.iso) has dev tools, but no GUI
* [RAPIDWS.iso](ftp://rapidlinux.org/isos/RAPIDWS.iso) includes dev toold and a fluxbox DE

## Using your own distro
If you want to build this outside RapidLinux, You will need (at least) the following:
* Any modern linux distro with dev tools
* xz-utils
* squashfs-tools
* mkisofs
* Virtual Machine software for testing ISOs

## Installation & Deployment
Check out this repository and run rapidlinux_prepare.sh
By default, it will make a tree in /opt/RL and fill it in with the necessary repositories.
Make sure you have permission to write to /opt, if you keep the default location.

## File Tree
```
/opt/RL
|-- RapidBuilds
|-- RapidKernel
|-- RapidModules
|-- RapidShells
|-- isos
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
>  Copyright (c) 2018 Brett Kuskie and RapidLinux contributors
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
- Brett Kuskie, 2018
- [RapidLinux contributors](CONTRIBUTORS.md)
