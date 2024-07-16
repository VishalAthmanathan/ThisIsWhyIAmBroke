set -e

if ! command -v pip &> /dev/null; then
    echo "pip could not be found, installing pip..."
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
    rm get-pip.py
fi


pip install -r requirements.txt

python3.9 manage.py collectstatic

python3.9 manage.py migrate 