# Set version
source version
sed -e 's#{VERSION}#'"${VERSION}"'#g' setup_template.py > setup.py
sed -e 's#{VERSION}#'"${VERSION}"'#g' st_cytoscape/frontend/package-template.json > st_cytoscape/frontend/package.json 

# Build component
cd st_cytoscape/frontend
npm install
npm audit fix
npm run build

# Build wheel
cd ../..
python3 setup.py sdist bdist_wheel

# Upload to PyPI
python -m twine upload --repository testpypi dist/*

# Commit all
git add --all
git commit -m "Building a new version ${VERSION}"