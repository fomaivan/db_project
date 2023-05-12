from typing import NoReturn

import pandas as pd


def psycopg2_execute_sql(sql, conn) -> NoReturn:
    cursor = conn.cursor()
    cursor.execute(sql)
    conn.commit()


def execute_sql_to_dfs(conn, sql) -> pd.DataFrame:
    return [pd.read_sql(query, con=conn) for query in sql.split(";") if query]


def read_sql(filepath):
    with open(filepath, "r") as file:
        return file.read().rstrip()
