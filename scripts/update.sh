#!/bin/bash
rm public/* -r
hugo --theme=bleak
cd public/
git add .
git commit -m "Edit content"
git push