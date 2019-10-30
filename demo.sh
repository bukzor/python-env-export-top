TOP="$(dirname "$(readlink -f "$0")")"
rm -rf tmp
mkdir tmp
cd tmp
set -ex

virtualenv tmpenv
. tmpenv/bin/activate
###pip install $TOP
###pip install env-export-top --extra-index-url https://testpypi.python.org/pypi
pip install env-export-top
unset TOP

touch .top
echo "\$PWD:$PWD"
echo "\$TOP:$TOP"
python -c 'import os; os.system(r"echo \$TOP:$TOP")'
