function dot;
	if test (count $argv[1]) -eq 0;
		echo "You have not provided file or directory.";
		return 1;
	end;
	set name $argv[1];
	if test -r $name;
		if test -L $name;
			echo "Can't dotfile a symbolic link."
			return 3;
		end;
		set curr (pwd);
		if test -d $name;
			mkdir -p .dotfiles/$name; 
			mv $name/* .dotfiles/$name;
			rm -rf $name
			ln -s $curr/.dotfiles/$name $curr/$name
			echo Dotfiled \"$name\" directory to \"~/.dotfiles/$name\"
		else;
			mv $name .dotfiles;
			ln -s $curr/.dotfiles/$name $name
			echo Dotfiled \"$name\" file to \"~/.dotfiles/$name\"
		end;
		return 0;
	else;
		echo "There is no readable file or directory named "\"$name\".;
		return 2;
	end;

	return 0;
	#mkdir -p .dotfiles/$argv[1]; 
	#mv $argv[1] .dotfiles/$argv[1];
	#ln -s .dotfiles/$argv[1] $argv[1]
end;