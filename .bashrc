if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
    c_reset='\[\e[0m\]'
    c_user='\[\033[1;33m\]'
    c_host='\[\e[1;32m\]'
    c_cont='\[\e[1;34m\]'
    c_path='\[\e[0;33m\]'
    c_git_clean='\[\e[0;36m\]'
    c_git_dirty='\[\e[0;35m\]'
else
    c_reset=
    c_user=
    c_path=
    c_git_clean=
    c_git_dirty=
fi

git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi

    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p') 
    echo " [$git_branch${c_reset}]"
}

PROMPT_COMMAND='PS1="docker-tools:${c_user}\u${c_reset}@${c_host}\h${c_reset}:${c_path}\w${c_reset}$(git_prompt)\$ "'

git-root() {
	cd "$(git proot)"
}

[[ -e ~/aliases.sh ]] && source ~/aliases.sh
