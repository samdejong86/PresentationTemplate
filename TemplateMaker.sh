function SlideTemplate {

    if [ -z "$1" ]; then
	name=$(date +%y-%m-%d)
    else
	name=${1}
    fi

    mkdir ${name}
    cd ${name}

    ln -s ~/Documents/Presentations/Template/preamble.tex ./preamble.tex
    cp ~/Documents/Presentations/Template/Template.tex ./${name}.tex
    cp ~/Documents/Presentations/Template/Template_slides.tex ./${name}_slides.tex
    cp ~/Documents/Presentations/Template/Template_notes.tex ./${name}_notes.tex
    cp ~/Documents/Presentations/Template/Template_handout.tex ./${name}_handout.tex
    cp ~/Documents/Presentations/Template/Makefile ./

    sed -i "s/Template/${name}/g" ${name}_slides.tex
    sed -i "s/Template/${name}/g" ${name}_notes.tex
    sed -i "s/Template/${name}/g" ${name}_handout.tex
    sed -i "s/Template/${name}/g" Makefile

    # Check if the title has a date. If so, insert into the "date" field of the tex file
    date=$(echo $name | cut -f1 -d"_")
    date=$(date -d $date +"%B %d, %Y" 2>/dev/null)
    error=$?
    if [ $error -eq 0 ]; then
	sed -i "s/DATE/${date}/g" ${name}.tex
    fi
}
