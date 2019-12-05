function SlideTemplate {
   ln -s ~/Documents/Presentations/Template/preamble.tex ./preamble.tex
   cp ~/Documents/Presentations/Template/Template.tex ./${1}.tex
   cp ~/Documents/Presentations/Template/Template_slides.tex ./${1}_slides.tex
   cp ~/Documents/Presentations/Template/Template_notes.tex ./${1}_notes.tex
   cp ~/Documents/Presentations/Template/Makefile ./

   sed -i "s/Template/$1/g" ${1}_slides.tex
   sed -i "s/Template/$1/g" ${1}_notes.tex
   sed -i "s/Template/$1/g" Makefile



}
