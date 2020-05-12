# Creating an Efficent Workflow

You should not be reading this document unless you've already completed the [tool installation tutorial](tools.md) or you are an experienced developer and you are already famliar with these tools.  If you haven't installed the basic development tools we're using, [do it, do it now!](tools.md)

The purpose of this tutorial is to create an efficient and repeatable workflow pattern that will allow all contributors, no matter their skill and knowledge level, to substantially contribute to this project without unnecessarily burdening other team members.  This tutorial will provide basic directions on how to use the tools you installed in the last tutorial and a methodology for how tools should be employed together.

## Disclaimer

There are **A LOT** of words here.  Don't let this scare you off of the workflow idea.  I've chosen to add a lot of detail based on the assumption you've not worked with these tools before.  If you have, you can ignore much of this.  But to build your confidence that this is actually a simple process, everything below boils down to a few steps:

```
git pull upstream master
nasher install ds --yes
```

Accomplish and save all of your amazing work.

```
nasher unpack ds
git add .
git commit -a -m '<your message here>'
git push origin master
```

That's it! Once those steps are accomplished, you've updated all your work, made your changes and re-published all your work to your remote repository.  Okay!  Let's get started...

* [Git Terminology](#git-terminology)
* [Nasher Terminology](#nasher-terminology)
* [The Workflow](#workflow)

## Git Terminology

These definitions are provided to help you understand what some of the Git terminology means.  We will not be using all of these terms in this tutorial, but you will likely hear about some of them as you work with Git.  Some of these commands and term reference advanced usage, so don't worry if you're not familiar with them.  Reading these definition is not strictly necessary, but if you see a Git term in this tutorial that you're not familiary with, it's probably in this list.

`Clone` - a copy of a repository or the act of copying a repository.

`Local Repository` - the files that are on your computer.  Changes to these files will not be pushed to your remote repository, and therefore cannot be part of a pull request, until you save, stage, commit and push the changed files.

`Remote Repository` - the files that are on the GitHub servers.  Changes to these files will only occur when you request an upstream pull or when you push committed changes.

`Upstream` - the controlling repository for your fork.  This is the repository you forked off of.  In our case, it's the primary repository located at https://github.com/cavcode/tljr.

`Working Tree` - another name for the files in your local repository.  Typically, working tree is referenced as being clean (no changed files) or dirty (files have been changed, but not committed and pushed).

`Pull` - request to copy all changed files from the remote repository to the local repository and merge those changes with your local files.

`Push` - request to copy all commited files from the local repository to the remote repository.

`Fetch` - request the metadata for all changed files from the remote repository, but not to copy or merge the changed files from the remote repository.  This allows you to see potential conflicts with changed files in the remote repository vs. changed files on your local repository.

`Merge` - combining files from one fork with the files of another.  The most common type of merge you will see with this project is merging your changes with the primary repository.

`Stage` - telling your repository which changed files will be committed to the repository on the next push command.

`Commit` - committing changed files to the remote repository.  This requires a comment to be added as to why you're are committing these files.  The comment limit is 50 characters and can be anything you want (i.e. updating half-giant model).

`Pull Request` - a request sent from your remote repository to the primary repository when you think your files are ready for primetime.  This will signal the primary repository keepers to review your work and merge it with the primary repository.

`Stash` - "pauses" your changes so you can save your work and clean your working tree without having to stage and commit your changes to your remote repository.  This is a workaround to allow you to perform updates that require clean working trees (such as upstream updates) without having to commit all of your changes first.

`Branch` - a version of your repository that diverges from the main working project, but is still a part of your repository.  You can create a branch if you want to test how a change will work on the repository without changing the original files.

## Nasher Terminology

These definitions tell you what each of the major Nasher commands do.  Reading these definitions is not strictly necessary, but if you're confused by what Nasher is doing when you type a command, this is probably a good first place to look.

`unpack` - converts all module resource files in .json files so they can be tracked by Git and shared with the rest of the team.  Script files (.nss) are plain text files, so they are not converted to .json.

`convert` - converts all .json sources in your local repository to the native gff format for use within the module.  The command will turn the unpacked .json files back into the correct file format, such as .uti.

`compile` - compiles all of the scripts in your local repository without building a module.  This allows you to batch compile all of the scripts to check for errors.

`pack` - coverts and compiles all of the resources in your local directory into a module file (.mod) and places that file into the base folder of your local repository.

`install` - converst, compiles and packs all of the resources in your local repository into a module file (.mod) and copies that file into the base folder of your local repository as well as into the modules folder of your NWN:EE installation.

# Workflow

Here is the general workflow I've developed and it seems to be relatively efficient in adding new content.  Any references to "local" or "remote" repositories in this document are specifically referencing your forked repository (`https://github.com/<your-user-name>/tljr`).  Any reference to the "primary" repository is referencing the primary The Last Jedi repository (`https://github.com/cavcode/tljr`).

* [Updating Your Forked Repository](#updating-your-forked-repository)
* [Building the Module](#building-the-module)
* [Adding Content](#adding-content)
* [Unpacking the Module](#unpacking-the-module)
* [Cleaning up Your Workspace](#cleaning-up-your-workspace)
* [Staging and Committing Changes](#staging-and-committing-changes)
* [Updating the Remote Repository](#updating-the-remote-repository)
* [Request Review of New Content](#request-review-of-new-content)
* [Getting your Questions Answered](#questions)
* [The Next Step](#conclusion)

All calls to installed tools will be via the command line interface.  Graphical user interfaces will not be discussed here.  If you use a GUI, you are responsible for learning and using your installed system.  The installed tools I'll reference in this tutorial are `git` and `nasher`.  All commands should work readily in your command line utility so long as you have navigated to your primary The Last Jedi forked repository folder.  If you followed the example in the tools installation tutorial, that repository will be located at `C:\Users\<username>\Desktop\Git_Repositories\ds`.  If you chose to locate your repository somewhere else, ensure you are in your chosen location before running any of the commands below.

## Updating Your Forked Repository

Your forked repository will not automatically update from the primary repository until you ask it to.  Updating your fork will ensure you always have the latest version of any files others are working on that have already been accepted into the primary repository.  You will not be able to view other developer's work unless you navigate to their GitHub forked repository.

*Note:  This step is not strictly necessary.  If you're not working on any of the base module files that are sourced from the primary repository and your work does not depend on those files being current (such as adding new models, etc.), then you can [skip this step](#building-the-module).

To update your forked repository, run the following command in your command line utility:

```
git pull upstream master
```

git -> the program we're using
pull -> the action we're taking (see [Git Terminology](#git-terminology))
upstream -> where we're getting the files from
master -> the name of the branch we're getting the files from

This command will force your local (on your machine) and remote (on the the GitHub server) repositories to update all files that are sourced from the primary repository.  If you've added new files in your fork, those files will be ignored.  If there are no new or changed files in the primary repository, no files will be updated in your local or remote repository.

*Note: A common mistake that causes this command to fail is a dirty working tree.  If you have any changed files in your local repository that were sourced from the primary repository that you have not yet committed to your remote repository, and the files on the primary repository have changed, git will not allow the changes to be incorporated because it does not want to delete your work without your permission.  To resolve this issue, you must commit, undo or stash all of your changes ("clean your working tree") before updating your repositories with an upstream request.*

## Building the Module

*Note:  If you are modifying non-toolset files (such as scripts, models, 2DAs, etc.), you do not need to build the module to do your work.  Open your work directly from the repository directory on your computer, do your work in whatever program you use, and re-save the work into the repository.  Then skip down to the [staging and committing section](#staging-and-committing-changes) below to continue your workflow.  So, if you are not building items, areas or conversations, you can work completely outside the toolset and save yourself a few steps.*

Now we're ready to build a module file so we can start working on it.  In your command line utility, type the following:

```
nasher install ds --yes
```

This command will convert, compile, pack and install a module file into your modules folder.  This will make it available immediately to the toolset when you open it.  If you're given the option to open the module via a folder tree, take that option.  If you've [updated your repository](#updating-your-forked-repository), this module file will be the most current module we're using.

## Adding Content

#### Toolset

I can't give you a lot of direction here.  If you're adding content via the toolset, then do your thing and save your work when you're done.  

#### Other Files

If you're simply copying or moving files into your local repository that don't require the use of the toolset, then use your file explorer utility to move those files into the appropirate folder in your repository.

#### Tracking New Files

Any new files you add, either in the toolset or via copy/paste, will not automatically be tracked by Git for pushing to the repository.  In order to track all of your new files, type the following into your command line utility:

```
git add .
```

The `.` tells Git to ensure all files in your repository, including subfolders, are included in your repository.  This will also stage all new files for the next commit.

## Unpacking the Module

If you've added content to the module and saved your work, you can unpack that work back into your repository.  **You do not need to build the module within the toolset to do this.**  To unpack the module, accomplish the following

1. Ensure all of your toolset work is saved.
2. *Read this entire step before proceeding* -- Delete the module file from your local repository directory.  **Do not delete** the module file from your modules directory or your work will be lost.
3. Unpack the module into your repository with the following:

```
nasher unpack ds
```

This is the most conservative way to unpack the module as it will prompt you for a yes or no answer for any major changes, such as deleting files from the repository that you've removed in the toolset.  It will not overwrite any files that have not been changed nor any files that don't exist in the module (such as these markdown files).  There are other command arguments you can to make the unpacking go faster.  You may wish to use these when you're more comfortable with the process.

`nasher unpack ds --removeDeleted:true --yes`, will unpack the module, remove any deleted files without prompt and, if there are any prompts, it will force answer them with yes.

`nasher unpack ds --removeDeleted:false --no` will unpack the module, keep all the files in your repository, even if you deleted them in the toolset and force answer no to any prompts that might come up.  If you delete files in the toolset (such as removing items or areas), I recommend removing the deleted files from your repository with the `--removeDeleted:true` argument.  Otherwise, the files will be included in your module when you build it again the next time you work on it.

*Note:  If you're just finishing for the day and coming back to it tomorrow, you don't need to accomplish the following steps.  If you've finished a major revision and want to publish it, continue on.*

## Cleaning up Your Workspace

Now that you've done your work and unpacked it back to your repository, you can clean up your workspace.  This step is never strictly necessary, but it doesn clean up some files to ensure you're not accidentally using old files in your work.  Also, it reduces some of the prompting you will see when using Nasher commands.

1. Delete the module file and the module working directory in your modules folder.
2. Delete the module file, if you haven't already, in your local repository folder.

## Staging and Committing Changes

If you've decided to use VS Code as part of your development environment, see the [~~VS Code tutorial~~ coming soon](#vscode.md) to get detailed information on staging, committing and pushing changes to your repository.

You do not have to stage and commit changes every time you do your work.  However, if others are depending on the work you're doing, you'll want to publish your changes as soon as they're complete.  If you're planning on [submitting a pull request](#request-review-of-new-content), you must commit your changes first.

#### Staging

You stage your work by adding it to the next commit.  Previously, you used the `git add .` command to add new files and noted that doing this also staged them for the next commit.  If you've modified files in the toolset (or some other way) and they're now in your repository, you can check the status of those files by using the following command:

```
git status
```

This will display all new and changed files in your repository and whether those files will be included in the next commit or now.  If you see any files that are marked as not being committed, but you want them include, run the `git add .` command again to ensure they're included.  If you don't to include all of the changed file, but just some specific file, you can use:

```
git add <filename>
```

This will stage only the selected file to the next commit.  Use `git  status` again to check the status of these files.

*Note:  Once you're comfortable will this process, and if you want to include all changed and new files to the next commit, you can completely skip the staging step.  See the [committing](#committing) section below on how to do that.

#### Committing

Once all the files you want sent to your remote repository are staged, you have to commit them and add a commit message.  Use the following command:

```
git commit -m "<your message here>"
```

If you want to skip the staging step and include all new and changed files in the next commit, you can use the following:

```
git commit -a -m "<your message here>"
```

The `-a` tells Git to stage all tracked files

#### Pushing

We're almost there.  To push all of your committed change, type the following into your command line utility:

```
git push origin master
```

Well, we're finally here.  All of your hard work has paid off and it's now in your remote repository for the world to see.  You can leave it there, delete it, change it, or do whatever you want with it.  If you want to have it incorporated into the base module, however, you need to [submit a pull request](#request-review-of-new-content).

## Request Review of New Content

This is also known as a pull request.  To submit a pull request, go to your forked repository's home page on git hub (`https://github.com/<your-user-name>/tljr`).  Near the top, underneat the summary section that shows all of the commit and branch numbers, but above the files, you should see a couple of buttons that look like this: ![pull request button](https://help.github.com/assets/images/help/pull_requests/pull-request-start-review-button.png)

Click on the `New Pull Request` button.  The next screen will show you all of the changes you've made, including file additions.  It will also request you add some text as to why you're requesting this pull to the primary repository.  Add some discussion as to what changes you made, what your intent behavior for the new items is and any other pertinent information necessary to ensure smooth integration into the primary repostitory.  When you're done, click on the big green button and either send the pull request or save it as a draft request for later submission.

 ![pull request submission button](https://help.github.com/assets/images/help/pull_requests/pullrequest-send.png)

## Questions

If you have any questions about installing these tools, and you're sure you followed the instructions above correctly, you're best bet is to get onto the [The Last Jedi discord](https://discord.gg/QbDKVZn) and ask a question about installing the tools. 

## Conclusion

I know this was a lot of information, but, again, it all boils down to just a few commands once you're used to it.  The majority of this tutorial is aimed at our audience that is new to this process.  If you've decided to use VS Code, which can accomplish a lot of these steps in a visual environment, please read the [~~VS Code Tutorial~~coming soon](vscode.md).  This is not really necessary for most content developers, but if you're a scripter, I highly recommend your consider VS Code as your primary development environment for this module.