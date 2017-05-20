rm public/* -r
cd public/
git add .
git commit -m "Reset"
cd ..
hugo --theme=bleak
cd public/
git add .
git commit -m "Edit content"
git push
cd ..