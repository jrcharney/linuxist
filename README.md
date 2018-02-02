# Linuxist

Linuxist is the all-in-one script for people who want to get started using Linux.  Along the way, I've also included some fun stuff.  Those "hacker secrets" everybody seems to show off but never demonstrate.

This project will include things for setting up several software. The two important ones I highly recommend are Vim and Tmux.

Other things like modern programming stuff like Node.js and PostgreSQL will also be included. I do NOT recommend using a LAMP stack becaus of the amount of resources Apache consumes compared to the lithe setup that a MERN stack has to offer.

If you are using Bash on Ubuntu on Windows, I highly recommend you download this project after you've downloaded my windows project designed for it called [Windowsist](https://github.com/jrcharney/windowsist).

## Features

Along the way, I will also include somethings I highly recommend you install [Vim](http://www.vim.org/), a preset `~/.vimrc` file to get you up and running, and where to find all those fonts and toys that make everything work.  I recommend using [Vundle](https://github.com/VundleVim/Vundle.vim) for Vim plugins and taking a look at [Nerd Fonts](http://nerdfonts.com/).  Because we are using Vim, we ill be using plugins like [Vim Airline](https://github.com/vim-airline/vim-airline), along with the [themes](https://github.com/vim-airline/vim-airline-themes) and compatible fonts that allow you to have access to all those extra glyphs.

Furthermore, I also recommend using [Tmux](https://tmux.github.io/) which has plugins that work with Vim (such as [tmuxline](https://github.com/edkolev/tmuxline.vim)) and extend the functionality (which will use [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)).

## FAQ

### Is it ready yet?
Consider this in alpha at the moment on the verge of becoming beta.  I just need to upload some sanitized dotfiles and fix a few more icons.

### Why did you upload a script that can't run?
I think it is more important that I organize my thoughts first before I execute them.  Linux requires the user to do a whole lot of work to get what they want. Something proprietary software companies like Apple and Microsoft behave like "You know you have alternatives. Like letting us do that for you...of course you will need to sign over your personal information, be stuck in a contract with us if you are doing this for a company, and sell us your soul! MU HA HA HA HA!!!" (OK, so that last part is a bit overly dramatic...or is it?)

Linuxist offers a less-faustian way to download stuff.

### Why is there all this software for stuff I won't use? And why is it grouped together? Don't some Linux distros do that already?

Wow. Lots of questions.

To answer the first question, because there is. My goal isn't to overwhelm it is to say "Hey check out all these accessories. They look pretty cool.  You should probably down load them."

To answer the second question, they are grouped together because chances are someone will be like "why do I need that? I won't need that. I'll never use it" only to realize later "why can't I do \[Insert Action Here\]?" of "man that, looks awesome. What do i need to do to install that?" or "I should have installed \[Insert Software Package Here\]."  Think of it as how a Swiss Army Knife or Leatherman looks awesome and everyone is like "You don't need it. You'll never use all the stuff that is on it" until the day comes when you actually have to use it.  Things are bundled so instead of just having one screwdriver (which might not be right one you need) you have a whole bunch of screwdrivers and a wrench, and a set of ratchets, and a hammer.

Finally, for the third question, Yes they do...badly.  The popular distros offer the software...they just don't provide *Up to date* software.  For instance, let's say you want to learn python from [*Learn Python 3 The Hard Way*](https://learnpythonthehardway.org/) which you will need Python 3.6 to use.  Let's also assume you are using Ubuntu 16.04 (Xenial Xerus). (By the way, Xenial is still used in Linux on Windows for Windows 10. See my [Windowsist](https://github.com/jrcharney/windowsist) for how to set that up.)  Everything is doing just fine until you hit Exercise 5, where a new feature, format strings, is used.  Python 3.5 does not have this feature. But 3.6 does.

There are a few exceptions to using `apt` such as (I forget what I was going to say here.) 

### I'm using Ubuntu, things don't look right. What should I do?
File an issue.  My next step is to eventually fire up Oracle VM Virtual box and try it with other Debian Distros (e.g. Linux Mint)

### Can this thing run on Raspberry Pi?
I don't know. I would hope that it does. Knowing how slow some of the software behaves, I would hold off on making a Raspberry Pi that does everything in this script.

### Why is all the newer version of stuff written in Python?
I got tired of trying to use Bash.  There is no way to establish a form of exception handling in Bash to be honest.  You want to make good, idiot-proof software, don't worry about the possiblity of a bigger idiot, change how you make things.

### I'm not using an Debian based Linux distro. What about us?
I can't appease everybody.  I'd like to think that I would eventually port this to Fedora to flatter some folks at Red Hat or Amazon Web Service.  Maybe you could help out by forking this project later when I've [*"BECOME FAMOUS"*](https://www.youtube.com/watch?v=ryasjfFAPLE).

As for the ArchLinux and Gentoo Linux folks, you are defintely on your own right now.

### What license is this all under?
MIT License.  This is actually one of the first curl-pushed repos I've made that I forgot to include some details in the JSON data.  No matter, I got another project in the works that could fix that.

### How are you funding this project Jason?  Don't you have to eat and pay bills?
That's a seriously kind question!  I'm hoping to link up with a Patreon account assuming I make sense of the tax stuff that goes with it.


In the meantime, welcome to that part of Linux everyone wanted but were too afraid to do it themselves.  **WELCOME TO THE LINUXIST!**

