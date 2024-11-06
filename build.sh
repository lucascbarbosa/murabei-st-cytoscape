# Set version
source version
sed -e 's#{VERSION}#'"${VERSION}"'#g' setup_template.py > setup.py
sed -e 's#{VERSION}#'"${VERSION}"'#g' murabei_st_cytoscape/frontend/package-template.json > murabei_st_cytoscape/frontend/package.json 

# # Build component
# cd st_cytoscape/frontend
# rm -rf build/
# rm -rf node_modules/
# rm -rf murabei_st_cytoscape.egg-info/
# npm install
# npm audit fix
# npm run build

# # Build wheel
# cd ../..
# rm -rf build/
# rm -rf dist/
# python3 setup.py sdist bdist_wheel

# # Upload to PyPI
# python -m twine upload --repository testpypi dist/*

# Commit all
git add --all
git commit -m "Building a new version ${VERSION}"
git push