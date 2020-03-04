sqlachemy+pymysql+alembic template
conda env create -f requirements.yaml -p ./env
python db.py create
python db.py alembic revision --autogenerate -m "comment"
python db.py alembic upgrade head
python db.py alembic test
python db.py drop
