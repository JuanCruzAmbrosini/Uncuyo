from sqlalchemy import create_engine, text

engine = create_engine(
    "postgresql+psycopg://root:adminadmin@localhost:5432/psqlunisys"
)

with engine.connect() as conn:
    result = conn.execute(text("SELECT count(*) from employees"))
    print(result.fetchone())

engine = create_engine(
    "mysql+pymysql://root:adminadmin@localhost:3306/mdbunisys"
)

with engine.connect() as conn:
    print(conn.execute(text("SELECT * from a;")).fetchone())