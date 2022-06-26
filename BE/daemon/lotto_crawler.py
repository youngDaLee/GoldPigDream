import re
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def cleaning(text):
    onlynum = re.sub('[,원]','',text)
    # regex = re.compile(r'\d')
    # matchobj = regex.search(onlynum)
    # num = int(matchobj.group())
    return int(onlynum)


def return_drwt(text):
    ret = []
    for i in text:
        string = str(i)
        onlynum = re.sub('<.+?>','', string, 0, re.I|re.S)
        if onlynum == '\n':
            continue
        ret.append(int(onlynum))
    return ret


def crawl_lotto_all():
    """
    Crawl all round of lotto result
    """

    chrome_options = Options()
    chrome_options.add_argument('--headless')

    browser = webdriver.Chrome('./chromedriver.exe', options=chrome_options)

    browser.implicitly_wait(5)

    base = 'https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo='

    for page in range(1, 2):

        url = base + str(page)
        # move page
        browser.get(url)

        soup = BeautifulSoup(browser.page_source, 'html.parser')

        try:
            browser.implicitly_wait(10)

            cnt = page

            lottono_list = return_drwt(soup.select('div.num.win > p ')[0])
            lotto_no = ','.join(lottono_list)
            bonus_no = return_drwt(soup.select('div.num.bonus > p')[0])[0]

            print(lotto_no)
            print(bonus_no)

            price1 = cleaning(soup.select('tr:nth-of-type(2) > td:nth-of-type(4)')[0].text.strip())
            price2 = cleaning(soup.select('tr:nth-of-type(3) > td:nth-of-type(4)')[0].text.strip())
            price3 = cleaning(soup.select('tr:nth-of-type(4) > td:nth-of-type(4)')[0].text.strip())
            price4 = cleaning(soup.select('tr:nth-of-type(5) > td:nth-of-type(4)')[0].text.strip())
            price5 = cleaning(soup.select('tr:nth-of-type(6) > td:nth-of-type(4)')[0].text.strip())
            print(price1, price2, price3, price4, price5)
        except IndexError as e:
            del soup
            continue

        sp_args = {
            'round': cnt,
            'lotto_no': lotto_no,
            'bonus_no': bonus_no,
            '1st_prize' : price1,
            '2nd_prize' : price2,
            '3rd_prize' : price3,
            '4th_prize' : price4,
            '5th_prize' : price5
        }

        print(sp_args)
        del soup

    browser.close()


def crawl_lotto_lastday():
    """
    """


if __name__ == '__main__':
    crawl_lotto_all()