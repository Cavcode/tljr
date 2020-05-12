# Installing Git, Nimble, Neverwinter and Nasher

The purpose of this tutorial is to install the basic tools required to enable our workflow.  These tools will take a few minutes to install but will save countless hours of building modules and ensuring the most current files are always included.  Using all of these tools in concert will allow the team to ensure the most current files are always in the module, revert to a previous version of any files should we find faults, and build a working module in seconds.  To get those tools working on your computer, follow these steps in order.  If you're a veteran to module development and familiar with this tools, it's your option.  This tutorial is primarily aimed at those who have little experience with these tools.

## Disclaimer

There are **A LOT** of words here.  Don't let this scare you off of the idea of using these tools.  I've chosen to add a lot of detail based on the assumption you've not worked with these tools before.  If you have, you can ignore much of this.  After installing these tools and [reading the workflow tutorial](workflow.md), you should have confidence that you can easily and readily employ these tools to make quick changes to the module.

* [Setting up your GitHub Account](#github-account)
* [Installing Git](#git)
* [Installing Nimble and Neverwinter](#nimble-&-neverwinter)
* [Installing Nasher](#nasher)
* [Getting your Questions Answered](#questions)
* [The Next Step](#conclusion)

## GitHub Account

In order to clone, fork and contribute to this project, you will need a GitHub account.

1. Go to the [join page](https://github.com/join) for GitHub.
2. Complete the registration process
3. Remember your username and password, you'll need this when you install and setup Git.
4. Navigate to the [The Last Jedi repository](https://github.com/Cavcode/tljr).
5. Create a fork off of this repository by clicking on the Fork button.  Ensure you're clicking on the button, not the number next to the button. ![GitHub Fork](https://github-images.s3.amazonaws.com/help/bootcamp/Bootcamp-Fork.png)
    
    *Note:  When the forking process is complete, GitHub will automatically take you to your new forked repository homepage.  This is your repository and you can do anything you want with it without affecting the primary module repository.  You should see `<your_user_name>/tljr` near the top with `cavcode/tljr` just below it.*

    *Note:  If you want to receive updates for changes, issues, etc., on the primary repository, you can click on the `watch` button and `star` button.*

6. Copy the web address of your new forked repository.  The value you need for the next steps will be `https://github.com/<your_user_name>/tljr.git`  You can copy the url from the top of your browser, click on the green clone/download button and copy the value you find there, or just write it down.

    ![Stuff](https://help.github.com/assets/images/help/repository/clone-repo-clone-url-button.png)

## Git

In order to efficiently contribute to the The Last Jedi project, you need a git client.  Git is source control software which tracks changes to selected code and allows reversion, if necessary.  Following are the steps to obtain, install and configure your git client.  For those on Windows, you will get a tool called Git Bash which is a version of PowerShell or a command line utility.  However, any command line utility or terminal can be used to accomplish the tasks required to setup Git.

1. [Download](https://git-scm.com/downloads) and install git for your operating system.

    *Note:  If you're not interested in the command line interface, there are several [visual Git clients](https://git-scm.com/downloads/guis) that you can use.  I'm not familiar with any of them as the command line serves all necessary purposes.  If you choose to use a GUI/visual client, you're on your own for learning and employing it.*

2. Create a new folder on your computer.  The location is optional.  I keep all of my local repositories in a folder on my desktop called `Git_Repositories`.  Avoid spaces in the title to make it easier to navigate from the command line.  Within your new folder, create a The Last Jedi specific folder.  For ease of navigation, I called mine `ds`, but you can name it anything you want.  If you use these folder names, the address of your folder should be something like: `C:\Users\<your_name>\Desktop\Git_Repositories\ds`.

3. In your command line utility (powershell, git bash, vscode terminal, etc.), navigate to your The Last Jedi directory (`ds` in the example above).

    *Note:  Each command line utility displays your current folder in a different way, but it should be obvious where you are.  Use the command `dir` to see what folders are in your current directory, `cd ..` to move backward one level in the folder structure, or `cd <folder_name>` to move to another folder.*

4. Add your username and e-mail to the Git configuration file.  This is required if you want to submit content to the repository.  This not the user name you used to [create an account on GitHub](#github-account) in the previous section.  It's just your name.  This value and your email will be automatically attached to all commits that are pushed to the remote repository.  In your command line client, type the following:

    ```
    git config --global user.name "<your name>"
    git config --global user.email "<your.email@address.com>"
    ```

5. Clone the forked repository you created when you were making your GitHub account.  To do this, type the following into your command line:  
    ```
    git clone https://github.com/<your_user_name>/tljr.git
    ``` 
    and press enter.  If you correctly entered the repository address, you should see some activity and reports showing copied files.  These files are being copied from your forked repository to your computer.  

6. Add an upstream to your forked repository so you can retrieve updates from the primary module repository.  Since you are not working on the primary repository, any updates to the primary repository will not automatically update to the fork you're working on.  If you want to retrieve updates from the primary repository to ensure you always have the most recent data, you need to add an upstream to your local repository.  On the command line, type the following: 
    ```
    git remote add upstream https://github.com/cavcode/tljr.git
    ``` 
    and press enter.  You are using the primary repository (`cavcode/tljr`) as your upstream, not your forked repository, so type the command exactly as you see above.  Adding this upstream does not automatically keep your forked repository updated with the primary repository's content.  I'll show you how to do that later.

Ok, that's it for Git. Let's work on the rest.

## Nimble & Neverwinter

#### Nimble
Nimble is a programming language.  Although you will probably only directly use this once during this setup, it is a pre-requistie for installing Nasher.

You can use a program called choosenim to install all the pre-requisites for nimble and nimble itself.  To do this, go to the [choosenim releases page](https://github.com/dom96/choosenim/releases) and download the appropriate release for your operating system.  If you selected a zipped file, unzip the files to your preferred location (they cannot be run directly from the zip file) and run the `runme.bat` batch file.  This will install choosenim and add the nimble directory to your system PATH file.  Follow any prompts on you screen.

#### Neverwinter
Neverwinter.nim is a set of tools that can convert the various file formats used by Neverwinter Nights into .json and other formats, which are text files readable by most text readers and easily handled by source control systems, such as Git.  Without these conversion tools, we would not be able to track file changes nor have the convenience of build tools such as Nasher.

Since we've already installed Nimble, installing neverwinter.nim is extremely easy.

1. In your command line utility, type the following

    ```
    nimble install neverwinter
    ```

    and press enter.

    *Note:  It is unlikely you'll be using neverwinter.nim directly.  These tools will primarily be used by Nasher.*

## Nasher

Nasher is a module maintenance tool written and maintained by Michael Sinclair (squattingmonk).  Although not strictly a requirement, using Nasher will greatly reduce your workload and shorten your workflow when deploying content to the The Last Jedi module.  Nasher can be run through docker, though if you're not familiar with docker, I recommend installing it directly.

Since we already have the nimble programming language installed via choosenim, installing Nasher is easy. 

1. In your command line utility, type the following

    ```
    nimble install nasher
    ```

2. Initialize Nasher.  Much like Git, Nasher creates a cache of your repository files in order to compare file versions.  This allows Nasher to skip certain steps in the build process and saves time, especially in a large module.  In your command line utility, type the following:

    ```
    nasher init
    ```

    *Note:  This command will create a hidden .nasher directory in your folder.  This folder contains the file cache and a few other items.  Everything within this folder can be deleted without repurcussion, however, do not delete the .nasher folder itself.*

3. Configure NWNSC.  NWNSC is an external script compiler for Neverwinter Nights created by glorwinger (sorry, I don't know his real name).  He created this tool so that module developer's like yourselves could compile scripts without having to use the toolset.  NWNSC provides much better feedback and can be used with almost any development environment (including [VScode](vscode.md)) to test script compilation without opening the toolset.  The file `nwnsc.exe` is included in the base folder of the primary repository, so it will be included in your forked repository.  The following command uses the path where your NWNEE game files are installed, not the path to the user content that is normally in your documents directory.  To configure your installation path, type the following into your command line utility:

    ```
    nasher config --nssFlags "-n C:/<path>/<to>/<NWNEE> -owkey"
    ```

    *Note:  A common error is to have a trailing '/' after the path in the command above.  There should be no trailing '/'.*

## Questions

If you have any questions about installing these tools, and you're sure you followed the instructions above correctly, you're best bet is to get onto the [The Last Jedi discord](https://discord.gg/QbDKVZn) and ask a question about installing the tools. If you tag me (@Captain Harlock) in your post, I'll likely answer pretty quickly.  If you don't tag me, I may not see the question at all, but one of our many other team members might be able to help.  I'm happy to answer discord DMs also if you don't want to join the discord.

## Conclusion

Git and Nasher will be the primary programs we will use when we conduct our repository workflow.  Once all of this is setup, it only takes a few seconds to create a working module from the repository.  Any changes you make can be reflected within a working module within a few more seconds.  How to do all of this will be handled in the [workflow tutorial](workflow.md).  Read that next.

