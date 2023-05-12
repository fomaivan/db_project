import os
import pytest
from typing import List
import pandas as pd
from . import execute_sql_to_dfs
from . import read_sql


@pytest.fixture()
def select_script():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path)


@pytest.fixture()
def select_dfs(select_script, sqlalchemy_conn):
    return execute_sql_to_dfs(
        conn=sqlalchemy_conn,
        sql=select_script
    )


def test_6_1(select_dfs: List[pd.DataFrame]):
    df = select_dfs[0]
    assert list(df.columns) == ["cinema_name", "count_of_visitors"]
    assert len(df) == 1


def test_6_2(select_dfs: List[pd.DataFrame]):
    df = select_dfs[1]
    assert list(df.columns) == ['cinema_id', 'cinema_name', 'count_of_sessions']
    assert len(df) == 2



def test_6_3(select_dfs: List[pd.DataFrame]):
    df = select_dfs[2]
    assert list(df.columns) == ['cinema_id', 'cinema_name', 'avg_price']
    assert len(df) == 2


def test_6_4(select_dfs: List[pd.DataFrame]):
    df = select_dfs[3]
    assert list(df.columns) == ['cinema_name', 'hall_id', 'num_of_visitors', 'rank_of_halls']
    assert len(df) == 3


def test_6_5(select_dfs: List[pd.DataFrame]):
    df = select_dfs[4]
    assert list(df.columns) == ['cinema_name', 'most_popular_movie']
    assert len(df) == 2


def test_6_6(select_dfs: List[pd.DataFrame]):
    df = select_dfs[5]
    assert list(df.columns) == ['user_id', 'name', 'number_of_visits']
    assert len(df) == 10
    assert len(df) == len(df['user_id'].unique())