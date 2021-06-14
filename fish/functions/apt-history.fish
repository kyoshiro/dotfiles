function apt-history
    argparse a/all b/roolback h/help i/install r/remove u/upgrade -- $argv
    or return # exit if argparse failed because it found an option it didn't recognize - it will print an error

    # If -h or --help is given, we print a little help text and return
    if set -q _flag_help
        echo "apt-history [-a|--all] [-b|rollback] [-h|--help] [-i|--install] [-r|--remove] [-u|--upgrade]"
        return 0
    end

    if set -q _flag_all
		grep '(install|upgrade|remove|rollback)' /var/log/dpkg.log | awk '{ print $1" "$2" "$3" "$4 }'
    end
	if set -q _flag_rollback
		grep 'upgrade ' /var/log/dpkg.log | grep "$2" -A10000000 | grep "$3" -B10000000 | awk '{print $4"="$5}'
    end
	if set -q _flag_install
		grep 'install ' /var/log/dpkg.log | awk '{ print $1" "$2" "$3" "$4 }'
    end

	if set -q _flag_remove
		grep 'remove ' /var/log/dpkg.log | awk '{ print $1" "$2" "$3" "$4 }'
    end

	if set -q _flag_upgrade
		grep 'upgrade ' /var/log/dpkg.log | awk '{ print $1" "$2" "$3" "$4 }'
    end
end
