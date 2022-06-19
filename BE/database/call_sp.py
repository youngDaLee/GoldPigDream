from db_conn import db_conn


@db_conn
def call_sp_lotto_res_insert(sp_args, cursor=None):
    """
    """
    sp = 'CALL lotto_res_insert(%(round)s, %(lotto_no)s, %(bonus_no)s, %(1st_prize)s, %(2nd_prize)s, %(3rd_prize)s, %(4th_prize)s, %(5th_prize)s, @o);'
    cursor.execute(sp, sp_args)
    return True
