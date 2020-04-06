#Amedas_CSV_Download
#!ONLY FOR GOOGLE COLAB!

import requests
from bs4 import BeautifulSoup
import csv
from google.colab import files

label = ['日', '気圧(hPa)現地平均', '気圧(hPa)海面平均', '降水量(mm)合計', '降水量(mm)最大1時間', '降水量(mm)最大10分間', '平均気温(℃)', '最高気温(℃)', '最低気温(℃)', '平均湿度(％)', '最小湿度(％)', '風向・風速(m/s)平均風速', '風向・風速(m/s)最大風速風速', '風向・風速(m/s)最大風速風向', '風向・風速(m/s)最大瞬間風速風速', '風向・風速(m/s)最大瞬間風速風向', '日照時間(h)', '雪(cm)降雪合計', '雪(cm)最深積雪値', '天気概況昼(08:30-17:00)', '天気概況夜']

year = 2019

month = 6

url = 'http://www.data.jma.go.jp/obd/stats/etrn/view/daily_s1.php?prec_no=40&block_no=47646&year=' + str(year) + '&month=' + str(month) + '&day=04&view=p1'

response = requests.get(url)

soup = BeautifulSoup(response.content, 'lxml')

b=[]
b.append(label)
for tr in soup.findAll('tr', class_='mtx')[4:]:
  data = tr.findAll('td')
  a = [element.string for element in data]
  b.append(a)


with open('tsukuba.csv', 'w', encoding='utf-16') as file:
      writer = csv.writer(file, dialect='excel-tab', lineterminator='\n')
      writer.writerows(b)
      
files.download('tsukuba.csv')
