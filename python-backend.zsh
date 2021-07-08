# HOMEBREW SETUP
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
if [[ -d $HOMEBREW_PREFIX ]]; then
	# use ${VAR} when you dont have the luxury of whitespace to be explicit
	export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:${PATH}";
	# even fancier variable notation prevents a trailing ':' if MANPATH or INFOPATH are undefined
	export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
	export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";
fi

# PYENV SETUP
# TODO rewrite with $(pyenv root)/shims if you dont keep pyenv in .pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT ]]; then
	export PATH="${PYENV_ROOT}/shims:${PATH}"

	if command -v pyenv 1>/dev/null 2>&1; then
	  eval "$(pyenv init -)"
	fi

	export PYTHON_CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)"
	export CFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix sqlite)/include -I$(brew --prefix bzip2)/include"
	export LDFLAGS="-L$(brew --prefix zlib)/lib -L$(brew --prefix sqlite)/lib -L$(brew --prefix bzip2)/lib"
fi
