import pymysql
from dbutils.pooled_db import PooledDB
from settings.config import DATABASE, LOTTO_DATABASE


def db_conn(func):
    """
    decorator function for DB Connection
    """
    def wrapper(*args, **kwargs):
        try:
            conn = LOTTO_DB.connection()
            cursor = conn.cursor()
            result = func(*args, **kwargs, cursor=cursor)

            return True, result
        except Exception as e:
            print("Error, {}() : {}".format(func.__name__, e))

            return False, None
        finally:
            cursor.close()
            conn.commit()
            conn.close()

    return wrapper


# Connect to health Database
try:
    LOTTO_DB = PooledDB(
        creator=pymysql,  # mysql
        mincached=DATABASE['mincached'],
        maxconnections=DATABASE['maxconnections'],
        blocking=True,
        host=LOTTO_DATABASE['host'],
        port=LOTTO_DATABASE['port'],
        user=LOTTO_DATABASE['id'],
        password=LOTTO_DATABASE['pw'],
        dbname=LOTTO_DATABASE['db'],
        connect_timeout=DATABASE['connect_timeout'],  # 10
        ping=DATABASE['ping'],  # 2
    )
    print("CONNECT!!")
except Exception as e:
    msg = "[Emergency Error] service cannot connect to PostgreSQL - \
           [host: {}, db: {}, error: {}]".format(LOTTO_DATABASE['host'], LOTTO_DATABASE['db'], e)
    print(msg)
