
source /vercel/path0/venv/bin/activate

pip install -r requirements.txt

python3.9 manage.py collectstatic

python3.9 manage.py migrate 