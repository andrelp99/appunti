x = 0

import pandas as pd


import os

# Get the current working directory
current_directory = os.getcwd()
print(current_directory)


file_path = r'C:\Users\3106502\Documents\appunti\Python\prove\my_spotify_data\Spotify Extended Streaming History\Streaming_History_Audio_2024_23.json'


df = pd.read_json(file_path)

df.head()

# Count the occurrences of each song and create a new column 'listened'
df['listened'] = df['spotify_track_uri'].map(df['spotify_track_uri'].value_counts())

# Display the dataframe with the new column
df.head()

df_sorted = df.sort_values(by='listened', ascending=False)
df_sorted.head()


df_grouped = df.groupby('spotify_track_uri').agg({
    'master_metadata_track_name': 'first',
    'master_metadata_album_artist_name': 'first',
    'master_metadata_album_album_name': 'first',
    'listened': 'first',
    'skipped': 'sum',
    'ms_played': 'sum',
    'ts': 'max'
}).reset_index()

df_grouped = df_grouped.sort_values(by='listened', ascending=False)
df_grouped
