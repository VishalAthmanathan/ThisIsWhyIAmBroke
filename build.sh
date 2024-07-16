set -e

if ! command -v python3.9 &> /dev/null; then
    echo "Python 3.9 could not be found. Installing Python 3.9..."
    sudo apt-get update
    sudo apt-get install -y python3.9 python3.9-venv python3.9-dev
    sudo ln -s /usr/bin/python3.9 /usr/bin/python
fi

if ! command -v pip &> /dev/null; then
    echo "pip could not be found, installing pip..."
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
    rm get-pip.py
fi

echo "Installing pip dependancies..."
pip install -r requirements.txt

echo "Collecting static..."
python3.9 manage.py collectstatic

echo "Migrating...."
python3.9 manage.py migrate 