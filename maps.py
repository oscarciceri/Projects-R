import pandas as pd
import plotly.offline as po
import plotly.graph_objs as pg
import plotly.io as pio
import os

FILE_NAME_HTML = 'result.html'
try:
    os.remove(FILE_NAME_HTML)
except:
    print('File does not exists')
pio.renderers.default = "browser"

po.init_notebook_mode(connected=True)

states_us = {
        'AK': 'Alaska',
        'AL': 'Alabama',
        'AR': 'Arkansas',
        'AS': 'American Samoa',
        'AZ': 'Arizona',
        'CA': 'California',
        'CO': 'Colorado',
        'CT': 'Connecticut',
        'DC': 'District of Columbia',
        'DE': 'Delaware',
        'FL': 'Florida',
        'GA': 'Georgia',
        'GU': 'Guam',
        'HI': 'Hawaii',
        'IA': 'Iowa',
        'ID': 'Idaho',
        'IL': 'Illinois',
        'IN': 'Indiana',
        'KS': 'Kansas',
        'KY': 'Kentucky',
        'LA': 'Louisiana',
        'MA': 'Massachusetts',
        'MD': 'Maryland',
        'ME': 'Maine',
        'MI': 'Michigan',
        'MN': 'Minnesota',
        'MO': 'Missouri',
        'MP': 'Northern Mariana Islands',
        'MS': 'Mississippi',
        'MT': 'Montana',
        'NA': 'National',
        'NC': 'North Carolina',
        'ND': 'North Dakota',
        'NE': 'Nebraska',
        'NH': 'New Hampshire',
        'NJ': 'New Jersey',
        'NM': 'New Mexico',
        'NV': 'Nevada',
        'NY': 'New York',
        'OH': 'Ohio',
        'OK': 'Oklahoma',
        'OR': 'Oregon',
        'PA': 'Pennsylvania',
        'PR': 'Puerto Rico',
        'RI': 'Rhode Island',
        'SC': 'South Carolina',
        'SD': 'South Dakota',
        'TN': 'Tennessee',
        'TX': 'Texas',
        'UT': 'Utah',
        'VA': 'Virginia',
        'VI': 'Virgin Islands',
        'VT': 'Vermont',
        'WA': 'Washington',
        'WI': 'Wisconsin',
        'WV': 'West Virginia',
        'WY': 'Wyoming'
}


def plot_usa(loc, column, title):
    data = dict(
                type='choropleth',
                locations = loc,
                locationmode = 'USA-states',
                z = column,
                text = [states_us.get(i) for i in loc],
                colorscale='RdBu',
                colorbar={'title': 'colorbar'}
                )

    layout = dict(title= title,
                  geo = {'scope': 'usa'})
    x = pg.Figure(data=[data], layout=layout)
    return x


def get_data(csv_file):
    data = pd.read_csv(csv_file)
    data.head()
    return data


def columns(data):
    df = pd.DataFrame(data)
    df = df.dropna(axis=1, how='all')
    data_top = [j for j in df]
    data_top.pop(0)
    return data_top


def gen_results(columns, data):
    x = []
    for i in columns:
        x.append(plot_usa(data['State'], data[i], i))
        # po.plot(x)
    return x


data1 = get_data('HHCAHPS_STATE.csv')
columns_data1 = columns(data1)
x1 = gen_results(columns_data1, data1)

data2 = get_data('STATE.csv')
columns_data2 = columns(data2)
x2 = gen_results(columns_data2, data2)

x = x1 + x2

with open(FILE_NAME_HTML, 'a') as f:
    for j in x:
        f.write(j.to_html(full_html=False, include_plotlyjs='cdn'))
