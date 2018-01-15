#!/usr/bin/env python3

from os import walk, chdir
from subprocess import run
import json


GIT_REPO_LIST = "/home/bolt/.tracked-repos.json"
ROOT_DIR = "/home/bolt"
EXCLUDED = [".vim", ".cargo", ".fonts"]

def get_git_repos(source_dir, excluded=EXCLUDED):
    for root, dirs, _ in walk(source_dir, topdown=True):
        dirs[:] = [d for d in dirs if d not in excluded]
        if ".git" in dirs:
            yield root
            dirs[:] = []


def update_repo_list(repo_list_file):
    repo_list = list(json.load(open(repo_list_file)))
    print("Adding these repositories:")
    for git_repo in get_git_repos(ROOT_DIR):
        if git_repo not in repo_list:
            repo_list.append(git_repo)
            print(git_repo)
    json.dump(repo_list, open(repo_list_file, "w"))


def get_repo_list(repo_list_file):
    return list(json.load(open(repo_list_file)))


def check_committed(git_repo):
    chdir(git_repo)
    command = ["git", "diff-index", "--quiet", "HEAD", "--"]
    return_code = run(command).returncode
    assert return_code in [0, 1], """Not a git repository."""
    if return_code == 1:
        return False
    elif return_code == 0:
        return True


def main(update=False):
    if not update:
        repo_list = get_repo_list(GIT_REPO_LIST)
        for repo in repo_list:
            if not check_committed(repo):
                print("{0}: \033[91mUncommitted changes\033[0m".format(repo))
            else:
                print("{0}: \033[92mAll changes committed\033[0m".format(repo))
    elif update:
        update_repo_list(GIT_REPO_LIST)


if __name__ == "__main__":
    from sys import argv
    if len(argv) > 1 and argv[1] == "--update":
        main(update=True)
    else:
        main()
